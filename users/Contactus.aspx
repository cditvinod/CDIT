<%@ Page Title="" Language="C#" MasterPageFile="~/users/user.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="users_Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        .map-responsive{
    overflow:hidden;
    padding-bottom:56.25%;
    position:relative;
    height:0;
}
.map-responsive iframe{
    left:0;
    top:0;
    height:100%;
    width:100%;
    position:absolute;
}
    </style>
    <link href="css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-image: url('img/hsbdhsdhsdy.jpg'); background-size: cover">
        <br />
<div style="width:100%;height:50px">

    <h2 style="color:black;text-align:center;font-family:Boogaloo;vertical-align:middle;font-size:45px">About Us</h2>
 <div style="text-align:center">
    <img src="../img/type_10-300x19.png" />
   </div>     
</div>
    <hr /> 
        
</div>
    <br />

    <div class="container">
  <div class="row">
    <div class="col-sm">
        <div style="text-align:center">
       <img src="../img/smartphone%20(3).png" width="80" height="80" />
            </div>
        <p style="text-align:center">PHONE</p>
        <p style="text-align:center">Phone: +91-353-2527249</p>
    </div>
    <div class="col-sm">
       <div style="text-align:center">
       <img src="../img/placeholder.png" width="80" height="80" />
            </div>
        <p style="text-align:center">ADDRESS</p>
        <p style="text-align:center">Phone: +91-353-2527249</p>
    </div>
    <div class="col-sm">
       <div style="text-align:center">
       <img src="../img/email.png" width="80" height="80" />
            </div>
        <p style="text-align:center">EMAIL</p>
        <p style="text-align:center">Phone: +91-353-2527249</p>
    </div>
  </div>
</div>
    <div>
        <blockquote class="blockquote text-center">
  <p class="mb-0">Want to send us some tea love? or love? or suggestions? or complaints?<br /> okay, we can only hope it's not complaints,<br /> but do share your thoughts with us.
we'd love to hear from you.<br /> meanwhile sip tea and spread peace!</p>
  <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
</blockquote>
    </div>

   <div class="map-responsive">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d386950.6511603643!2d-73.70231446529533!3d40.738882125234106!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNueva+York!5e0!3m2!1ses-419!2sus!4v1445032011908" width="600" height="250" frameborder="0" style="border:0" allowfullscreen></iframe>
</div>

</asp:Content>

