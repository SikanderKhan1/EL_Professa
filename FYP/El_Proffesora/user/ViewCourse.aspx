<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMaster.Master" CodeBehind="ViewCourse.aspx.cs" Inherits="El_Proffesora.user.ViewCourse" %>

<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="UserMasterID">

    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Home <i class="fa fa-chevron-right"></i></a></span><span>Course Lists <i class="fa fa-chevron-right"></i></span></p>
                    <h1 class="mb-0 bread">Course Detail</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-md-12 d-flex align-items-stretch ftco-animate">
                            <div class="project-wrap">
                                <a href="#" class="img" style='background-image: url(../Admin/UploadFiles/images/person_1);'></a>
                                <asp:Repeater ID="rptCourse" runat="server">
                                    <ItemTemplate>
                                        <h2><%# Eval("CourseName") %></h2>
                                        <h3><%# Eval("FullName") %></h3>
                                        <h3><%# Eval("CategoryName") %></h3>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                <asp:Repeater ID="rptuploads" runat="server">
                                    <ItemTemplate>
                                        <div class="col-lg-3">
                                            <div class="courses-inner res-mg-b-30">


                                                <div class="courses-title text-center">

                                                    <a href="#"><%# IsVideo(Convert.ToInt32(Eval("AssignmentTypeID")),Convert.ToString(Eval("FileName")))%>
                                                    </a>
                                                    <h2 style="color: blue"><%# Eval("AssignmentName") %></h2>
                                                </div>

                                                <div class="course-des">
                                                    <p><span><i class="fa fa-clock"></i></span><b style="color: blue">Category : </b><%# Eval("CategoryName") %></p>
                                                    <p><span><i class="fa fa-clock"></i></span><b style="color: blue">Course : </b><%# Eval("CourseName") %></p>
                                                    <p><span><i class="fa fa-clock"></i></span><b style="color: blue">Upload Date : </b><%# Convert.ToDateTime(Eval("UploadDate")).ToString("dd/MM/yyyy hh:mm tt") %></p>
                                                </div>
                                                <div class="product-buttons">
                                                   <asp:LinkButton Text="Download" OnClick="lnkshowpdf_Click" CssClass="btn button-default cart-btn" CommandArgument='<%# Eval("FileName") %>' runat="server" />

                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="text p-4">
                                    <h3><a href="#"></a></h3>
                                    <div class="test">
                                        <p class="advisor" style="width: 60%">
                                        </p>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
