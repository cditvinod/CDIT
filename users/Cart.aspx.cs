using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class users_Cart : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    String id = "O00";
    protected void Page_Load(object sender, EventArgs e)
    {
        String uid = Request.QueryString["CustomerId"];
        if (!IsPostBack)
        {
            txtdate.Visible = false;
            txtorderid.Visible = false;
            txtdate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtCustId.Visible = false;
            //string id =Session["CustomerLogin"].ToString();
            //c.Open();
            //SqlCommand cmd1 = new SqlCommand("select * from cart where CustomerId='" + uid + "'", c);
            //SqlDataReader dr = cmd1.ExecuteReader();
            //if (dr.Read())
            //{

            //}
            //dr.Dispose();
            //c.Close();
            //gvcart.FooterRow.Cells[3].Text = "Total Amount";
            //gvcart.FooterRow.Cells[4].Text = dt.Compute("Sum(Amt)", "").ToString();

            cust();

            disp();


            OrdersId();
        }
    }
    protected void Del_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        String uid = btn.CommandArgument;
        c.Open();
        SqlCommand cmd = new SqlCommand("delete from cart where CartId=" + uid + "", c);
        cmd.ExecuteNonQuery();
        c.Close();
        disp();
    }
    protected void disp()
    {
        c.Open();
        SqlCommand cmd = new SqlCommand("select * from cart where CustomerId='" + Session["CustomerLogin"] + "'", c);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvcart.DataSource = dt;
        gvcart.DataBind();

        //gvcart.FooterRow.Cells[4].Text = "Total Amount";
        //gvcart.FooterRow.Cells[5].Text = dt.Compute("Sum(Amt)", "").ToString();

        c.Close();
    }
    private void OrdersId()
    {
        c.Open();
        SqlCommand cmd = new SqlCommand("select count(OrderId) from Orders", c);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        c.Close();
        i++;
        txtorderid.Text = id + i.ToString();

    }

    protected void Checkout_Click(object sender, EventArgs e)
    {
        
        for (int i = 0; i < gvcart.Rows.Count; i++)
        {

            string id = Session["CustomerLogin"].ToString();
            string Itemid = gvcart.Rows[i].Cells[0].Text;
            string Itemname = gvcart.Rows[i].Cells[1].Text;
            string Sugar = gvcart.Rows[i].Cells[2].Text;
            string Price = gvcart.Rows[i].Cells[3].Text;
            string Qtyorder = gvcart.Rows[i].Cells[4].Text;
            //string Amount = gvcart.Rows[i].Cells[5].ToString();
            GridViewRow row = gvcart.Rows[i];
            c.Open();
            SqlCommand cmd = new SqlCommand("insert into Orders values('" + txtdate.Text + "','" + txtorderid.Text + "','" + id + "','" + Itemid + "',"+Qtyorder+")", c);
            cmd.ExecuteNonQuery();
            c.Close();
        }


    }
    protected void cust()
    {
        c.Open();
        SqlCommand cmd = new SqlCommand("select * from Customers where CustomerId='" + Session["CustomerLogin"] + "'", c);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtCustId.Text = dr["CustomerId"].ToString();
        }
        dr.Dispose();
        c.Close();
    }
    //protected void Insert(string id,string Itemid,string amt)
    //{

    //    SqlCommand cmd = new SqlCommand("insert into Orders values('" + txtdate.Text + "','" + txtorderid.Text + "','" + id + "','" + Itemid + "','" + amt + "')", c);
    //    c.Open();
    //    cmd.ExecuteNonQuery();
    //  c.Close();
    //}
}