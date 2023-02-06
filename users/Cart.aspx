<%@ Page Title="" Language="C#" MasterPageFile="~/users/user.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="users_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/font-awesome.min.css" rel="stylesheet" />

    <style>
        .mydatagrid {
            width: 50%;
            border: solid 2px black;
            min-width: 50%;
        }

        .header {
            background-color: #646464;
            font-family: Arial;
            color: White;
            border: none 0px transparent;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }

        .rows {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
            border: solid 1px black;
        }

            .rows:hover {
                background-color: #ff8000;
                font-family: Arial;
                color: #fff;
                text-align: left;
            }

        .selectedrow {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            font-weight: bold;
            text-align: left;
        }

        .mydatagrid a /** FOR THE PAGING ICONS  **/ {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

            .mydatagrid a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/ {
                background-color: #000;
                color: #fff;
            }

        .mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
            background-color: #c9c9c9;
            color: #000;
            padding: 5px 5px 5px 5px;
        }

        .pager {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }

        .mydatagrid td {
            padding: 5px;
        }

        .mydatagrid th {
            padding: 5px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label ID="txtdate" runat="server" Text=""></asp:Label>
    <asp:Label ID="txtorderid" runat="server" Text=""></asp:Label>
    <asp:Label ID="txtCustId" runat="server" Text=""></asp:Label>
    <br />
    <asp:GridView ID="gvcart" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CssClass="mydatagrid" PagerStyle-CssClass="pager"
        HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="ItemId" HeaderText="ItemId" />
            <asp:BoundField DataField="ItemName" HeaderText="Item Name">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Sugar" HeaderText="Sugar">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Rate" HeaderText="Price">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="QtyOrdered" HeaderText="Quantity Ordered">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Amount">
                <ItemTemplate>
                    <asp:Label ID="lblAmt" runat="server" Style="font-weight: 700; background-color: transparent"
                        Text='<%# ((Convert.ToInt32(Eval("Rate")))*(Convert.ToInt32(Eval("QtyOrdered"))))%>'>
                    </asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <%--<FooterTemplate>
                                <asp:Button ID="btncheck" runat="server" Text="CheckOut" />
                            </FooterTemplate>--%>
                <%--<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />--%>
                            
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Del">
                <ItemTemplate>
                    <asp:Button ID="Del" runat="server" CommandArgument='<%#Eval("CartId") %>' Text="Del" OnClick="Del_Click" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>

        <FooterStyle BackColor="#996633" ForeColor="White" HorizontalAlign="Center" Font-Bold="true" />

        <HeaderStyle CssClass="header"></HeaderStyle>

        <PagerStyle CssClass="pager"></PagerStyle>

        <RowStyle CssClass="rows"></RowStyle>

    </asp:GridView>
    <br />
    <center>
    <asp:Button ID="Checkout" runat="server" Text="CheckOut" OnClick="Checkout_Click" />
</center>
    <br />

</asp:Content>

