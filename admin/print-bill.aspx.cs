using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_print_bill : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["CustId"] != null && Request.QueryString["Dt"] != null)
            {
                string custId = Request.QueryString["CustId"];
                DateTime dt = Convert.ToDateTime(Request.QueryString["Dt"].Replace("SS", "/").Replace("CC", ":"));
                disp(custId, dt);
            }
        }
    }
    protected void disp(string custId, DateTime dt1)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select Date,CustomerId,TotalItems=count(*) from Orders where CustomerId=" + custId + " and Date='" + dt1 + "' group by Date,CustomerId order by Date desc", c);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rOrders.DataSource = dt;
            rOrders.DataBind();
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
        }
    }
    protected void rOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HiddenField hdnDate = (HiddenField)e.Item.FindControl("hdnDate");
                HiddenField hdnCustId = (HiddenField)e.Item.FindControl("hdnCustId");
                SqlCommand cmd = new SqlCommand("select o.OrderId,o.ItemId,o.ItemName,o.QtyOrdered,tt.Price,Amount=tt.Price*o.QtyOrdered from Orders o join tea_table tt on o.ItemId=tt.ItemId where o.CustomerId='" + hdnCustId.Value + "' AND o.Date='" + hdnDate.Value + "'", c);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater rItems = (Repeater)e.Item.FindControl("rItems");
                rItems.DataSource = dt;
                rItems.DataBind();
                decimal total = 0;
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        total += Convert.ToDecimal(dr["Amount"]);
                    }
                }
                lblTotal.Text = total.ToString("N");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}