<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="admin_OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 800px; margin: auto;">
        <tr>
            <td style="padding: 30px;">
                <asp:Repeater ID="rp" runat="server">
                    <ItemTemplate>
                        <table style="width: 200px; height: 200px;">
                            <tr>
                                <td>Order Id: <%#Eval("OrderId")%></td>
                            </tr>
                            <tr>
                                <td>Item Id: <%#Eval("ItemId") %></td>
                            </tr>
                            <tr>
                                <td>Item Name: <%#Eval("ItemName")%></td>
                            </tr>
                            <tr>
                                <td>Qty Id: <%#Eval("QtyOrdered")%></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
    </table>


</asp:Content>

