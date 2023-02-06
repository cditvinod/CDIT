using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class adminlogin : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtid.Text == "")
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
                SqlCommand cmd = new SqlCommand("select * from admin where userid='" + txtid.Text + "'", c);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["password"].ToString() == txtpassword.Text)
                    {
                        Session["adminlogin"] = txtid;

                        Response.Redirect("~/admin/OrderList.aspx");
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
}