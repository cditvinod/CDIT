using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class OrderPlaced : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CustomerLogin"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                c.Open();
                SqlCommand cmd3 = new SqlCommand("select * from Customers where CustomerId='" + Session["CustomerLogin"] + "'", c);
                SqlDataReader dr1 = cmd3.ExecuteReader();
                if (dr1.Read())
                {
                    hdnMobile.Value = dr1["Mobile"].ToString();
                    hdnName.Value = dr1["Name"].ToString();
                    hdnAddress.Value = dr1["Address"].ToString();
                    
                }
                lblAmt1.Text = Session["TotAmt"].ToString();
                SMS.SendSMS(hdnMobile.Value, "Thank you for placing your order with The Chai Dhaba. Our delivery boy will be serving you within 30 minutes");
                SMS.SendSMS("7004701320", "A new order from " + hdnName.Value + " (Customer id: " + Session["CustomerLogin"] + "), Mobile No. " + hdnMobile.Value + " and Address " + hdnAddress.Value + " is placed with us. Start processing the order.");
                dr1.Close();
                c.Close();
            }
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session["CustomerLogin"] = null;
        Response.Redirect("Default.aspx");
    }
}