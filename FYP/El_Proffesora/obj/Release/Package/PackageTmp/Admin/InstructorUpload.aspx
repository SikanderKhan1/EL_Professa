<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="InstructorUpload.aspx.cs" Inherits="El_Proffesora.Admin.InstructorUpload" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminMasterID">
    <asp:HiddenField runat="server" ID="hdnid" />
    <div class="single-pro-review-area mt-t-30 mg-b-15" style="margin-top: 60px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="product-payment-inner-st">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="basic-login-inner">
                                    <h4>Upload Lecture</h4>
                                    <div class=" col-sm-6 form-group-inner">

                                        <label>Lecture Name</label>
                                        <asp:RequiredFieldValidator ErrorMessage="*required" ControlToValidate="txtassignmenName" ValidationGroup="g1" ForeColor="Red" runat="server" />
                                        <asp:TextBox ID="txtassignmenName" class="form-control" runat="server" />
                                    </div>

                                    <div class=" col-sm-6 form-group-inner">
                                        <label>Lecture Type</label>
                                        <asp:RequiredFieldValidator ErrorMessage="*required" InitialValue="-1" ControlToValidate="ddlassignmnettype" ValidationGroup="g1" ForeColor="Red" runat="server" />

                                        <asp:DropDownList ID="ddlassignmnettype" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>

                                    
                                    <div class=" col-sm-6 form-group-inner">
                                        <label>Course Name</label>
                                        <asp:RequiredFieldValidator ErrorMessage="*required" InitialValue="-1" ControlToValidate="ddlCourseid" ValidationGroup="g1" ForeColor="Red" runat="server" />

                                        <asp:DropDownList ID="ddlCourseid" Enabled="true" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class=" col-sm-12 form-group-inner">
                                        <label>Upload Picture/Video</label>
                                        <asp:RequiredFieldValidator ErrorMessage="*required" ControlToValidate="ulpoadfile" ValidationGroup="g1" ForeColor="Red" runat="server" />

                                        <asp:FileUpload ID="ulpoadfile" runat="server" class="form-control" />
                                    </div>
                                    <div class="col-sm-12  text-right">
                                        <asp:Label Text="" Font-Bold="true" ForeColor="Green" Style="margin-right: 20px" Font-Italic="true" ID="lblmsg" runat="server" />
                                        <asp:Button Text="Upload Lecture" ValidationGroup="g1" class="btn btn-primary waves-effect waves-light" ID="btnsave" OnClick="btnsave_Click" runat="server" />

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
