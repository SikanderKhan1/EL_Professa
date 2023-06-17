<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMaster.Master" CodeBehind="courses.aspx.cs" Inherits="El_Proffesora.user.courses" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <style>
        .test > p 
        {
            display:inline-block!important;
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
                    <h1 class="mb-0 bread">Course Lists</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 sidebar">
                  <div class="sidebar-box bg-white p-4 ftco-animate">
                        <h3 class="heading-sidebar">Course Category</h3>
                        <div class="browse-form">
                            <asp:Repeater runat="server" ID="rptSideBarCata">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server"  CommandArgument='<%# Eval("CategoryID") %>' OnClick="SideBarCata_Click" Text='<%# Eval("CategoryName") %>'></asp:LinkButton><br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="sidebar-box bg-white p-4 ftco-animate">
                        <h3 class="heading-sidebar">Instructor</h3>
                        <div class="browse-form">
                            <asp:Repeater runat="server" ID="rptSidebarInstructor">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("InstructorId") %>' Text='<%# Eval("FullName") %>' OnClick="SideBarInstructor_Click" ></asp:LinkButton><br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="sidebar-box bg-white p-4 ftco-animate">
                        <h3 class="heading-sidebar">Course Type</h3>
                        <div class="browse-form">
                            <asp:Repeater runat="server" ID="rptCataType">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="SideBarCataType" Text='<%# Eval("AssignmentType") %>'></asp:LinkButton><br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                </div>
                <div class="col-lg-9">
                    <div class="row">
                        <asp:Repeater runat="server" ID="rptGetAllCourses">
                            <ItemTemplate>
                                <div class="col-md-6 ">
                            <div class="project-wrap">
                                <a href="ViewCourse.aspx?id=<%# Eval("CourseId") %>" class="img" style='background-image: url(../Admin/UploadFiles/images/<%# Eval("Picture")%>);'>
                                    <span class="price"><%# Eval("CategoryName") %></span>
                                </a>
                               
                                <div class="text p-4">
                                    <h3><a href="ViewCourse.aspx?id=<%# Eval("CourseId") %>"><%# Eval("CourseName") %></a></h3>
                                    <div class="test">
                                        <p class="advisor" style="width:60%">Instructor 
                                        </p>
                                        <p><%# Eval("FirstName") %><%# Eval("LastName") %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        
                    </div>
                    <div class="row mt-5">
                        <div class="col">
                            <div class="block-27">
                                <ul>
                                    <li><a href="#">&lt;</a></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&gt;</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
