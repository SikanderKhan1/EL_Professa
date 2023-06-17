<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMaster.Master" CodeBehind="index.aspx.cs" Inherits="El_Proffesora.user.index" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <style>
        .btn {
            width: 160px;
            border-radius: 1px;
        }

        .test > p {
            display: inline-block !important;
        }

        .totalviews {
            font-size: 30px !important;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="UserMasterID">
    <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1_1.jpg');">
        <div class="overlay"></div>
        <div class="container-fluid">
            <div class="col-md-9">
                <div class="row no-gutters slider-text js-fullheight align-items-center" data-scrollax-parent="true">
                    <marquee direction="left" style="font-size: 23px; font-weight: bold; color: white">
                    <div class="col-md-7 ftco-animate">
                    
                    <asp:Repeater runat="server" ID="rptAnn">
                        <ItemTemplate>
                            <div style="display:inline-block;margin-right:30px; border-right:5px solid yellow;padding-right:15px;">
                                <h3 style="font-size:35px;font-weight:bold;color:yellow" >ANNOUNCEMENT: &nbsp; <%# Container.ItemIndex+1 %>.</h3>
                                <h3 class="mb-4" style="color:yellow;"> <%# Eval("FullName") %></h3>
                                
                                 <p class="caps" style="text-align:justify;"><%# Eval("Name") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                       
                </marquee>
                </div>
            </div>
        </div>
    </div>
    <section class="ftco-section ftco-no-pb ftco-no-pt">
        <div class="container">
            <div class="row">
                <div class="col-md-7"></div>
                <div class="col-md-5 order-md-last">
                    <div id="reg" class="login-wrap p-4 p-md-5">
                        <asp:Label runat="server" ID="lblloginForm">
                            <h3 class="mb-4">Login Form</h3>
                            <div id="loginForm">
                                <div class="form-group">
                                    <label class="label" for="email">Email Address</label>
                                    <asp:TextBox runat="server" ID="txtmail" class="form-control" Style="border-radius: 2px" TextMode="Email" placeholder="johndoe@gmail.com" required="required"></asp:TextBox>
                                
                                </div>
                                <div class="form-group">
                                    <label class="label" for="password">Password</label>
                                    <asp:TextBox runat="server" ID="txtpassword" class="form-control" TextMode="Password" Style="border-radius: 2px" placeholder="*******" required="required"></asp:TextBox>
                               
                                    </div>
                                <div class="form-group">
                                    <div class="text-center">
                                        <asp:Label Text="" ID="lblmsg" ForeColor="Red" Font-Italic="true" Font-Bold="true" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group d-flex justify-content-center mt-4">
                                    <asp:Button runat="server" ID="btnlogin" CssClass="btn btn-primary btn-lg" Text="Login" OnClick="btnlogin_Click" />
                                </div>
                            </div>
                            <p class="text-center">Go to Registration Page <a href="Registration.aspx" id="loginLink">Registration</a></p>
                        </asp:Label>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center pb-4">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <span class="subheading">Start Learning Today</span>
                    <h2 class="mb-4">Online Course Category</h2>
                </div>
            </div>
            <div class="row justify-content-center">
                <asp:Repeater runat="server" ID="rptIndexCourseCata">
                    <ItemTemplate>
                        <div class="col-md-3 col-lg-3">

                            <a href='courses.aspx?id=<%#Eval("CategoryId") %>' class="course-category img d-flex align-items-center justify-content-center" style='background-image: url(../Admin/UploadFiles/images/<%# Eval("image") %>); width: 170px!important; height: 160px!important; padding-top: 10px;'>
                                <div class="text w-100 text-center">
                                    <h3 style="margin-top: 38px; color: yellow; font-weight: bold; font-size: 15px"><%#Eval("CategoryName") %></h3>
                                </div>
                            </a>
                            <%--<img class="card-img-top course-category img d-flex align-items-center justify-content-center"  src="../Admin/UploadFiles/images/<%# Eval("image") %>">
                            
                                <p class="card-text text-center"><%#Eval("CategoryName") %></p>--%>
                        </div>
                        <%--<div class="col-md-4 col-lg-4">
                    <a href="#" class="course-category img d-flex align-items-center justify-content-center" style='background-image: url(<%#Eval("image") %>);'>
                        <img src="images/work-1.jpg" alt="Alternate Text" />
                        <div class="text w-100 text-center">
                            <h3><%#Eval("CategoryName") %></h3>
                            <span>100 course</span>
                        </div>
                    </a>
                </div>--%>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="col-md-12 text-center mt-5">
                    <a href="courses.aspx" class="btn btn-secondary">See ALL</a>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row justify-content-center pb-4">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <span class="subheading">Start Learning Today</span>
                    <h2 class="mb-4">Pick Your Course</h2>
                </div>
            </div>
            <div class="row">
                <asp:Repeater runat="server" ID="rptIndexCourses">
                    <ItemTemplate>
                        <div class="col-md-4 ftco-animate">
                            <div class="project-wrap">
                                <%--<a href="#" class="img" style="background-image: url(images/work-1.jpg);">--%>
                                <a href="ViewCourse.aspx?id=<%# Eval("CourseId") %>" class="img" style="background-image: url(../Admin/UploadFiles/images/<%# Eval("Picture")%>);">
                                    <span class="price"><%# Eval("CategoryName") %></span>
                                </a>
                                <div class="text p-4">
                                    <h3><a href="ViewCourse.aspx?id=<%# Eval("CourseId") %>"><%# Eval("CourseName") %></a></h3>
                                    <div class="test">
                                        <p class="advisor" style="width: 60%">
                                            Instructor 
                                        </p>
                                        <p><%# Eval("FirstName") %><%# Eval("LastName") %></p>
                                    </div>
                                    <%--<ul class="d-flex justify-content-between">
                                        <li><span class="flaticon-shower"></span>2300</li>
                                        <li class="price">$199</li>
                                    </ul>--%>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="col-md-12 text-center mt-5">
                    <a href="courses.aspx" class="btn btn-secondary">See ALL</a>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_4.jpg);">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                    <div class="block-18 d-flex align-items-center">
                        <div class="icon"><span class="flaticon-online"></span></div>
                        <div class="text">

                            <asp:Label CssClass="totalviews" runat="server" ID="lblcourses" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
                    <div class="block-18 d-flex align-items-center">
                        <div class="icon"><span class="flaticon-graduated"></span></div>
                        <div class="text">
                            <asp:Label CssClass="totalviews" runat="server" ID="lblstudents" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
                    <div class="block-18 d-flex align-items-center">
                        <div class="icon"><span class="flaticon-instructor"></span></div>
                        <div class="text">
                            <asp:Label runat="server" CssClass="totalviews" ID="lblinstructrs" Text=""></asp:Label>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="ftco-section ftco-about img">
        <div class="container">
            <div class="row d-flex">
                <div class="col-md-12 about-intro">
                    <div class="row">
                        <div class="col-md-6 d-flex">
                            <div class="d-flex about-wrap">
                                <div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/about-1.jpg);">
                                </div>
                                <div class="img-2 d-flex align-items-center justify-content-center" style="background-image: url(images/about.jpg);">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 pl-md-5 py-5">
                            <div class="row justify-content-start pb-3">
                                <div class="col-md-12 heading-section ftco-animate">
                                    <span class="subheading">Enhanced Your Skills</span>
                                    <h2 class="mb-4">Learn Anything You Want Today</h2>
                                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section services-section">
        <div class="container">
            <div class="row d-flex">
                <div class="col-md-6 heading-section pr-md-5 ftco-animate d-flex align-items-center">
                    <div class="w-100 mb-4 mb-md-0">
                        <span class="subheading">Welcome to StudyLab</span>
                        <h2 class="mb-4">We Are StudyLab An Online Learning Center</h2>
                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                        <div class="d-flex video-image align-items-center mt-md-4">
                            <a href="#" class="video img d-flex align-items-center justify-content-center" style="background-image: url(images/about.jpg);">
                                <span class="fa fa-play-circle"></span>
                            </a>
                            <h4 class="ml-4">Learn anything from StudyLab, Watch video</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12 col-lg-6 d-flex align-self-stretch ftco-animate">
                            <div class="services">
                                <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-tools"></span></div>
                                <div class="media-body">
                                    <h3 class="heading mb-3">Top Quality Content</h3>
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6 d-flex align-self-stretch ftco-animate">
                            <div class="services">
                                <div class="icon icon-2 d-flex align-items-center justify-content-center"><span class="flaticon-instructor"></span></div>
                                <div class="media-body">
                                    <h3 class="heading mb-3">Highly Skilled Instructor</h3>
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6 d-flex align-self-stretch ftco-animate">
                            <div class="services">
                                <div class="icon icon-3 d-flex align-items-center justify-content-center"><span class="flaticon-quiz"></span></div>
                                <div class="media-body">
                                    <h3 class="heading mb-3">World Class &amp; Quiz</h3>
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6 d-flex align-self-stretch ftco-animate">
                            <div class="services">
                                <div class="icon icon-4 d-flex align-items-center justify-content-center"><span class="flaticon-browser"></span></div>
                                <div class="media-body">
                                    <h3 class="heading mb-3">Get Certified</h3>
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <script>

</script>
</asp:Content>
