using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_OrderDetails : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        int oid = Convert.ToInt32(Request.QueryString["OrderId"]);
        SqlCommand cmd = new SqlCommand("select * from Orders where OrderId="+oid+"", c);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rp.DataSource = dt;
        rp.DataBind();
    }
}