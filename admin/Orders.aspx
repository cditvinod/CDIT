<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="admin_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 90%; margin: auto; margin-top: 50px; margin-bottom: 50px;">
        <asp:HiddenField ID="hdnCustId" runat="server" />
        <asp:HiddenField ID="hdnMobile" runat="server" />
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Style="margin: auto;" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="Order Id" />
                <asp:BoundField DataField="Date" HeaderText="Date" />
                <asp:BoundField DataField="CustomerId" HeaderText="Cust Id" />
                <asp:BoundField DataField="ItemId" HeaderText="Item Id" />
                <asp:BoundField DataField="ItemName" HeaderText="Item Id" />
                <asp:BoundField DataField="Sugar" HeaderText="Item Id" />
                <asp:BoundField DataField="QtyOrdered" HeaderText="Qty" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:TemplateField HeaderText="Update">
                    <ItemTemplate>
                        <asp:Button ID="btnView" runat="server" Text="View" CommandArgument='<%#Eval("Orderid") %>' OnClick="btnView_Click" />
                        <asp:ImageButton ID="btnProcessing" runat="server" ImageUrl="~/processing.png" Width="30" Height="30" CommandArgument='<%#Eval("Orderid") %>' OnClick="btnProcessing_Click" />
                        <asp:ImageButton ID="btnSent" runat="server" ImageUrl="~/OrderSent.jpeg" Width="30" Height="30" CommandArgument='<%#Eval("Orderid") %>' OnClick="btnSent_Click" />
                        <asp:ImageButton ID="btnDelivered" runat="server" ImageUrl="~/Delivered.png" Width="30" Height="30" CommandArgument='<%#Eval("Orderid") %>' OnClick="btnDelivered_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cancel">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Cancel.jpeg" Width="30" Height="30" CommandArgument='<%#Eval("OrderId") %>' OnClick="btnCancel_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
</asp:Content>

