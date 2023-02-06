using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Signup : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    //String id = "C00";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            txtstate.Visible = false;
            txtcity.Visible = false;
            txtcity.Text = "Bokaro";
            txtstate.Text = "Jharkhand";
            btnOTP.Visible = false;
            txtOTP.Visible = false;
            //lol();
        }
    }

    protected void btnsignup_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtmobile.Text.Length != 10)
            {
                lblmessage.Text = "Invalid mobile number .";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else if (txtmobile.Text == "")
            {
                lblmessage.Text = "Enter mobile number";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else if (txtname.Text == "")
            {
                lblmessage.Text = "Enter your name";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else if (txtpassword.Text == "")
            {
                lblmessage.Text = "Enter your password";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }

            else if (txtaddress.Text == "")
            {
                lblmessage.Text = "Enter your address";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int otp = RandomNumber(1000, 9999);
                hdnPassword.Value = txtpassword.Text;
                c.Open();
                //sqlconnect for table signup...
                SqlCommand cmd = new SqlCommand("insert into Customers values('" + txtmobile.Text + "','" + txtmobile.Text + "','" + txtpassword.Text + "','" + txtname.Text + "','" + txtemail.Text + "','" + txtaddress.Text + "','" + txtcity.Text + "','" + txtstate.Text + "',"+otp+",'Inactive')", c);
                cmd.ExecuteNonQuery();
                lblmessage.Text = "OTP Sent";
                lblmessage.ForeColor = System.Drawing.Color.Green;
                c.Close();
                txtOTP.Visible = true;
                btnOTP.Visible = true;
                btnsignup.Visible = false;
                SMS.SendSMS(txtmobile.Text, "Your OTP is "+otp);
                SMS.SendSMS("9801360327", "OTP is: " + otp + " for " + txtname.Text + " and Id: " + txtmobile.Text);
            }
        }
        catch(Exception e1)
        {
            lblmessage.Text = e1.Message;
            //lblmessage.Text = "This Mobile No. is already registered with us. You can Login or Call us at 7004701320 for any Help.";
        }
    }
    public int RandomNumber(int min, int max)
    {
        Random random = new Random();
        return random.Next(min, max);
    }
    protected void btnOTP_Click(object sender, EventArgs e)
    {
        c.Open();
        SqlCommand cmd = new SqlCommand("select * from Customers where CustomerId='" + txtmobile.Text + "'", c);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr["OTP"].ToString() == txtOTP.Text)
            {
                dr.Close();
                SqlConnection c1 = connection.getConnection();
                c1.Open();
                SqlCommand cmd1 = new SqlCommand("update Customers set Status='Active', otp='' where CustomerId='" + txtmobile.Text + "'", c1);
                cmd1.ExecuteNonQuery();
                lblmessage.Text = "Signed Up Successfully";
                lblmessage.ForeColor = System.Drawing.Color.Green;
                txtOTP.Visible = false;
                btnOTP.Visible = false;
                SMS.SendSMS(txtmobile.Text, "Thank you for registering with us. Your Customer id is " + txtmobile.Text + " and Password is: " + hdnPassword.Value + ". Kindly Login and start ordering for Tea/Coffee/Milk.");
                Response.Write("<script LANGUAGE='JavaScript' >alert('You are successfully registered. Now Login and start placing Order.')</script>");
                c1.Close();
            }
            else
            {
                lblmessage.Text = "Invalid OTP. Try again.";
                SqlCommand cmd2 = new SqlCommand("delete from Customrs where CustomerId='" + txtCustId.Text + "'", c);
                cmd2.ExecuteNonQuery();
                lblmessage.Text = "Could not Signed up successfully. Kindly try again.";
            }
        }
        dr.Close();
        c.Close();
    }
}