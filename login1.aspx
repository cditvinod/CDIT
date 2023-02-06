<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login1.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href='https://fonts.googleapis.com/css?family=Boogaloo' rel='stylesheet'/>
    <link href="css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="background-image: url('img/hsbdhsdhsdy.jpg'); background-size: cover">
        <br />
       <center>
            <div class="card" style="width: 21rem;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                <br />
<img src="img/logoH%20copy.png" height="50" />
                <div class="card-body">
                    <h5 class="card-title" style="font-family:Boogaloo;font-size:28px">Login</h5>
                    <%--<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>--%>
                    <asp:TextBox ID="txtmobile" runat="server" class="form-control" placeholder="Enter Mobile"></asp:TextBox>
                    <%--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">--%>
                    <%--<a href="#" class="card-link">Card link</a>

                    <a href="#" class="card-link">Another link</a>--%>
                    <br />
                    <asp:TextBox ID="txtpassword" runat="server" class="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                     <%--<input type="email" class="form-control" id="Email1" aria-describedby="emailHelp" placeholder="Enter password">--%>
                    <br />
                    <p><a href="#">Forgot password ?</a></p> 
                    
                    <asp:Button ID="btnlogin" runat="server" class="btn btn-primary" style="width:200px" Text="Login" OnClick="btnlogin_Click"></asp:Button>
                    <br />
                    <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                    <br />
                    <p><a href="register.aspx">Not signup ?</a></p>
                </div>
            </div>
        </center>
        <br />
    </div>
 
</asp:Content>

