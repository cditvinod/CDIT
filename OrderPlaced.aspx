<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderPlaced.aspx.cs" Inherits="OrderPlaced" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }

        .auto-style2 {
            font-size: x-large;
            color: #0033CC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 300px; text-align: left; margin-top: 50px; margin-left: 200px;">
        <asp:HiddenField ID="hdnMobile" runat="server" />
        <asp:HiddenField ID="hdnName" runat="server" />
        <asp:HiddenField ID="hdnAddress" runat="server" />
        Dear Customer,<br />
        <br />
        <span class="auto-style2">Thank you for placing your order with Us! </span>
        <br />
        Your total bill is: Rs. <asp:Label ID="lblAmt1" runat="server" Text=""></asp:Label>
        <br class="auto-style1" />
        Your beverages will be delivered within 30 minustes.
        <br />
        <br />
        <br />
        <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click">Logout</asp:LinkButton>
        <br />
        <br />
    </div>
</asp:Content>

