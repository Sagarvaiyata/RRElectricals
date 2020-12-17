<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="IndexManager.aspx.cs" Inherits="RRElectricals.IndexManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
       
        .module-spacing {
            margin: 20px !important;
            padding: 30px;
            color: #555;
            background-color: #ddd;
        }

        .bannerimg {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            width: 200px;
            height: 140px;
            border-radius: 20px;
        }

        .inner-module-spacing {
            margin: 20px !important;
            padding: 15px;
            background-color: #eee;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div style="margin-left: 200px;">
        <div class="jumbotron">
            <h1 style="text-align: center;">RR Electricals</h1>
        </div>

        <div class="module-spacing ">
            <h3>Publish Aim</h3>
            <br />
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text">Aim</div>
                </div>
                <asp:TextBox ID="AimTextbox" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <br />
            <asp:Button ID="AimButton" runat="server" Text="Save" CssClass="btn btn-success" OnClick="AimButton_Click" />
        </div>

        <div class="module-spacing">
            <h3>Banner Images</h3>
            <br />
            <div class="inner-module-spacing">
                <h5>Select Banner and Replace Image</h5>
                <asp:RadioButtonList ID="SelectBanner" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:RadioButtonList>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="ImageSave" runat="server" btn="btn btn-success" Text="Upload Image" OnClick="ImageSave_Click"/>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3 d-flex justify-content-center">
                    <asp:Image ID="Banner1" CssClass="bannerimg" ImageUrl="BannerImages/1.jpg" runat="server" />
                </div>
                <div class="col-md-3 d-flex justify-content-center">
                    <asp:Image ID="Banner2" CssClass="bannerimg" ImageUrl="BannerImages/2.jpg" runat="server" />
                </div>
                <div class="col-md-3 d-flex justify-content-center">
                    <asp:Image ID="Banner3" CssClass="bannerimg" ImageUrl="BannerImages/3.jpg" runat="server" />
                </div>
                 <div class="col-md-3 d-flex justify-content-center">
                    <asp:Image ID="Banner4" CssClass="bannerimg" ImageUrl="BannerImages/4.jpg" runat="server" />
                </div>
            </div>
        </div>

        <div class="module-spacing">
            <div class="form-group custom-control-inline">
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text">Number of Projects</div>
                    </div>
                    <asp:TextBox ID="Numberofprojects" runat="server" TextMode="Number"></asp:TextBox>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="SaveNumberofprojects" runat="server" CssClass="btn btn-success" Text="Save" OnClick="SaveNumberofprojects_Click"/>
            </div>
            <br />
             <div class="form-group custom-control-inline">
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text">Number of Certifications</div>
                    </div>
                    <asp:TextBox ID="Numberofcertifications" runat="server" TextMode="Number"></asp:TextBox>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="SaveNumberofcertifications" runat="server" CssClass="btn btn-success" Text="Save" OnClick="SaveNumberofcertifications_Click"/>
            </div>
            <br />
             <div class="form-group custom-control-inline">
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text">Number of Happy Clients</div>
                    </div>
                    <asp:TextBox ID="Numberofhappyclients" runat="server" TextMode="Number"></asp:TextBox>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="SaveNumberofhappyclients" runat="server" CssClass="btn btn-success" Text="Save" OnClick="SaveNumberofhappyclients_Click"/>
            </div>
            <br />
             <div class="form-group custom-control-inline">
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text">Number of Countries</div>
                    </div>
                    <asp:TextBox ID="Numberofcountries" runat="server" TextMode="Number"></asp:TextBox>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="SaveNumberofcountries" runat="server" CssClass="btn btn-success" Text="Save" OnClick="SaveNumberofcountries_Click"/>
            </div>
        </div>

    </div>
</asp:Content>
