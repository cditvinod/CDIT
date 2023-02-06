<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <style>
    input[type=number]::-webkit-inner-spin-button {
        -webkit-appearance: none;
         display: none;
         }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="background-image: url('img/hsbdhsdhsdy.jpg'); background-size: cover">
        <br />
        <asp:Label ID="txtCustId" runat="server" Text=""></asp:Label>
       <center>
            <div class="card" style="width: 23rem;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                <br />
<img src="img/logoH%20copy.png" height="50" />
                <div class="card-body">
                    <h5 class="card-title" style="font-family:Boogaloo;font-size:27px">SignUp</h5>
                    <%--<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>--%>
                    <asp:TextBox ID="txtmobile" class="form-control" runat="server" placeholder="Enter Mobile" TextMode="Number"></asp:TextBox>
                   <%-- <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">--%>
                    <%--<a href="#" class="card-link">Card link</a>

                    <a href="#" class="card-link">Another link</a>--%>
                    <br />
                     <asp:TextBox ID="txtpassword" class="form-control" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                    <br />
                    
                     <asp:TextBox ID="txtname" class="form-control" runat="server" placeholder="Enter Name"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtemail" class="form-control" runat="server" placeholder="Enter Email" TextMode="Email"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtaddress" class="form-control" runat="server" placeholder="Enter Address" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    <br />
                    <p><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;City : Bokaro</p>
                    <p><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;State : Jharkhand</p>
                    <asp:Label ID="txtcity" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="txtstate" runat="server" Text="Label"></asp:Label>
                    <%--<p><a href="#">Forgot password ?</a></p>--%> 
                    <%--<button type="submit" class="btn btn-primary" style="width:200px">Signup</button>--%>
                    <asp:Button ID="btnsignup" runat="server" Text="Signup" class="btn btn-primary" style="width:200px" OnClick="btnsignup_Click" ></asp:Button>
                    <br />
                    <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                    <br />
                    <p>Already have a account ?<a href="login.aspx">Login</a></p>
                </div>
            </div>
        </center>
        <br />
    </div>

</asp:Content>

