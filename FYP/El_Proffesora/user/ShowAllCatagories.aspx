<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMaster.Master" CodeBehind="ShowAllCatagories.aspx.cs" Inherits="El_Proffesora.user.ShowAllCatagories" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style>
        .btn
        {
            border-radius:0px;
            line-height:35px;
        }
        
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="UserMasterID">
    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Home <i class="fa fa-chevron-right"></i></a></span><span>Course Lists <i class="fa fa-chevron-right"></i></span></p>
                    <h1 class="mb-0 bread">Catagory List</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row">

                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                    <div class="row">
                        <asp:Repeater runat="server" ID="rptGetAllCatagories">
                            <ItemTemplate>
                               
                                
                                <div class="col-md-4">
                                    <div class="project-wrap">
                                        <a href="#"  class="img" style='background-image: url(../Admin/UploadFiles/images/<%# Eval("image")%>);'>
                                            <span class="price"><%# Eval("CategoryName") %></span>
                                        </a>
                                        <hr style="margin-bottom:2px;padding-bottom:0px" />
                                        <hr style="margin-top:0px;padding-top:0px" />
                                      <div style="margin-top:8px;padding-bottom:30px;display:flex;justify-content:center">
                                          <asp:LinkButton runat="server" ID="btnLoadCataCourse" CommandArgument='<%# Eval("CategoryID") %>' CssClass="btn btn-primary" Text="Click To See More Detail" OnClick="btnLoadCataCourse_Click">
                                          </asp:LinkButton>
                                      </div>
                                    </div>
                                </div>
                                 
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                    <div class="row mt-5">
                        <div class="col-md-12">
                            <div class="block-27 float-left" style="height:40px">
                                    <asp:LinkButton runat="server" CssClass="testlabel" ID="btnprev" ForeColor="gray" OnClick="btnprev_Click">
                                        <i class="fa fa-chevron-left"></i></asp:LinkButton>
                                <span style="margin-left:2px;margin-top:2px;font-size:16px">PREV</span>
                            </div>
                            



                            <div class="block-27 float-right" >
                                    <asp:LinkButton runat="server" ID="btnnext" CssClass="testlabel" ForeColor="gray" OnClick="btnnext_Click">
                                        <i class="fa fa-chevron-right"></i></asp:LinkButton>
                                <span style="margin-left:2px;margin-top:5px;font-size:16px">NEXT</span>                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
