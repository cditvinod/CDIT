using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            if(txtmobile.Text== "")
            {
                lblmessage.Text = "Enter your mobile number";
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
                SqlCommand cmd = new SqlCommand("select * from Customers where Mobile='"+txtmobile.Text+"'",c);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["Password"].ToString() == txtpassword.Text)
                    {
                        Session["CustomerLogin"] = txtmobile.Text;

                        Response.Redirect("~/users/users.aspx?mobile=" + txtmobile.Text);
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
        catch(Exception e1)
        {
            lblmessage.Text = e1.Message;
        }
    }
}