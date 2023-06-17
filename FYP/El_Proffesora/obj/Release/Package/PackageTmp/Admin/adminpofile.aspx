<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="adminpofile.aspx.cs" Inherits="El_Proffesora.Admin.adminpofile" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style>
        .account {
            margin-top: 50px;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="AdminMasterID">
    <asp:HiddenField runat="server" ID="hdnpicture" />
    <!-- Start Welcome area -->

    <!-- Single pro tab review Start-->
    <div class="single-pro-review-area mt-t-30 mg-b-15">
        <div class="container-fluid">
            <div class="row account">
                <div class="col-sm-3">
                    <div class="profile-info-inner">
                        <div class="profile-img">
                            <asp:Image ImageUrl='' Width="300" ID="adminprofileimage" runat="server" />

                        </div>
                        <div class="profile-details-hr">
                            <div class="row">
                                <div class="col-sm-12">
                                    <label style="color: blue">Name :</label>
                                    <asp:Label Text="" ID="lblname" runat="server" />

                                </div>
                                <div class="col-lg-12">
                                    <label style="color: blue">Mobile :</label>
                                    <asp:Label Text="" ID="lblphone" runat="server" />
                                </div>


                                <div class="col-lg-12">
                                    <label style="color: blue">Email ID :</label>
                                    <asp:Label Text="" ID="lblemail" runat="server" />
                                </div>

                                <div class="col-lg-12">
                                    <label style="color: blue">Password :</label>
                                    <asp:Label Text="" ID="lblpassword" runat="server" />
                                </div>


                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-sm-9">

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>Admin Name</label>
                                <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="A1" ControlToValidate="txtfirstname" runat="server" />
                                <asp:RegularExpressionValidator ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="A1" ControlToValidate="txtfirstname" runat="server" />
                                <asp:TextBox ID="txtfirstname" class="form-control" runat="server" />
                            </div>

                            <div class="form-group">
                                <label>Email</label>
                                <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="A1" ControlToValidate="txtemail" runat="server" />
                                <asp:RegularExpressionValidator ErrorMessage="Invalid" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ForeColor="Red" ValidationGroup="A1" ControlToValidate="txtemail" runat="server" />
                                <asp:TextBox ID="txtemail" class="form-control" runat="server" />
                            </div>

                            <div class="form-group">
                                <label>Profile Picture</label>
                                <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ControlToValidate="fileupload" ValidationGroup="A1" runat="server" />
                                <asp:RegularExpressionValidator ForeColor="Red" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" ErrorMessage="Invalid Object" ValidationGroup="A1" ControlToValidate="fileupload" runat="server" />
                                <asp:FileUpload ID="fileupload" CssClass="color:black;" runat="server"  />

                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group sm-res-mg-15 tbpf-res-mg-15">

                                <div class="form-group">
                                    <label>Mobile</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="A1" ControlToValidate="txtmobile" runat="server" />
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid" ValidationExpression="^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$" ForeColor="Red" ValidationGroup="A1" ControlToValidate="txtmobile" runat="server" />
                                    <asp:TextBox ID="txtmobile" class="form-control" runat="server" />
                                </div>

                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="A1" ControlToValidate="txtpassword" runat="server" />
                                    <asp:TextBox TextMode="Password" ID="txtpassword" class="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <div class="payment-adress mg-t-15 floatright" style="margin-top: 10px">
                                        <asp:Label Text="" Font-Italic="true" ID="lblmsg" ForeColor="Green" Font-Bold="true" runat="server" />
                                        <asp:Button Text="Update Profile" ValidationGroup="A1" class="btn btn-primary waves-effect waves-light mg-b-15" ID="btnupdate" OnClick="btnupdate_Click" runat="server" />


                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <%--<--End Updatefield-->--%>
    </div>
</asp:Content>
