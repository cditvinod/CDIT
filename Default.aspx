<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/font-awesome.min.css" rel="stylesheet" />


    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="background-image: url('img/hsbdhsdhsdy.jpg'); background-size: cover; width: 85%; margin: auto;">
        <br />
        <p style="text-align: center;"><asp:Label ID="lblmessage" Style="text-align: center; font-style: italic; font-size: large; color: #009933;" runat="server" Text=""></asp:Label></p>
        <br />
        <asp:HiddenField ID="hdnItemId" runat="server" />
        <asp:HiddenField ID="hdnItemName" runat="server" />
        <asp:HiddenField ID="hdnRate" runat="server" />
        <asp:HiddenField ID="hdnSugar" runat="server" />


        <asp:Label ID="txtip" runat="server" Text=""></asp:Label>
        <center class="auto-style1">

&nbsp;<asp:Repeater ID="rp" runat="server">
            <ItemTemplate>
                <div style="float: left">
                    <div class="container-fluid" style="text-align: center;">
                        <div class="row">
                            <div class="col-sm">
                                <div class="card" style="width: 18rem; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                                    <img src="admin/tea_img/<%#Eval("Photo") %>" class="card-img-top" height="215" alt="chai" />
                                    <div class="card-body">
                                        <asp:Label ID="txtItemId" runat="server" Style="font-size: 10px; color: #fff" Text='<%#Eval("ItemId") %>'></asp:Label>
                                        <h5 class="card-title">
                                            <asp:Label ID="txtItemName" runat="server" Text='<%#Eval("Name") %>'></asp:Label></h5>
                                        <h6 class="card-subtitle mb-2 text-muted" style="font-size: 17px">(<asp:Label ID="txtSugar" runat="server" Text='<%#Eval("Sugar") %>'></asp:Label>)</h6>
                                        <h5 class="card-subtitle mb-2" style="font-size: 16px; color: #34495e">Price : Rs.<asp:Label ID="txtPrice" runat="server" Text='<%#Eval("Price") %>'></asp:Label>/-</h5>
                                        <p class="card-text" style="font-size: 16px; font-weight: 500">Cups&nbsp;:&nbsp;<asp:TextBox ID="txtQty" Width="50" TextMode="Number" runat="server" Text="1"></asp:TextBox></p>
                                        <p class="card-text" style="font-size: 16px; font-weight: 500">
                                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                        </p>
                                        <asp:Button ID="btncart" runat="server" class="btn btn-outline-info" CommandArgument='<%#Eval("ItemId") %>' OnClick="btncart_Click" Text="Add to Cart" />
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater></center>
    </div>
</asp:Content>

