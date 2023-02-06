using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payment : System.Web.UI.Page
{
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
                if (Request.Browser.IsMobileDevice)
                {
                    Response.Redirect("OrderPlaced.aspx");                    
                }               
                PaytmPanel.Visible = false;
                GooglePayPanel.Visible = false;
                BhimUpiPanel.Visible = false;
                PhonePePanel.Visible = false;
                BankTransferPanel.Visible = false;
                CODPanel.Visible = false;
            }
        }
    }

    protected void ddlPayMode_SelectedIndexChanged(object sender, EventArgs e)
    {
        PaytmPanel.Visible = false;
        GooglePayPanel.Visible = false;
        PhonePePanel.Visible = false;
        BankTransferPanel.Visible = false;
        CODPanel.Visible = false;
        BhimUpiPanel.Visible = false;
        if (ddlPayMode.SelectedValue == "Paytm")
        {
            PaytmPanel.Visible = true;
        }
        else if (ddlPayMode.SelectedValue == "Google Pay")
        {
            GooglePayPanel.Visible = true;
        }
        else if (ddlPayMode.SelectedValue == "BHIM UPI")
        {
            BhimUpiPanel.Visible = true;
        }
        else if (ddlPayMode.SelectedValue == "PhonePe")
        {
            PhonePePanel.Visible = true;
        }
        else if (ddlPayMode.SelectedValue == "Bank Transfer")
        {
            BankTransferPanel.Visible = true;
        }
        else if (ddlPayMode.SelectedValue == "COD")
        {
            Response.Redirect("OrderPlaced.aspx");
        }
        else
        {
            lblMessage.Text = "Choose Payment Mode";
        }
    }
    protected void Confirm()
    {
        Response.Redirect("OrderPlaced.aspx");
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrderPlaced.aspx");
    }
}