<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="InstructorProfile.aspx.cs" Inherits="El_Proffesora.Admin.InstructorProfile" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminMasterID">
    <asp:HiddenField runat="server" ID="hdnpicture" />

    <!-- Single pro tab review Start-->
    <div class="single-pro-review-area mt-t-30 mg-b-15">
        <div class="container-fluid">
            <div class="row account">
                <div class="col-sm-3">
                    <div class="profile-info-inner">
                        <div class="profile-img">
                            <asp:Image ImageUrl='' Width="300" ID="profileimage" runat="server" />
                        </div>
                        <div class="profile-details-hr">
                            <div class="row">

                                <div class="col-lg-12">
                                    <label style="color: blue">Name : </label>
                                    <asp:Label Text="" ID="lblname" runat="server" />
                                </div>

                                <div class="col-lg-12">
                                    <label style="color: blue">Education :</label>
                                    <asp:Label Text="" ID="lbleducation" runat="server" />
                                </div>
                                <div class="col-lg-12">
                                    <label style="color: blue">Email ID :</label>
                                    <asp:Label Text="" ID="lblemail" runat="server" />
                                </div>
                                <div class="col-lg-12">
                                    <label style="color: blue">Phone :</label>
                                    <asp:Label Text="" ID="lblphone" runat="server" />
                                </div>
                                <div class="col-lg-12">
                                    <label style="color: blue">Address :</label>
                                    <asp:Label Text="" ID="lbladdress" runat="server" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-sm-9">

                    <div class="profile-info-inner">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ValidationGroup="update" ForeColor="Red" ControlToValidate="txtfirstname" runat="server" />
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$" ControlToValidate="txtfirstname" runat="server" />
                                    <asp:TextBox ID="txtfirstname" class="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ValidationGroup="update" ForeColor="red" ControlToValidate="txtlastname" runat="server" />
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$" ControlToValidate="txtlastname" runat="server" />
                                    <asp:TextBox ID="txtlastname" class="form-control" runat="server" />
                                </div>
                            </div>


                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Date Of Birth</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="update" ControlToValidate="txtdob" runat="server" />
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid" ValidationExpression="^([0-9]{1,2})[/]+([0-9]{1,2})[/]+([0-9]{2}|[0-9]{4})$" ForeColor="Red" ControlToValidate="txtdob" runat="server" />
                                    <asp:TextBox ID="txtdob" class="form-control" runat="server" />
                                </div>

                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Education</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="update" ControlToValidate="txteducation" runat="server" />

                                    <asp:TextBox ID="txteducation" CssClass="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ValidationGroup="update" ForeColor="Red" ControlToValidate="txtemail" runat="server" />
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid Format" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ValidationGroup="update" ForeColor="Red" ControlToValidate="txtemail" runat="server" />

                                    <asp:TextBox ID="txtemail" class="form-control" runat="server" />
                                </div>

                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Profile Picture</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="update" ControlToValidate="fileupload" runat="server" />
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid Object" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" ForeColor="Red" ValidationGroup="update" ControlToValidate="fileupload" runat="server" />
                                    <asp:FileUpload ID="fileupload" CssClass="form-control color:black;" runat="server" OnLoad="fileupload_Load" />

                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Gender</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="update" ControlToValidate="ddlgender" runat="server" />

                                    <asp:DropDownList ID="ddlgender" class="form-control" runat="server">
                                        <asp:ListItem Text="--select gender---" Value="-1" />
                                        <asp:ListItem Text="Male" Value="True" />
                                        <asp:ListItem Text="Female" Value="False" />
                                    </asp:DropDownList>
                                </div>


                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Mobile</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Required*" ForeColor="Red" ValidationGroup="update" ControlToValidate="txtmobile" runat="server" />
                                    <asp:RegularExpressionValidator ForeColor="Red" ValidationExpression="^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$" ErrorMessage="Invalid Format" ValidationGroup="update" ControlToValidate="txtmobile" runat="server" />
                                    <asp:TextBox ID="txtmobile" class="form-control" runat="server" />
                                </div>

                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>CNIC</label>
                                    <asp:RequiredFieldValidator ErrorMessage="required*" ForeColor="Red" ValidationGroup="update" ControlToValidate="txtcnic" runat="server" />
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid Format" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$" ForeColor="Red" ValidationGroup="update" ControlToValidate="txtcnic" runat="server" />
                                    <asp:TextBox ID="txtcnic" class="form-control" runat="server" />
                                </div>
                            </div>
                            
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="update" ControlToValidate="txtpassword" runat="server" />
                                    <asp:TextBox ID="txtpassword" class="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Address</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="update" ControlToValidate="txtaddress" runat="server" />
                                    <asp:TextBox ID="txtaddress" class="form-control" runat="server" />
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="payment-adress mg-t-15">
                                    <asp:Button Text="Update Profile" ValidationGroup="update" class="btn btn-primary waves-effect waves-light mg-b-15" ID="btnupdate" OnClick="btnupdate_Click" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</asp:Content>
