using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtCustomerId.Text == "")
            {
                lblmessage.Text = "Enter your Customer Id or Mobile number";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else if (txtpassword.Text == "")
            {
                lblmessage.Text = "Enter your password";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                c.Open();
                SqlCommand cmd = new SqlCommand("select * from Customers where CustomerId='" + txtCustomerId.Text + "'", c);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["Password"].ToString() == txtpassword.Text)
                    {
                        Session["CustomerLogin"] = txtCustomerId.Text;
                        this.Master.labeldisp();
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        lblmessage.Text = "Invalid mobile or password";
                    }
                }
                else
                {
                    lblmessage.Text = "Invalid mobile or password";
                }
            }

        }
        catch (Exception e1)
        {
            lblmessage.Text = e1.Message;
        }
    }
    protected void btnForgotPassword_Click(object sender, EventArgs e)
    {
        if (txtCustomerId.Text == "")
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Kindly enter Customer Id.')</script>");
        }
        else
        {
            c.Open();
            SqlCommand cmd = new SqlCommand("select * from Customers where CustomerId='" + txtCustomerId.Text + "'", c);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                hdnPassword.Value = dr["Password"].ToString();
                hdnMobile.Value = dr["Mobile"].ToString();
                hdnName.Value = dr["Name"].ToString();
                SMS.SendSMS(hdnMobile.Value, "Dear " + hdnName.Value + " (Customer id: " + txtCustomerId.Text + "), Your Password is: " + hdnPassword.Value);
                Response.Write("<script LANGUAGE='JavaScript' >alert('Password sent on to your Mobile.')</script>");
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Either your Id is wrong or your mobile no. is not registered with us.')</script>");
            }
            c.Close();
        }

    }

    protected void btnSignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signup.aspx");
    }
}