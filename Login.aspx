<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnEmail" runat="server" />
    <asp:HiddenField ID="hdnPassword" runat="server" />
    <asp:HiddenField ID="hdnMobile" runat="server" />
    <asp:HiddenField ID="hdnName" runat="server" />
    <center>
    <div>
        <div style="background-image: url('img/hsbdhsdhsdy.jpg'); background-size: cover">
            <br />
            <div class="card" style="width: 21rem; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                <br />
                <img src="img/logoH%20copy.png" height="50" />
                <div class="card-body">
                    <h5 class="card-title" style="font-family: Boogaloo; font-size: 28px">Login</h5>
                    <asp:TextBox ID="txtCustomerId" runat="server" class="form-control" placeholder="Enter CustomerId or Mobile No"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtpassword" runat="server" class="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                    <br />                  
                    <asp:Button ID="btnLogin" runat="server" class="btn btn-primary" Style="width: 125px" Text="Login" OnClick="btnlogin_Click"></asp:Button>
                    <asp:Button ID="btnSignup" runat="server" class="btn btn-primary" Style="width: 125px" Text="Signup" OnClick="btnSignup_Click"></asp:Button>
                    <br />
                    <br />
                     <p>
                        <asp:LinkButton ID="btnForgotPassword" runat="server" OnClick="btnForgotPassword_Click">Forgot password?</asp:LinkButton>
                    </p>
                    <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <br />
        </div>
    </div>
    </center>
</asp:Content>

