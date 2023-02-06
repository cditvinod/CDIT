<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <asp:HiddenField ID="hdnMobile" runat="server" />
    <asp:HiddenField ID="hdnName" runat="server" />
    <asp:HiddenField ID="hdnAddress" runat="server" />
    <asp:GridView ID="GridView1" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="ItemId" HeaderText="Itemid" />
            <asp:BoundField DataField="ItemName" HeaderText="ItemName" />
            <asp:BoundField DataField="Sugar" HeaderText="Sugar" />
            <asp:BoundField DataField="Rate" HeaderText="Price" />
            <asp:BoundField DataField="QtyOrdered" HeaderText="Qty" />
            <asp:TemplateField HeaderText="Amt">
                <ItemTemplate>
                    <%# Convert.ToDecimal(Eval("Rate"))* Convert.ToInt32(Eval("QtyOrdered")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Del">
                <ItemTemplate>
                    <asp:Button ID="Del" runat="server" CommandArgument='<%#Eval("ItemId") %>' Text="Del" OnClick="Del_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <div style="text-align: center">
        <b>Total Amount: </b>
        <asp:Label ID="lblAmt" runat="server" Text=""></asp:Label>
    </div>
    <br />
    <div style="text-align: center">
        <asp:Button ID="btnproceed" runat="server" CssClass="btn-dark" Text="Proceed" OnClick="btnproceed_Click" />
    </div>
    <br />
</asp:Content>

