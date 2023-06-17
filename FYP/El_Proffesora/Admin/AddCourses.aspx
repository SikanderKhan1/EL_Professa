<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="AddCourses.aspx.cs" Inherits="El_Proffesora.Admin.AddCourses" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminMasterID">
    <asp:HiddenField runat="server" ID="hdnid" />
    <div class="single-pro-review-area mt-t-30 mg-b-15" style="margin-top: 60px">
        <asp:Label runat="server" id="NewCourseForm">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="product-payment-inner-st">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="basic-login-inner">
                                    <h4>Add New Course</h4>
                                    <div class=" col-sm-6 form-group-inner">

                                        <label>Course Name</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ErrorMessage="Required*" ControlToValidate="txtCourse" ValidationGroup="c2" runat="server" />
                                        <asp:TextBox ID="txtCourse" class="form-control" placeholder="Enter Course Name" runat="server" />
                                    </div>
                                    <div class=" col-sm-6 form-group-inner">
                                        <label>Course Category</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="-1" ForeColor="Red" ErrorMessage="Required*" ControlToValidate="ddlcategory" ValidationGroup="c2" runat="server" />
                                        <asp:DropDownList runat="server" ID="ddlcategory" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                    <div class=" col-sm-12 form-group-inner">
                                        <asp:Label Text="Picture" Font-Bold="true" runat="server" />
                                        <asp:RequiredFieldValidator ErrorMessage="Required*" ValidationGroup="c2" ForeColor="Red" ControlToValidate="fileupload" runat="server" />
                                        <asp:RegularExpressionValidator ValidationGroup="c2" ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" ForeColor="Red" ErrorMessage="Invalid" ControlToValidate="fileupload" runat="server" />
                                        <br />
                                        <asp:FileUpload ID="fileupload" class="form-control" runat="server" />
                                    </div>

                                    <div class=" col-sm-12 text-right form-group-inner login-btn-inner">
                                        <asp:Label Text="" Font-Bold="true" ForeColor="Green" Font-Italic="true" ID="lblmsg" Style="margin-right: 20px" runat="server" />


                                        <asp:Button Text="Add New Course" ID="btnSave" ValidationGroup="c2" class="btn btn-sm btn-primary pull-right login-submit-cs" OnClick="btnSave_Click" runat="server" />
                                   
                                        </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </asp:Label>
        <!-- Static Table Start -->
        <div class="data-table-area mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="sparkline13-list">
                            <div class="sparkline13-hd">
                                <div class="main-sparkline13-hd">
                                    <h1>All Courses <span class="table-project-n"></span></h1>
                                </div>
                            </div>
                            <div class="sparkline13-graph">
                                <div class="datatable-dashv1-list custom-datatable-overright">
                                    <div id="toolbar">
                                        <select class="form-control dt-tb">
                                            <option value="">Export Basic</option>
                                            <option value="all">Export All</option>
                                            <option value="selected">Export Selected</option>
                                        </select>
                                    </div>
                                    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                                        data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                        <thead>
                                            <tr>
                                                <th>Course Name</th>
                                                <th>Category</th>
                                                <th>Picture</th>
                                                <asp:Label runat="server" ID="lblcourseCataAction">
                                                <th>Action(s)</th>
                                                </asp:Label>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rptcategory" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%#Eval("CourseName") %></td>
                                                        <td><%#Eval("CategoryName") %></td>
                                                        <td>
                                                            <img src='UploadFiles/images/<%#Eval("Picture") %>' width="50" height="50" alt="Alternate Text" /></td>

                                                        <td>
                                                            <% if (Session["AdminID"] !=null)
                                                            { %>
                                                            <asp:ImageButton AlternateText="Delete" OnClick="btndelete_Click" Width="20px" ImageUrl="UploadFiles/img/del.jpg" ID="btndelete" CommandArgument='<%#Eval("CourseID") %>' runat="server" />
                                                            |
                                                            <asp:ImageButton AlternateText="change status" OnClick="btnstatus_Click" Width="20px" ImageUrl="UploadFiles/img/edit.png" ID="btnstatus" CommandArgument='<%#Eval("CourseID") %>' runat="server" />

                                                            <% } %>
                                                        
                                                            
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Static Table End -->
    </div>
</asp:Content>
