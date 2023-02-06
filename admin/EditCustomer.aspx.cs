using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_EditCustomer : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String cid = Request.QueryString["CustomerId"];
            c.Open();
            SqlCommand cmd = new SqlCommand("select * from Customers where CustomerId='" + cid + "'", c);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblCustomerId.Text = cid;
                txtPassword.Text = dr["Password"].ToString();
                txtName.Text = dr["Name"].ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtMobile.Text = dr["Mobile"].ToString();
                txtEmail.Text = dr["Email"].ToString();
            }
            dr.Dispose();
            c.Close();           
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        c.Open();
        SqlCommand cmd = new SqlCommand("update Customers set Password='" + txtPassword.Text + "', Name='" + txtName.Text + "', Address='" + txtAddress.Text + "', Mobile='" + txtMobile.Text + "', Email='" + txtEmail.Text + "' where CustomerId='" + lblCustomerId.Text + "'", c);
        cmd.ExecuteNonQuery();
        c.Close();
        Response.Redirect("Customers.aspx");
    }
}