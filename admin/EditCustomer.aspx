<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditCustomer.aspx.cs" Inherits="admin_EditCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        td {
            padding-left: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 800px; margin: auto">
        <tr>
            <td colspan="2" style="text-align: center;">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;"><strong>Update Customer Details</strong></td>
        </tr>
        <tr>
            <td>Customer Id</td>
            <td>
                <asp:Label ID="lblCustomerId" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Name</td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top;">Address</td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Mobile</td>
            <td>
                <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

