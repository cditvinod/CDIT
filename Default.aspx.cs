using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dispProducts();
        }
    }
    protected void btncart_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        String iid = btn.CommandArgument;

        c.Open();
        SqlCommand cmd = new SqlCommand("select * from tea_table where ItemId='" + iid + "'", c);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            hdnItemId.Value = dr["ItemId"].ToString();
            hdnItemName.Value = dr["Name"].ToString();
            hdnRate.Value = dr["Price"].ToString();
            hdnSugar.Value = dr["Sugar"].ToString();
            dr.Dispose();

            RepeaterItem item = btn.NamingContainer as RepeaterItem;
            int Qty = Convert.ToInt32((item.FindControl("txtQty") as TextBox).Text);

            if (Qty < 1)
            {
                //lblmessage.Text = "Kindly choose Qty";
                Response.Write("<script LANGUAGE='JavaScript' >alert('Kindly choose Qty. Negative number or 0 cannot be placed.')</script>");
            }
            else
            {
                int Amt = (Convert.ToInt32(hdnRate.Value) * Qty);
                if (Session["CustomerLogin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    SqlCommand c1 = new SqlCommand("select * from Cart where CustomerId='" + Session["CustomerLogin"] + "' and ItemId='" + hdnItemId.Value + "'", c);
                    SqlDataReader dr1 = c1.ExecuteReader();
                    if (dr1.HasRows)
                    {
                        dr1.Close();
                        SqlCommand cmd1 = new SqlCommand("update cart set QtyOrdered = QtyOrdered + " + Qty + "  where CustomerId='" + Session["CustomerLogin"] + "' and ItemId='" + hdnItemId.Value + "'", c);
                        cmd1.ExecuteNonQuery();
                        this.Master.Cart();
                        lblmessage.Text = "Item updated. Add more Items or go to the option Tea Cart at the top of the page to Confirm your Order.";
                    }
                    else
                    {
                        dr1.Close();
                        SqlCommand cmd1 = new SqlCommand("insert into cart values('" + Session["CustomerLogin"] + "','" + hdnItemId.Value + "','" + hdnItemName.Value + "','" + hdnSugar.Value + "','" + hdnRate.Value + "'," + Qty + "," + Amt + ",'" + Session["CustomerLogin"] + "')", c);
                        cmd1.ExecuteNonQuery();
                        this.Master.Cart();
                        lblmessage.Text = "Item Added. Add more Items or go to the option Tea Cart at the top of the page to Confirm your Order.";
                    }
                }
            }
        }
    }
    protected void dispProducts()
    {
        SqlCommand cmd = new SqlCommand("select * from tea_table order by CAST(substring(ItemId,4,3) AS int)", c);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rp.DataSource = dt;
        rp.DataBind();
        txtip.Visible = false;
    }
}