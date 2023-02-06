using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_Orders : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminlogin"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                disp();
            }
        }
    }
    protected void btnProcessing_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        int oid = Convert.ToInt32(btn.CommandArgument);
        String st = "Processing";
        upstat(oid, st);
        SMS.SendSMS(hdnMobile.Value, "Your order is processing now.");
        Response.Write("<script LANGUAGE='JavaScript' >alert('Status - Processing updated')</script>");
        disp();
    }
    protected void btnSent_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        int oid = Convert.ToInt32(btn.CommandArgument);
        String st = "Order Sent";
        upstat(oid, st);
        SMS.SendSMS(hdnMobile.Value, "Our delivery boy is on the way to deliver you Order.");
        Response.Write("<script LANGUAGE='JavaScript' >alert('Status - Sent Order updated')</script>");
        disp();
    }
    protected void btnDelivered_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        int oid = Convert.ToInt32(btn.CommandArgument);
        String st = "Delivered";
        upstat(oid, st);
        SMS.SendSMS(hdnMobile.Value, "Your order id successfully Delivered. We will be happy to serve you again and again.");
        Response.Write("<script LANGUAGE='JavaScript' >alert('Status - Delivered updated')</script>");
        disp();
    }
    
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        int oid = Convert.ToInt32(btn.CommandArgument);
        String st = "Cancelled";
        upstat(oid, st);
        SMS.SendSMS(hdnMobile.Value, "Order Cancelled. If you are not expecting this message, kindly call 7004701320.");
        Response.Write("<script LANGUAGE='JavaScript' >alert('Status - Cancelled updated')</script>");
        disp();
    }
    protected void upstat(int id, String sta)
    {
        c.Open();
        SqlCommand cmd = new SqlCommand("update Orders set Status='" + sta + "' where OrderId=" + id + "", c);
        cmd.ExecuteNonQuery();

        SqlCommand cmd1 = new SqlCommand("select * from Orders where OrderId=" + id + "", c);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.Read())
        {
            hdnCustId.Value = dr1["CustomerId"].ToString();
        }
        dr1.Close();

        SqlCommand cmd2 = new SqlCommand("select * from Customers where CustomerId='" + hdnCustId.Value + "'", c);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        if (dr2.Read())
        {
            hdnMobile.Value = dr2["Mobile"].ToString();
        }
        dr2.Close();
        c.Close();
    }
    protected void disp()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select * from Orders order by OrderId desc", c);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int oid = Convert.ToInt32(btn.CommandArgument);
        Response.Redirect("OrderDetails.aspx?OrderId=" + oid);
    }
}