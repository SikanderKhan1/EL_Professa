<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMaster.Master" CodeBehind="UserProfile.aspx.cs" Inherits="El_Proffesora.user.UserProfile" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
   <style>
        .gender
    {
            border-radius:0px!important
    }    .fileupload
    {
            border-radius:0px!important;
            padding-top:10px;
    }
       input::-webkit-outer-spin-button,
       input::-webkit-inner-spin-button {
           -webkit-appearance: none;
           margin: 0;
       }
        @media screen and (max-width:575px)
        {
            .marg-top{
                margin-top:15px!important;
            }
            .form-div
            {
                height:900px!important;
            }
        }
        .btn
        {
            width:130px;
            border-radius:1px;
        }
       .card {
           margin: 0 auto;
           float: none;
           margin-bottom: 10px;
           box-shadow:2px 3px 5px gray;
           border:0px!important;
       }
        .rounded
        {
            border-radius:3%!important;
        }
   </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="UserMasterID">
    <asp:HiddenField runat="server" ID="hdnUserProfile" />
     <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1_1.jpg');">
        <div class="overlay"></div>
    </div>
    <section class="ftco-section ftco-no-pb ftco-no-pt">
        <div class="container">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10 order-md-last" style="margin-bottom: 30px">
                    <div id="reg" class="login-wrap p-4 p-md-5 form-div">
                        <div class="card" style="width: 18rem;">
                            <img class="card-img-top img-thumbnail" src='../Admin/UploadFiles/images/<%= Session["Picture"]%>'  alt="Card image cap">
                           
                        </div>
                        <h2 class="text-center" style="font-size:32px;font-weight:bold;text-decoration:underline">Profile</h2>
                        <div id="signupForm" class="signup-form">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6" style="display: inline-flex; margin-top: 18px">
                                        <label class="label" for="First Name">First Name</label>
                                        <asp:TextBox runat="server" class="form-control" placeholder="John" style="border-radius: 2px" id="txtfname" required="required"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6" style="display: inline-flex; margin-top: 18px">
                                        <label class="label" for="Last Name">Last Name</label>
                                        <asp:TextBox ID="txtlname" runat="server" class="form-control" placeholder="Deo" style="border-radius: 2px" required="required"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="label" for="email">Email Address</label>
                                <asp:TextBox runat="server" TextMode="Email" class="form-control" ID="txtemail" placeholder="example@gmail.com" style="border-radius: 2px" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6" style="display: inline-flex">
                                        <label class="label" for="password">Password</label>
                                        <asp:TextBox runat="server" id="txtpassword" type="password" class="form-control" placeholder="Password" style="border-radius: 2px" required="required"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6" style="display: inline-flex;">
                                        <label class="label" for="MobileNumber">Mobile </label>
                                        <asp:TextBox runat="server" class="form-control" placeholder="+92000-0000000" style="border-radius: 2px" id="txtmobile" required="required" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6" style="display: inline-flex;">
                                        <asp:DropDownList ID="ddlgender" CssClass="form-control gender" runat="server" required="required">
                                            <asp:ListItem Text="--Select Gender--" Value="-1" />
                                            <asp:ListItem Text="Male" Value="True" />
                                            <asp:ListItem Text="Female" Value="False" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-sm-6 marg-top" style="display: inline-flex; margin-top: 0px">
                                        <asp:FileUpload ID="fileupload" CssClass="form-control fileupload" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-12 marg-top" style="display: inline-flex;">
                                         <label class="label" for="Address">Address </label>
                                        <asp:TextBox runat="server" class="form-control" placeholder="Address" style="border-radius: 2px" id="txtaddress" required="required"/>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div class="form-group d-flex justify-content-center mt-4" id="btnreg">
                            <asp:Label Text="" ID="lblmsg" ForeColor="Green" Font-Italic="true" CssClass="text-center" Font-Bold="true" runat="server" />
                                <asp:Button runat="server" ID="btnupdate" Text="Update" CssClass="btn btn-primary btn-lg" OnClick="btnupdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

   
</asp:Content>