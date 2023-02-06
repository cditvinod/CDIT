<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print-bill.aspx.cs" Inherits="admin_print_bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
            <asp:HiddenField ID="hdnMobile" runat="server" />
            <asp:HiddenField ID="hdnCustId" runat="server" />

            <asp:Repeater ID="rOrders" runat="server" OnItemDataBound="rOrders_ItemDataBound">

                <ItemTemplate>
                    <table style="width: 500px;" border="1">
                        <tr style="height: 100px;">
                            <td colspan="3" style="font-size: 12px; text-align: center;">
                                <img src="../img/logoH copy.png" width="150" /><br />
                                GE-15, City Centre, Sector-4
                            </td>
                        </tr>
                        <tr>
                            <%--<th>SL. No. </th>--%>
                            <th>Customer Id</th>
                            <th>Date</th>
                            <th>Total Items</th>
                        </tr>
                        <tr>
                            <%--<td>
                                    
                                    <%# Container.ItemIndex + 1 %>
                                </td>--%>
                            <td style="text-align: center;">
                                <asp:HiddenField ID="hdnDate" runat="server" Value='<%#Eval("Date") %>' />
                                <asp:HiddenField ID="hdnCustId" runat="server" Value='<%#Eval("CustomerId") %>' />
                                <%#Eval("CustomerId")%>
                            </td>
                            <td style="text-align: center;">
                                <%# Convert.ToDateTime(Eval("Date")).ToString("dd/MM/yyyy hh:mm:ss tt")%>
                            </td>
                            <td style="text-align: center;">
                                <%#Eval("TotalItems") %>
                            </td>
                        </tr>
                        <tr>
                            <%--<td></td>--%>
                            <td colspan="3">
                                <br />
                                <asp:Repeater ID="rItems" runat="server">
                                    <HeaderTemplate>
                                        <table border="1" style="width: 480px; margin: auto;">
                                            <tr>
                                                <th style="width: 50px;">S. No.
                                                </th>
                                                <%--<th>Item Id
                                                    </th>--%>
                                                <th style="width: 200px;">Item Name
                                                </th>
                                                <th>Qty
                                                </th>
                                                <th>Rate
                                                </th>
                                                <th>Amount
                                                </th>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td style="text-align: center">
                                                <%# Container.ItemIndex + 1 %>
                                                <%--<%#Eval("OrderId") %>--%>
                                            </td>
                                            <%--<td>
                                                    <%#Eval("ItemId") %>
                                                </td>--%>
                                            <td style="text-align: center">
                                                <%#Eval("ItemName") %>
                                            </td>
                                            <td style="text-align: center">
                                                <%#Eval("QtyOrdered") %>
                                            </td>
                                            <td style="text-align: center">
                                                <%#Eval("Price") %>
                                            </td>
                                            <td style="text-align: center">
                                                <%#Eval("Amount") %>
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
            <table border="1" style="width: 500px;">
                <tr style="height: 40px;">
                    <td style="text-align: center;">Total Amount :
                            <asp:Label ID="lblTotal" runat="server" Style="font-weight: 700; font-size: large"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Call: <strong>700 470 1320 | </strong>Order Us at: <strong>www.thechaidhaba.com </strong>
                    </td>
                </tr>
            </table>
            </center>
        </div>
    </form>
</body>
</html>
