<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Customers.aspx.cs" Inherits="admin_Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <link href="../css/font-awesome.min.css" rel="stylesheet" />

    <style>
        .mydatagrid {
            width: 70%;
            border: solid 2px black;
            min-width: 70%;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:GridView ID="gvcustomer" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CssClass="mydatagrid" PagerStyle-CssClass="pager"
        HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
        <Columns>
            <asp:BoundField DataField="CustomerId" HeaderText="CustomerID" />
            <asp:BoundField DataField="Password" HeaderText="Password" />
            <asp:BoundField DataField="Name" HeaderText="Name">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Mobile" HeaderText="Mobile">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%#Eval("CustomerId") %>' OnClick="btnEdit_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Del">
                <ItemTemplate>
                    <asp:Button ID="btnDel" runat="server" Text="Del" CommandArgument='<%#Eval("CustomerId") %>' OnClick="btnDel_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        <FooterStyle BackColor="#996633" ForeColor="White" HorizontalAlign="Center" Font-Bold="true" />

        <HeaderStyle CssClass="header"></HeaderStyle>

        <PagerStyle CssClass="pager"></PagerStyle>

        <RowStyle CssClass="rows"></RowStyle>

    </asp:GridView>
    <asp:Label ID="txtmessage" runat="server" Text=""></asp:Label>
    <br />
</asp:Content>

