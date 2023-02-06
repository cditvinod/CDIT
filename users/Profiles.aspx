<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profiles.aspx.cs" Inherits="users_Profiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/StyleSheet2.css" rel="stylesheet" />
    <script src="../engine1/jquery.js"></script>
    <link href="../css/footer.css" rel="stylesheet" />

    <link href="../css/StyleSheet.css" rel="stylesheet" />
    <%--<link href="../css/font-awesome.min.css" rel="stylesheet" />--%>
    <link href="font-awesome.min.css" rel="stylesheet" />


    <link href="../engine1/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="float: right; background-color: #533c2c; width: 100%; height: 40px">
                <a style="color: white; vertical-align: middle">&nbsp;Welcome&nbsp;<asp:Label ID="txtName" runat="server" Style="font-weight: 500; font-size: 19px" Text=""></asp:Label></a> <a href="logout.aspx" style="color: #fff; vertical-align: middle; float: right; font-size: 21px; text-decoration: none"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;<span style="font-size: 16px">Logout</span>&nbsp;</a> <a href="login.aspx" style="color: #fff; vertical-align: middle; float: right; font-size: 21px; text-decoration: none"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;<span style="font-size: 16px">My Account</span>&nbsp;</a><a href="Cart.aspx" style="color: #fff; vertical-align: middle; float: right; font-size: 20px; text-decoration: none"><i class="fa fa-coffee" aria-hidden="true"></i>&nbsp;<span style="font-size: 16px">Tea Cart&nbsp;(<asp:Label ID="txtcart" runat="server" Text=""></asp:Label>)</span>&nbsp;&nbsp;&nbsp;</a>
            </div>
            <table style="margin: auto; width: 100%">
                <tr>
                    <td style="width: 500px">
                        <img src="../img/logoH copy.png" height="210" width="230" class="img-fluid" />
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
                        <a href="users.aspx" style="color: white">
                            <li>Order Tea</li>
                        </a>
                        <a href="#" style="color: white">
                            <li>About us</li>
                        </a>
                        <a href="#" style="color: white">
                            <li>Coffee</li>
                        </a>
                        <a href="#" style="color: white">
                            <li>Preparation</li>
                        </a>
                        <a href="#" style="color: white">
                            <li>Tea Type</li>
                        </a>
                        <a href="#" style="color: white">
                            <li>Why us</li>
                        </a>
                        <a href="#" style="color: white">
                            <li>Contact us</li>
                        </a>
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
            <div style="margin: auto; width: 1100px;">

                <div style="background-image: url('img/hsbdhsdhsdy.jpg'); background-size: cover">
                    <br />
                    <div style="text-align: center; margin: auto; width: 90%" class="mx-auto">
                        <div class="card" style="width: 1000px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                            <br />
                            <div style="text-align: center">
                                <img src="user.png" height="50" width="50" />
                            </div>

                            <div style="text-align: center">
                                <div class="card-body">
                                    <h5 class="card-title" style="font-family: Boogaloo; font-size: 28px">My Profile</h5>

                                    Name :
                                    <asp:Label ID="lblName" runat="server" Text="Label">&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtName1" runat="server" Width="100"></asp:TextBox></asp:Label>
                                    <br />
                                    Address :
                                    <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
                                    <br />
                                    Mobile :
                                    <asp:Label ID="lblMobile" runat="server" Text="Label"></asp:Label>
                                    <br />
                                    Email :
                                    <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                                    <br />

                                </div>
                            </div>
                        </div>
                    </div>

                    <br />
                </div>

            </div>
            <div style="float: left; width: 100%">
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
                                    <li><a href="#">Why us ?</a></li>
                                </ul>
                            </div>
                            <div class="col-xs-6 col-md-3">
                                <h6>Address</h6>
                                <%-- <ul class="footer-links">
              <li><a href="#">C</a></li>
              <li><a href="#">UI Design</a></li>
              <li><a href="#">PHP</a></li>
              <li><a href="#">Java</a></li>
              <li><a href="#">Android</a></li>
              <li><a href="#">Templates</a></li>
            </ul>--%>
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
                                        <%--    <td>
                                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Your Name" Style="width: 180px; margin-left: 10px" TextMode="SingleLine"></asp:TextBox>
                                        </td>--%>
                                    </tr>
                                    &nbsp;
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
                        <hr>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-sm-6 col-xs-12">
                                <p class="copyright-text">
                                    Copyright &copy; 2019 All Rights Reserved by
         <a href="Default.aspx">TheChaiDhaba</a>.
                                <br />
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
