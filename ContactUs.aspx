<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .map-responsive {
            overflow: hidden;
            padding-bottom: 56.25%;
            position: relative;
            height: 0;
        }

            .map-responsive iframe {
                left: 0;
                top: 0;
                height: 50%;
                width: 100%;
                position: absolute;
            }
    </style>
    <link href="css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="background-image: url('img/hsbdhsdhsdy.jpg'); background-size: cover">
        <br />
        <div style="width: 100%; height: 50px">

            <h2 style="color: black; text-align: center; font-family: Boogaloo; vertical-align: middle; font-size: 45px">About Us</h2>
            <div style="text-align: center">
                <img src="img/type_10-300x19.png" />
            </div>
        </div>
        <hr />

    </div>
    <br />

    <div class="container">
        <div class="row">
            <div class="col-sm">
                <div style="text-align: center">
                    <img src="img/smartphone%20(3).png" width="80" height="80" />
                </div>
                <p style="text-align: center">PHONE</p>
                <p style="text-align: center">Phone: +91-700 470 1320</p>
            </div>
            <div class="col-sm">
                <div style="text-align: center">
                    <img src="img/placeholder.png" width="80" height="80" />
                </div>
                <p style="text-align: center">ADDRESS</p>
                <p style="text-align: center">
                    The Chai Dhaba<br />
                    GE-15, City Centre, Sector-4<br />
                    Bokaro Steel City, Jharkhand<br />

                </p>
            </div>
            <div class="col-sm">
                <div style="text-align: center">
                    <img src="img/email.png" width="80" height="80" />
                </div>
                <p style="text-align: center">EMAIL</p>
                <p style="text-align: center">order@thechaidhaba.com</p>
            </div>
        </div>
    </div>
    <hr />
    <div>
        <blockquote class="blockquote text-center">
            <p class="mb-0">
                Want to send us some tea love or suggestions or complaints?<br />
                Okay, we can only hope it's not complaints,<br />
                but do share your thoughts with us. We'd love to hear from you.<br />
                Meanwhile sip tea and spread peace!
            </p>
            <footer class="blockquote-footer">The Chai <cite title="Source Title">Dhaba</cite></footer>
        </blockquote>
    </div>

    <div class="map-responsive">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3654.2840474809204!2d86.14360231497976!3d23.665797984631258!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f423b9ad3e7637%3A0x8ec05646718423de!2sThe+Chai+Dhaba!5e0!3m2!1sen!2sin!4v1552362102836"></iframe>
    </div>
</asp:Content>

