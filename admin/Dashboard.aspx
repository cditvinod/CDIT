<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 350px; margin-top: 30px; width: 100%" class="text-center">
        No. of Orders: <asp:Label ID="lblTotalOrders" runat="server" Text=""></asp:Label><br />
        Total Amount: <asp:Label ID="lblAmt" runat="server" Text=""></asp:Label>

    </div>
</asp:Content>

