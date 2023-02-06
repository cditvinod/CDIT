using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class users_MyOrders : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        c.Open();
        SqlCommand cmd = new SqlCommand("select * from Orders where CustomerId='" + Session["CustomerLogin"] + "'", c);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        c.Close();
    }
}