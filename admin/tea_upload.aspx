<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="tea_upload.aspx.cs" Inherits="admin_tea_upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div style="background-image: url('../img/hsbdhsdhsdy.jpg'); background-size: cover">
        <br />
        <div style="width: 400px; margin: auto; text-align: center">
            <div class="card" style="width: 21rem; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                <br />
                <p style="text-align: center">
                    <img src="../img/logoH.png" height="50" width="150" /></p>
                <div class="card-body">
                    <h5 class="card-title" style="font-family: Boogaloo; font-size: 28px">Upload Tea</h5>

                    <span style="font-size: 20px">Item Id :</span>&nbsp;&nbsp;&nbsp;<asp:Label ID="txtitemid" runat="server" Style="font-size: 18px; font-weight: 500" Text=""></asp:Label>
                    <br />
                    <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Enter Name"></asp:TextBox>
                    <br />
                    <asp:DropDownList ID="ddlSugar" runat="server" class="form-control">
                        <asp:ListItem>Normal Sugar</asp:ListItem>
                        <asp:ListItem>Light Sugar</asp:ListItem>
                        <asp:ListItem>No Sugar</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:TextBox ID="txtprice" runat="server" class="form-control" placeholder="Price" TextMode="Number"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtQty" runat="server" class="form-control" placeholder="Qty" TextMode="Number"></asp:TextBox>
                    <br />
                    <asp:FileUpload ID="fuphoto" class="form-control-file" runat="server"></asp:FileUpload>
                    <small id="fileHelp" class="form-text text-muted">Upload tea image</small>
                    <br />
                    <asp:Button ID="btnupload" runat="server" class="btn btn-primary" Style="width: 200px" Text="Upload" OnClick="btnupload_Click"></asp:Button>
                    <br />
                    <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                    <br />

                </div>
            </div>
        </div>
        <br />
    </div>

</asp:Content>

