<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-size: large;
            color: #000099;
            text-align: center;
        }

        .auto-style2 {
            font-size: x-large;
        }
        .paypanel {
            border: 1px solid;
            border-radius: 10px;
            padding: 10px;
            width: 360px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <table style="width: 800px; margin: auto; height: 600px;">
        <tr style="height: 40px;">
            <td colspan="3" style="font-size: 30px; text-align: center; background-color: #ffd800;">PAY</td>
        </tr>
        <tr style="margin: auto;">
            <td style="width: 40%; vertical-align: top;">
                <img src="PayMode.jpg" width="250" />
            </td>
            <td style="width: 60%; vertical-align: top;"><br />
                <div style="font-size:22px;">
                Pay Rs. <%=Session["TotAmt"] %>
                    </div>
                <br /><span class="auto-style1">
                
                <strong>PAYMENT MODE&nbsp; </strong></span>
                &nbsp;<asp:DropDownList ID="ddlPayMode" runat="server" Width="200px" Height="40px" AutoPostBack="True" OnSelectedIndexChanged="ddlPayMode_SelectedIndexChanged">
                    <asp:ListItem>Choose Pay Mode</asp:ListItem>
                    <asp:ListItem>Paytm</asp:ListItem>
                    <asp:ListItem>Google Pay</asp:ListItem>
                    <asp:ListItem>BHIM UPI</asp:ListItem>
                    <asp:ListItem>PhonePe</asp:ListItem>
                    <asp:ListItem>Bank Transfer</asp:ListItem>
                    <asp:ListItem>COD</asp:ListItem>
                </asp:DropDownList><br />
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <br />
                <asp:Panel ID="payPanel" runat="server">
                    <asp:Panel ID="PaytmPanel" runat="server"  CssClass="paypanel">

                        <p>
                            Kidly Paytm us at
                            <br />
                            <span class="auto-style2">9801360327</span>
                        </p>
                        <p>Or, You can scan the following QR Code</p>
                        <p>
                            <img src="img/paytm.jpg" width="200" />
                        </p>

                    </asp:Panel>
                    <asp:Panel ID="GooglePayPanel" runat="server"  CssClass="paypanel">
                        <p>Kidly Google Pay us at <span class="auto-style2">9801360327</span></p>

                    </asp:Panel>
                    <asp:Panel ID="BhimUpiPanel" runat="server"  CssClass="paypanel">
                        <p>Kidly Pay through BHIM UPI</p>
                        <p>
                            <img src="img/bhim.jpg" width="200" />
                        </p>

                    </asp:Panel>
                    <asp:Panel ID="PhonePePanel" runat="server"  CssClass="paypanel">
                        <p>
                            <img src="img/phonepe.jpg" width="200" />
                        </p>

                    </asp:Panel>
                    <asp:Panel ID="BankTransferPanel" runat="server"  CssClass="paypanel">
                        <table style="width: 300px;">
                            <tr>
                                <td colspan="2"><b>BANK DETAILS</b></td>
                            </tr>
                            <tr>
                                <td>Account Name</td>
                                <td>CDIT INFOTECH PVT. LTD.</td>
                            </tr>
                            <tr>
                                <td>Bank's Name</td>
                                <td>Indian Bank</td>
                            </tr>
                            <tr>
                                <td>Account No.</td>
                                <td>965392284</td>
                            </tr>
                            <tr>
                                <td>IFSC Code</td>
                                <td>IDIB000B081</td>
                            </tr>
                            <tr>
                                <td>Branch</td>
                                <td>City Centre, Sector-4</td>
                            </tr>
                        </table>

                    </asp:Panel>
                    <asp:Panel ID="CODPanel" runat="server" CssClass="paypanel">
                        <br />
                        <br />
                        <p style="font-size: large">
                            Click on Confirm Order to place order on COD
                            <br />
                            <br />
                            
                        </p>
                    </asp:Panel>
              
                </asp:Panel>     
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                 <b>Trans Id  </b><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm Order" OnClick="btnConfirm_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

