using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class register : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    String id = "C00";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(!IsPostBack)
        {
            txtstate.Visible = false;
            txtcity.Visible = false;
            txtcity.Text = "Bokaro";
            txtstate.Text = "Jharkhand";
            lol();
        }
    }
    private void lol()
    {
        c.Open();
        SqlCommand cmd = new SqlCommand("select count(CustomerId) from Customers", c);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        c.Close();
        i++;
        txtCustId.Text = id + i.ToString();
    }
    protected void btnsignup_Click(object sender, EventArgs e)
    {
        try
        {
            if(txtmobile.Text.Length!=10)
            {
                lblmessage.Text = "Invalid mobile number .";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else if(txtmobile.Text=="")
            {
                lblmessage.Text = "Enter mobile number";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else if(txtname.Text=="")
            {
                lblmessage.Text = "Enter your name";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else if(txtpassword.Text=="")
            {
                lblmessage.Text = "Enter your password";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else if(txtemail.Text =="")
            {
                lblmessage.Text = "Enter your email";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else if (txtaddress.Text == "")
            {
                lblmessage.Text = "Enter your address";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                c.Open();
                //sqlconnect for table signup...
                SqlCommand cmd = new SqlCommand("insert into Customers values('"+txtCustId.Text+"','"+txtmobile.Text+"','"+txtpassword.Text+"','"+txtname.Text+"','"+txtemail.Text+"','"+txtaddress.Text+"','"+txtcity.Text+"','"+txtstate.Text+"')",c);
                cmd.ExecuteNonQuery();
                lblmessage.Text = "Signup Successfully";
                lblmessage.ForeColor = System.Drawing.Color.Green;
                c.Close();
            }

        }
        catch(Exception e1)
        {
            lblmessage.Text = e1.Message;
        }
    }
}