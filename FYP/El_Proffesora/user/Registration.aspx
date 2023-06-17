<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user/UserMaster.Master" CodeBehind="Registration.aspx.cs" Inherits="El_Proffesora.user.login" %>
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
   </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="UserMasterID">
     <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1_1.jpg');">
        <div class="overlay"></div>
    </div>
    <section class="ftco-section ftco-no-pb ftco-no-pt">
        <div class="container">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10 order-md-last" style="margin-bottom: 30px">
                    <div id="reg" class="login-wrap p-4 p-md-5 form-div">
                        <h3 id="formHeading" class="mb-4">Register Now</h3>
                        <p id="Registrnpage" style="display: none" class="text-center">Go to Registration Page <a href="#signin" id="loginLink">Registration</a></p>
                        <div id="signupForm" class="signup-form">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6" style="display: inline-flex; margin-top: 18px">
                                        <label class="label" for="First Name">First Name</label>
                                        <asp:TextBox runat="server" class="form-control" placeholder="First Name" style="border-radius: 2px" ID="txtfname" required="required"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6" style="display: inline-flex; margin-top: 18px">
                                        <label class="label" for="Last Name">Last Name</label>
                                        <asp:TextBox runat="server" ID="txtlname" class="form-control" placeholder="Last Name" style="border-radius: 2px" required="required"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="label" for="email">Email Address</label>
                                <asp:TextBox runat="server" ID="txtemail" class="form-control" placeholder="example@gmail.com" style="border-radius: 2px" required="required"></asp:TextBox>
                           
                                </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6" style="display: inline-flex">
                                        <label class="label" for="password">Password</label>
                                        <asp:TextBox runat="server" ID="txtpassword" TextMode="password" class="form-control" placeholder="**********" style="border-radius: 2px" required="required"></asp:TextBox>
                                   
                                        </div>
                                    <div class="col-sm-6 marg-top" style="display: inline-flex;">
                                        <label class="label" for="password">Confirm Password</label>
                                        <asp:TextBox runat="server" TextMode="password" ID="confirmpassword" class="form-control" placeholder="**********" style="border-radius: 2px" required="required"></asp:TextBox>
                                   
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
                                    <div class="col-sm-6" style="display: inline-flex;">
                                        <label class="label" for="MobileNumber">Mobile </label>
                                        <asp:TextBox runat="server" TextMode="Number" ID="txtmobile" class="form-control" placeholder="+92xxx-xxxxxxx" style="border-radius: 2px" required="required"/>
                                        
                                    </div>
                                    <div class="col-sm-6 marg-top" style="display: inline-flex;">
                                         <label class="label" for="Adress">Address </label>
                                        <asp:TextBox runat="server" ID="txtaddress" TextMode="MultiLine" CssClass="form-control" placeholder="Address" style="border-radius: 2px" required="required"/>
                                      
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div class="form-group d-flex justify-content-center mt-4" id="btnreg">
                            <asp:Label Text="" ID="lblmsg" ForeColor="Red" Font-Italic="true" Font-Bold="true" Style="margin-right:20px" runat="server" />
                                <asp:Button runat="server" ID="btnReg" Text="Register" CssClass="btn btn-primary btn-lg" OnClick="btnReg_Click" />
                        </div>
                        <p class="text-center">Go to Login Page <a href="index.aspx" >Login</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

   
</asp:Content>
