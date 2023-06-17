<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMaster.Master" CodeBehind="instructors.aspx.cs" Inherits="El_Proffesora.user.instructors" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <style>
        .instrctornamediv > div{
            float:left!important;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="UserMasterID">
    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/tt.jpeg');">

        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate pb-5 text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.aspx">Home <i class="fa fa-chevron-right"></i></a></span><span>Certified Instructor <i class="fa fa-chevron-right"></i></span></p>
                    <h1 class="mb-0 bread">Certified Instructor</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row">
                <asp:Repeater runat="server" ID="rptInstructor">
                    <ItemTemplate>
                        <div class="col-md-6 col-lg-4 ftco-animate d-flex align-items-stretch">
                            <div class="staff">
                                <div class="img-wrap d-flex" style="height:360px!important">
                                    
                                        <img class="img" src="../Admin/UploadFiles/images/<%# Eval("Picture") %>" alt="Alternate Text" />
                                        
                                </div>
                                <div class="text pt-3">
                                    <h3><a href="courses.aspx?iid=<%# Eval("InstructorId") %>" class="instrctornamediv"><div style="width:77%!important"><%# Eval("FirstName") %> <%# Eval("LastName") %></div><div><%# Eval("Education") %></div></a></h3>
                                    <br />
                                    <a href="mailto:<%# Eval("Email") %>" style="color:blue;font-weight:bold"><%# Eval("Email") %></a>
                                    
                                    <div class="faded">
                                        <p>I am <span style="font-style:italic;text-decoration:underline;color:darkblue"><%# Eval("FirstName") %> <%# Eval("LastName") %></span> workaholic, but apart from that, pretty simple person.</p>
                                        <ul class="ftco-social text-center">
                                            <li class="ftco-animate"><a href="#"><span class="fa fa-twitter"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="fa fa-facebook"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="fa fa-google"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="fa fa-instagram"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                

                </div>
            </div>
            <div class="row mt-5">
                <div class="col text-center">
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
    </section>

</asp:Content>
