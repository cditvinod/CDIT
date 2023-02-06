<%@ Page Title="" Language="C#" MasterPageFile="~/users/user.master" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="users_MyOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 1100px; margin: auto;">
        <tr style="min-height: 300px;">
            <td>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

