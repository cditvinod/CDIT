using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cart : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CustomerLogin"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Kindly Login')</script>");
                Response.Redirect("Login.aspx");
            }
            else
            {
                disp();
            }
        }
    }
    protected void disp()
    {
        SqlCommand cmd = new SqlCommand("select * from cart where CustomerId='" + Session["CustomerLogin"] + "'", c);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        decimal total = 0;
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                total += Convert.ToDecimal(dr["Rate"]) * Convert.ToInt32(dr["QtyOrdered"]);
            }
        }
        lblAmt.Text = total.ToString("N");
        Session["TotAmt"] = lblAmt.Text;
    }


    protected void Del_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        String uid = btn.CommandArgument;
        c.Open();
        SqlCommand cmd = new SqlCommand("delete from cart where ItemId='" + uid + "'", c);
        cmd.ExecuteNonQuery();
        c.Close();
        disp();
        this.Master.Cart();
    }
    protected void btnproceed_Click(object sender, EventArgs e)
    {
        c.Open();

        SqlCommand cmd3 = new SqlCommand("select * from Customers where CustomerId='" + Session["CustomerLogin"] + "'", c);
        SqlDataReader dr3 = cmd3.ExecuteReader();
        if (dr3.Read())
        {
            hdnName.Value = dr3["Name"].ToString();
        }
        dr3.Close();

        SqlCommand cmd = new SqlCommand("select  * from cart where CustomerId = '" + Session["CustomerLogin"] + "'", c);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                SqlConnection con = connection.getConnection();
                con.Open();
                decimal amt = (Convert.ToDecimal(dr["Rate"]) * Convert.ToDecimal(dr["QtyOrdered"]));
                SqlCommand cmd1 = new SqlCommand("insert into Orders(Date, CustomerId, Name, ItemId, ItemName, Sugar, QtyOrdered, Rate, Amt, Status) values('" + DateTime.Now + "','" + Session["CustomerLogin"] + "','"+ hdnName.Value +"', '" + dr["ItemId"] + "','" + dr["ItemName"] + "','" + dr["Sugar"] + "','" + dr["QtyOrdered"] + "','" + dr["Rate"] + "'," + amt + ",'Active')", con);
                cmd1.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("delete from cart where CustomerId='" + Session["CustomerLogin"] + "'", con);
                cmd2.ExecuteNonQuery();
                con.Close();
            }

            dr.Close();

            c.Close();
            Response.Redirect("Payment.aspx?CustomerId=" + Session["CustomerLogin"]);
        }
        else
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('No Item in Cart. Kindly add at least one Item from the list.')</script>");
        }
    }
}