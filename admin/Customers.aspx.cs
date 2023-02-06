using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Customers : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            disp();
        }
    }
    protected void disp()
    {
        try
        {
            c.Open();
            SqlCommand cmd = new SqlCommand("select * from Customers order by Name",c);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvcustomer.DataSource = dt;
            gvcustomer.DataBind();
            c.Close();
        }
        catch(Exception e1)
        {
            txtmessage.Text = e1.Message;
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string cid = btn.CommandArgument;
        c.Open();
        SqlCommand cmd = new SqlCommand("delete from Customers where CustomerId='" + cid + "'",c);
        cmd.ExecuteNonQuery();
        c.Close();
        disp();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string cid = btn.CommandArgument;
        Response.Redirect("EditCustomer.aspx?CustomerId=" + cid);
    }
}