using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_tea_upload : System.Web.UI.Page
{
    SqlConnection c = connection.getConnection();
    String id = "I00";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            lol();
            
        }
    }
    private void lol()
    {
        c.Open();
        SqlCommand cmd = new SqlCommand("select count(itemid) from tea_table", c);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        c.Close();
        i++;
        txtitemid.Text = id + i.ToString();

    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        try
        {
            if(txtname.Text=="")
            {
                lblmessage.Text = "Enter name ";
            }
            else if(txtprice.Text=="")
            {
                lblmessage.Text = "Enter price";
            }
            else
            {
                c.Open();
                SqlCommand cmd = new SqlCommand("insert into tea_table values('" + txtitemid.Text + "','" + txtname.Text + "','" + ddlSugar.SelectedValue + "',"+txtprice.Text+","+txtQty.Text+", '" + txtitemid.Text + ".jpg" + "','Active')", c);
                cmd.ExecuteNonQuery();
                lblmessage.Text = "Upload successfully";
                fuphoto.SaveAs(Server.MapPath("~/" + "admin/tea_img/" + txtitemid.Text + ".jpg"));
                c.Close();
                lol();
            }
        }
        catch(Exception e1)
        {
            lblmessage.Text = e1.Message;
        }
    }
}