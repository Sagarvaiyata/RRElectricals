<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ReviewsManager.aspx.cs" Inherits="RRElectricals.ReviewsManager" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .card-alignment {
            float: left;
            width: 29.85%;
            margin: 20px
        }

        .module-spacing {
            margin: 20px !important;
            padding: 30px;
            color: #555;
            background-color: #ddd;
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
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:TextBox ID="CompanyName" CssClass="form-control" runat="server" placeholder="Enter Company Name"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:TextBox ID="OwnerName" runat="server" CssClass="form-control" placeholder="Enter Owner Name"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <asp:TextBox ID="Review" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Owner Name"></asp:TextBox>
                    </div>
                </div>
            </div>
            <asp:Button ID="SubmitReview" runat="server" CssClass="btn btn-success" Text="Submit Review" OnClick="SubmitReview_Click" />
        </div>
        <div class="cardrow">
            <asp:Repeater ID="ReviewsRepeater" runat="server">
                <ItemTemplate>
                    <div class="card card-alignment">
                        <div class="card-header">
                            <h5 style="text-align: center; width: 100%; margin-bottom: 10px;"><%#Eval("OwnerName") %></h5>
                            <h6 style="text-align: center; width: 100%"><%#"Project Type: " + Eval("CompanyName") %></h6>
                        </div>
                        <div class="card-body">
                            <i> <%# Eval("Review") %> </i>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-center">
                                <asp:Button ID="Delete" CssClass="btn btn-danger" runat="server" Text="Remove" CommandArgument='<%#Eval("Id")%>' OnCommand="Delete_Command" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
