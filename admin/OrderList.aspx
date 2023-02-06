<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="admin_OrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        th {
            background: #197f93;
            color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 90%; margin: auto; margin-top: 50px; margin-bottom: 50px;">
        <asp:HiddenField ID="hdnMobile" runat="server" />
        <asp:HiddenField ID="hdnCustId" runat="server" />

        <asp:Repeater ID="rOrders" runat="server" OnItemDataBound="rOrders_ItemDataBound">

            <ItemTemplate>
                <table style="width: 100%;" border="1">
                    <tr>
                        <th>SL. No. </th>
                        <th>Cust Id</th>
                        <th>Name</th>
                        <th>Date</th>
                        <th>Total Items</th>
                        <th>Print Bill</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:HiddenField ID="hdnDate" runat="server" Value='<%#Eval("Date") %>' />
                            <asp:HiddenField ID="hdnCustId" runat="server" Value='<%#Eval("CustomerId") %>' />
                            <%# Container.ItemIndex + 1 %>
                        </td>
                        <td>
                            <%#Eval("CustomerId")%>
                        </td>
                        <td>
                            <%#Eval("Name") %>
                        </td>
                        <td>
                            <%# Convert.ToDateTime(Eval("Date")).ToString("dd/MM/yyyy hh:mm:ss tt")%>
                        </td>
                        <td>
                            <%#Eval("TotalItems") %>
                        </td>
                        <td>
                            <a href="print-bill.aspx?CustId=<%#Eval("CustomerId") %>&Dt=<%#Eval("Date").ToString().Replace("/","SS").Replace(":","CC") %>" target="_blank">Print Bill</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="5">
                            <br />
                            <asp:Repeater ID="rItems" runat="server">
                                <HeaderTemplate>
                                    <table border="1" style="width: 100%">
                                        <tr>
                                            <th>Order Id
                                            </th>
                                            <th>Item Id
                                            </th>
                                            <th>Item Name
                                            </th>
                                            <th>Qty
                                            </th>
                                            <th>Status
                                            </th>
                                            <th>Processing
                                            </th>
                                            <th>Sent
                                            </th>
                                            <th>Delivered
                                            </th>
                                            <th>Cancel
                                            </th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%#Eval("OrderId") %>
                                        </td>
                                        <td>
                                            <%#Eval("ItemId") %>
                                        </td>
                                        <td>
                                            <%#Eval("ItemName") %>
                                        </td>
                                        <td>
                                            <%#Eval("QtyOrdered") %>
                                        </td>
                                        <td style='color: #fff; background: <%#(Eval("Status").ToString()=="Active")?"red":"green"%>'>
                                            <%#Eval("Status") %>
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="btnProcessing" runat="server" ImageUrl="~/processing.png" Width="30" Height="30" CommandArgument='<%#Eval("Orderid") %>' OnClick="btnProcessing_Click" />

                                        </td>
                                        <td>
                                            <asp:ImageButton ID="btnSent" runat="server" ImageUrl="~/OrderSent.jpeg" Width="30" Height="30" CommandArgument='<%#Eval("Orderid") %>' OnClick="btnSent_Click" />

                                        </td>
                                        <td>
                                            <asp:ImageButton ID="btnDelivered" runat="server" ImageUrl="~/Delivered.png" Width="30" Height="30" CommandArgument='<%#Eval("Orderid") %>' OnClick="btnDelivered_Click" />

                                        </td>
                                        <td>
                                            <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Cancel.jpeg" Width="30" Height="30" CommandArgument='<%#Eval("OrderId") %>' OnClick="btnCancel_Click" />

                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                    <br />
                                    <br />
                                </FooterTemplate>
                            </asp:Repeater>

                        </td>
                    </tr>
                </table>

            </ItemTemplate>

        </asp:Repeater>
    </div>
</asp:Content>

