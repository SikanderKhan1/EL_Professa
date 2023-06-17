<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="AddCoursesCategory.aspx.cs" Inherits="El_Proffesora.Admin.AddCourcesCategory" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminMasterID">
    <asp:HiddenField runat="server" ID="hdnid" />
    <asp:HiddenField runat="server" ID="hdncataimg" />
    <div class="single-pro-review-area mt-t-30 mg-b-15" style="margin-top: 60px">
        <asp:Label runat="server" ID="AddCataForm">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-payment-inner-st">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="basic-login-inner">
                                        <h4>Add Course Category</h4>
                                        <div class=" col-sm-6 form-group-inner">
                                            <label>Category Name</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ErrorMessage="Required*" ControlToValidate="txtcategory" ValidationGroup="c1" runat="server" />
                                            <asp:TextBox ID="txtcategory" class="form-control" placeholder="Enter Category Name" runat="server" />
                                        </div>
                                        <div class=" col-sm-6 form-group-inner">
                                            <label>Image</label>
                                            <asp:FileUpload ID="fileupload" CssClass="form-control fileupload" runat="server" />
                                        </div>

                                        <div class=" col-sm-6 form-group-inner login-btn-inner text-right">
                                            <asp:Label Text="" Font-Bold="true" Font-Italic="true" ForeColor="Green" Style="margin-right: 20px" ID="lblmsg" runat="server" />
                                            <asp:Button Text="Add Category" ID="btnSave" ValidationGroup="c1" class="btn btn-sm btn-primary pull-right login-submit-cs" OnClick="btnSave_Click" runat="server" />

                                        </div>
                                        
                                                                                

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </asp:Label>
    </div>




    <!-- Static Table Start -->
    <div class="data-table-area mg-b-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="sparkline13-list">
                        <div class="sparkline13-hd">
                            <div class="main-sparkline13-hd">
                                <h1>All Categories <span class="table-project-n"></span></h1>
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
                                            <th>Category Name</th>
                                            <asp:Label runat="server" ID="CataActionLbl">
                                                <th>Action(s)</th>
                                             </asp:Label>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptcategory" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("CategoryName") %></td>
                                                    <td>

                                                         <% if (Session["AdminID"] !=null)
                                                            { %>
                                                        <asp:ImageButton Width="20px" OnClick="btndelete_Click" ImageUrl="UploadFiles/img/del.jpg" ID="btndelete" CommandArgument='<%#Eval("CategoryID") %>' runat="server" />
                                                        |
                                                        <asp:ImageButton Width="20px" OnClick="btnstatus_Click" ImageUrl="UploadFiles/img/edit.png" ID="btnstatus" CommandArgument='<%#Eval("CategoryID") %>' runat="server" />

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

</asp:Content>
