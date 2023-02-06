<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link href="css/footer.css" rel="stylesheet" />
    <link href="css/StyleSheet2.css" rel="stylesheet" />
    <style>
        input[type=number]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hdnPassword" runat="server" />

            <table style="margin: auto; width: 100%">
                <tr>
                    <td style="width: 500px">
                        <img src="img/logoH copy.png" height="210" width="230" class="img-fluid" />
                    </td>
                    <td>
                        <i class="fa fa-phone" aria-hidden="true" style="float: right">&nbsp;+91 9162927965&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i><br />
                        <i class="fa fa-envelope" aria-hidden="true" style="float: right; font-size: 18px">&nbsp;thechaidhaba@gmail.com</i>
                    </td>
                </tr>
            </table>

            <div>
                <nav style="background-color: #d35400">
                    <ul>
                        <li><a href="Default.aspx" style="color: white">Order Tea</a></li>
                        <li><a href="Default.aspx" style="color: white">About Us</a></li>
                        <li><a href="Default.aspx" style="color: white">Chai</a></li>
                        <li><a href="Default.aspx" style="color: white">Preparation</a></li>
                        <li><a href="Default.aspx" style="color: white">Chai Type</a></li>
                        <li><a href="Default.aspx" style="color: white">Why Us?</a></li>
                        <li><a href="Default.aspx" style="color: white">Contact</a></li>
                    </ul>
                    <div class="handle" style="background-color: #533c2c">
                        <p class="menu">Menu</p>
                        <div class="menu_icon">
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                </nav>
            </div>
            <div style="float: left; width: 100%">

                <div style="background-image: url('img/hsbdhsdhsdy.jpg'); background-size: cover">
                    <br />
                    <asp:Label ID="txtCustId" runat="server" Text=""></asp:Label>
                    <center>
            <div class="card" style="width: 23rem;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                <br />
                    <img src="img/logoH%20copy.png" height="50" />
                    <div class="card-body">
                    <h5 class="card-title" style="font-family:Boogaloo;font-size:23px">SignUp Form</h5>
                    <asp:TextBox ID="txtOTP" class="form-control" runat="server" placeholder="Enter OTP"></asp:TextBox>
                    <asp:Button ID="btnOTP" runat="server" Text="Verify" class="btn btn-primary" style="width:100px" OnClick="btnOTP_Click" ></asp:Button>
                    <asp:TextBox ID="txtmobile" class="form-control" runat="server" placeholder="Enter Mobile*" TextMode="Number"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtpassword" class="form-control" runat="server" placeholder="Enter Password*" TextMode="Password"></asp:TextBox>
                    <br />                    
                    <asp:TextBox ID="txtname" class="form-control" runat="server" placeholder="Enter Name*"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtemail" class="form-control" runat="server" placeholder="Enter Email" TextMode="Email"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtaddress" class="form-control" runat="server" placeholder="Enter Address*" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    <br />
                    <p><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;Area: City Centre<br />
                    <i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;City: Bokaro<br />
                    <i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;State: Jharkhand</p>
                    <asp:Label ID="txtcity" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="txtstate" runat="server" Text="Label"></asp:Label>
                    <br />
                    
                    <%--<p><a href="#">Forgot password ?</a></p>--%> 
                    <%--<button type="submit" class="btn btn-primary" style="width:200px">Signup</button>--%>
                                        
                    <asp:Button ID="btnsignup" runat="server" Text="Register" class="btn btn-primary" style="width:200px" OnClick="btnsignup_Click" ></asp:Button>                    
                    <br />
                    <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                    <p>Already have a account? <a href="Login.aspx">Login</a></p>
                </div>
            </div>
        </center>
                    <br />
                </div>


            </div>
            <div style="float: left; width: 100%">
                <!-- Site footer -->
                <footer class="site-footer">
                    <div class="container">
                        <div class="row">

                            <div class="col-xs-6 col-md-3">
                                <h6>Quick Links</h6>
                                <ul class="footer-links">
                                    <li><a href="#">Order Tea</a></li>
                                    <li><a href="#">About us</a></li>
                                    <li><a href="#">Preparation</a></li>
                                    <li><a href="#">Tea Type</a></li>
                                    <li><a href="#">Why us?</a></li>
                                    <li><a href="adminlogin.aspx">Adminlogin</a></li>
                                </ul>
                            </div>
                            <div class="col-xs-6 col-md-3">
                                <h6>Address</h6>
                                <p>
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>GE-15, City Centre, Sector-4<br />
                                    Bokaro Steel City, Jharkhand-827004<br />
                                    Mobile: 9801360327<br />
                                    Email: info@thechaidhaba.com<br />
                                    Website: www.thechaidhaba.com

                                </p>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <h6>Enquiry</h6>
                                <table style="margin: auto">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Your Name" Style="width: 359px" TextMode="Email"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Your Email" Style="width: 359px" TextMode="Email"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table style="margin: auto">
                                    <%-- <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Subject" Style="width: 360px; margin-top: 5px" TextMode="SingleLine"></asp:TextBox></td>
                                    </tr>--%>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Message" Style="width: 360px; margin-top: 5px" TextMode="MultiLine"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr style="float: left">
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Send" class="btn btn-success" Style="/*margin-left: 200px*/width:359px" /></td>
                                    </tr>
                                </table>
                            </div>

                        </div>
                        <hr />
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-sm-6 col-xs-12">
                                <p class="copyright-text">
                                    Copyright &copy; 2019 All Rights Reserved by <a href="#">TheChaiDhaba</a>.
                                </p>
                            </div>

                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <ul class="social-icons">
                                    <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a class="dribbble" href="#"><i class="fa fa-youtube"></i></a></li>
                                    <%--<li><a class="linkedin" href="#"><i class="fa fa-youtube"></i></a></li> --%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </form>
</body>
</html>
