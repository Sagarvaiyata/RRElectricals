<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ProductsManager.aspx.cs" Inherits="RRElectricals.ProductsManager" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        * {
            box-sizing: border-box;
        }
        .module-spacing {
            margin: 20px !important;
            padding: 30px;
            color: #555;
            background-color: #ddd;
        }

        .product-image {
            height: 200px;
            width: 100%;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .card-alignment {
            float: left;
            width: 29.85%;
            margin: 20px
        }

        /* Clearfix (clear floats) */
        .cardrow::after {
            content: "";
            clear: both;
            display: table;
        }

        @media screen and (max-width: 500px) {
            .card-alignment {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="margin-left: 200px;">
        <div class="module-spacing ">
            <h4>Add a new Product</h4>
            <br />
            <div class="row">
                <div class="col-md-6 form-group">
                    <asp:TextBox ID="CompanyName" CssClass="form-control" placeholder="Enter Company Name" runat="server"></asp:TextBox>
                </div>

                <div class="col-md-6 form-group">
                    <asp:DropDownList ID="SelectCategory" CssClass="form-control" runat="server">
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Commercial</asp:ListItem>
                        <asp:ListItem>Residential</asp:ListItem>
                        <asp:ListItem>Solar</asp:ListItem>
                        <asp:ListItem>Industrial</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 form-group">
                    <asp:TextBox ID="Description" CssClass="form-control" placeholder="Enter Description" runat="server"></asp:TextBox>
                </div>

                <div class="col-md-6 form-group">
                    <asp:FileUpload ID="ProductImage" CssClass="form-control" runat="server" />
                </div>
            </div>
            <br />
            <asp:Button ID="AddProduct" runat="server" CssClass="btn btn-success" Text="Add Product" OnClick="AddProduct_Click" />
        </div>
        <div class="cardrow">
            <asp:Repeater ID="ProductsRepeater" runat="server">
                <ItemTemplate>
                    <div class="card card-alignment">
                        <div class="card-header">                            
                                <h5 style="text-align: center; width:100%;margin-bottom:10px;"><%#Eval("CompanyName") %></h5>                                                                                  
                                <h6 style="text-align: center; width:100%"><%#"Project Type: " + Eval("Type") %></h6>                            
                        </div>
                        <div class="card-body">
                            <img src='<%#"ProductImages/" + Eval("ImgUrl") %>' class="product-image" />
                        </div>
                        <div class="card-footer">
                            <h6 style="text-align: center; width:100%; margin-bottom:10px;"><%#Eval("Description") %></h6>
                            <div class="btn-group d-flex justify-content-center" role="group">
                                <asp:Button ID="View" CssClass="btn btn-success" runat="server" Text="View" CommandArgument='<%#Eval("Id")%>' OnCommand="View_Command"/>                                       
                                <asp:Button ID="Delete" CssClass="btn btn-danger" runat="server" Text="Remove" CommandArgument='<%#Eval("Id")%>' OnCommand="Delete_Command"/>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
