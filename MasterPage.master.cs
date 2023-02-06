using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["CustomerLogin"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please Login')</script>");
            }
            else
            {
                c.Open();
                SqlCommand cmd = new SqlCommand("select * from Customers where CustomerId='" + Session["CustomerLogin"] + "'", c);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblName.Text = dr["Name"].ToString();
                }
                dr.Close();
                c.Close();                
            }
            Cart();
        }
    }
    public void Cart()
    {
        if (Session["CustomerLogin"] != null)
        {
            c.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from cart where CustomerId='" + Session["CustomerLogin"] + "'", c);
            txtCart.Text = cmd.ExecuteScalar().ToString(); 
            c.Close();
            btnLogout.Visible = true;
            btnLogin.Visible = false;
            btnProfile.Visible = true;
            btnChangePassword.Visible = true;
            btnOrders.Visible = true;
        }
        else
        {
            btnLogout.Visible = false;
            btnLogin.Visible = true;
            btnProfile.Visible = false;
            btnOrders.Visible = false;
            btnChangePassword.Visible = false;
            c.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from cart where SessionId='" + Session.SessionID + "'", c);
            txtCart.Text = cmd.ExecuteScalar().ToString();
            c.Close();
        }    
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session["CustomerLogin"] = null;
        Response.Redirect("Default.aspx");
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    public void labeldisp()
    {
        lblWelcome.Visible = false;
    }
    protected void btnProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/users/Profiles.aspx");
    }
    protected void btnOrders_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/users/MyOrders.aspx");
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/users/Password.aspx");
    }
}
