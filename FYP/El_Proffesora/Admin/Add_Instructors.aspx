<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="Add_Instructors.aspx.cs" Inherits="El_Proffesora.Admin.Add_Instructors" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminMasterID">

    <!-- Single pro tab review Start-->
    <div class="single-pro-review-area mt-t-30 mg-b-15" style="margin-top: 60px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="product-payment-inner-st">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="basic-login-inner">
                                    <h4>Add Instructor</h4>
                                    <div class=" col-sm-4 form-group-inner">
                                        <label>First Name</label>
                                        <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="Required*" ControlToValidate="txtfirstname" ValidationGroup="login" runat="server" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="^[a-zA-Z]+$" ControlToValidate="txtfirstname" runat="server" />
                                        <asp:TextBox ID="txtfirstname" class="form-control" placeholder="Enter First Name" runat="server" />
                                    </div>
                                    <div class="col-sm-4 form-group-inner">
                                        <label>Last Name</label>
                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" ErrorMessage="Required*" ControlToValidate="txtlastname" ValidationGroup="login" runat="server" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationExpression="^[a-zA-Z]+$" ForeColor="Red" ErrorMessage="Invalid" ControlToValidate="txtlastname" runat="server" />
                                        <asp:TextBox ID="txtlastname" class="form-control" placeholder="Enter Last Name" runat="server" />
                                    </div>
                                    <div class="col-sm-4 form-group-inner">
                                        <label>CNIC</label>
                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator10" ErrorMessage="Required*" ControlToValidate="txtcnic" ValidationGroup="login" runat="server" />
                                        <asp:RegularExpressionValidator ForeColor="Red" ID="RegularExpressionValidator2" ErrorMessage="Invalid CNIC" ControlToValidate="txtcnic" ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$" runat="server" />

                                        <asp:TextBox ID="txtcnic" class="form-control" placeholder="Enter CNIC No" runat="server" />
                                    </div>

                                    <div class="col-sm-4 form-group-inner">
                                        <label>Mobile</label>
                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator9" ErrorMessage="Required*" ControlToValidate="txtmobile" ValidationGroup="login" runat="server" />

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ErrorMessage="Invalid Mobile No" ForeColor="Red" ControlToValidate="txtmobile" ValidationExpression="^((\+92)|(0092)){0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}\d{7}$" runat="server" />
                                        <asp:TextBox ID="txtmobile" class="form-control" placeholder="Enter Mobile No(+92)" runat="server" />
                                    </div>



                                    <div class="col-sm-4 form-group-inner">
                                        <label>Gender</label>
                                        <asp:RequiredFieldValidator InitialValue="-1" ForeColor="Red" ID="RequiredFieldValidator6" ValidationGroup="login" ErrorMessage="required*" ControlToValidate="ddlgender" runat="server" />
                                        <asp:DropDownList ID="ddlgender" class="form-control" runat="server">
                                            <asp:ListItem Text="--Select Gender--" Value="-1" />
                                            <asp:ListItem Text="Male" Value="true" />
                                            <asp:ListItem Text="Female" Value="false" />
                                        </asp:DropDownList>
                                    </div>



                                    <div class="col-sm-4 form-group-inner">
                                        <label>Date Of Birth</label>
                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator5" ErrorMessage="Required*" ControlToValidate="txtdob" ValidationGroup="login" runat="server" />
                                        <asp:RegularExpressionValidator ForeColor="Red" ID="RegularExpressionValidator6" ErrorMessage="Invalid Date" ValidationExpression="^([0-9]{1,2})[/]+([0-9]{1,2})[/]+([0-9]{2}|[0-9]{4})$" ValidationGroup="login" ControlToValidate="txtdob" runat="server" />

                                        <asp:TextBox ID="txtdob" class="form-control" placeholder="dd/mm/yyyy" runat="server" />
                                    </div>

                                    <div class="col-sm-4 form-group-inner">
                                        <label>Education</label>
                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator7" ErrorMessage="Required*" ControlToValidate="txteducation" ValidationGroup="login" runat="server" />
                                        <asp:TextBox ID="txteducation" class="form-control" placeholder="Enter Education" runat="server" />
                                    </div>

                                    

                                   

                                    <div class="col-sm-4 form-group-inner">
                                        <label>Profile Picture</label>
                                        <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ControlToValidate="fileuplod" ValidationGroup="login" runat="server" />
                                        <asp:RegularExpressionValidator ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" ForeColor="Red" ErrorMessage="Invalid" ControlToValidate="fileuplod" runat="server" />
                                        <asp:FileUpload ID="fileuplod" CssClass="form-control" OnLoad="fileuplod_Load" runat="server" />
                                    </div>
                                    <div class="col-sm-4 form-group-inner">
                                        <label>Email</label>
                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" ErrorMessage="Required*" ControlToValidate="txtemail" ValidationGroup="login" runat="server" />

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="invalid email address" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ControlToValidate="txtemail" runat="server" />
                                        <asp:TextBox ID="txtemail" class="form-control" placeholder="Enter Email" runat="server" />
                                    </div>
                                    <div class="col-sm-4 form-group-inner">
                                        <label>Date Of Joining</label>
                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" ErrorMessage="Required*" ControlToValidate="txtdoj" ValidationGroup="login" runat="server" />
                                        <asp:RegularExpressionValidator ForeColor="Red" ID="RegularExpressionValidator7" ErrorMessage="Invalid Date" ValidationExpression="^([0-9]{1,2})[/]+([0-9]{1,2})[/]+([0-9]{2}|[0-9]{4})$" ValidationGroup="login" ControlToValidate="txtdoj" runat="server" />

                                        <asp:TextBox ID="txtdoj" class="form-control" placeholder="dd/mm/yyyy" runat="server" />
                                    </div>
                                    <div class="col-sm-4 form-group-inner">
                                        <label>Status</label>
                                        <asp:RequiredFieldValidator ForeColor="Red" InitialValue="-1" ValidationGroup="login" ID="RequiredFieldValidator8" ErrorMessage="Required*" ControlToValidate="ddlstatus" runat="server" />
                                        <asp:DropDownList ID="ddlstatus" Class="form-control" runat="server">
                                            <asp:ListItem Text="--Select Status--" Value="-1" />
                                            <asp:ListItem Text="Available" Value="true" />
                                            <asp:ListItem Text="Unavailable" Value="false" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-sm-8 form-group-inner">
                                        <label>Address</label>
                                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" ErrorMessage="Required*" ControlToValidate="txtaddress" ValidationGroup="login" runat="server" />
                                        <asp:TextBox ID="txtaddress" class="form-control" placeholder="Enter Address" runat="server" />
                                    </div>
                                    <div class="col-sm-12 form-group-inner text-right login-btn-inner">
                                        <asp:Label Text="" ID="lblmsg" ForeColor="Green" Font-Bold="true" Font-Italic="true" Style="margin-right: 20px" runat="server" />
                                        <asp:Button Text="Add Instructor" ID="Button1" ValidationGroup="login" class="btn btn-lg btn-primary pull-right login-submit-cs" OnClick="Button1_Click" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
