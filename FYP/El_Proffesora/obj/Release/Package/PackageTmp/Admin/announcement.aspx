<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="announcement.aspx.cs" Inherits="El_Proffesora.Admin.announcement" %>

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
                                    <h4>Make Announcement</h4>
                                    <div class=" col-sm-6 form-group-inner">
                                        <label>Announcement</label>
                                        <asp:RequiredFieldValidator ErrorMessage="Required*" ControlToValidate="txtannounce" ForeColor="Red" ValidationGroup="submit" runat="server" />
                                        <asp:TextBox runat="server" placeholder="Alert Message" TextMode="MultiLine" Rows="6" ID="txtannounce" CssClass="form-control" />
                                    </div>
                                    <div class=" col-sm-6 form-group-inner">
                                        <label>Start Date</label>
                                        <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ValidationGroup="submit" ControlToValidate="startdate" runat="server" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ErrorMessage="Invalid Date" ValidationExpression="^([0-9]{1,2})[/]+([0-9]{1,2})[/]+([0-9]{2}|[0-9]{4})$" ValidationGroup="submit" ControlToValidate="startdate" runat="server" />

                                        <asp:TextBox runat="server" placeholder="dd/mm/yyyy" ID="startdate" CssClass="form-control" />
                                    </div>
                                    <div class=" col-sm-6 form-group-inner">
                                        <label>End Date</label>
                                        <asp:RequiredFieldValidator ErrorMessage="Required*" ForeColor="Red" ControlToValidate="enddate" ValidationGroup="submit" runat="server" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" ErrorMessage="Invalid Date" ValidationExpression="^([0-9]{1,2})[/]+([0-9]{1,2})[/]+([0-9]{2}|[0-9]{4})$" ValidationGroup="submit" ControlToValidate="enddate" runat="server" />

                                        <asp:TextBox runat="server" placeholder="dd/mm/yyyy" ID="enddate" CssClass="form-control" />

                                    </div>

                                    <div class="col-sm-12 form-group-inner login-btn-inner text-right">
                                        <asp:Label ID="msg" Font-Italic="true" Style="margin-right: 20px" ForeColor="Green" Font-Bold="true" runat="server" />
                                        <asp:Button Text="Make Announcement" ID="btnsubmit" ValidationGroup="submit" CssClass="btn btn-primary waves-effect waves-light" OnClick="btnsubmit_Click" runat="server" />

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- Static Table Start -->
    <div class="data-table-area mg-b-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="sparkline13-list">
                        <div class="sparkline13-hd">
                            <%--  <div class="main-sparkline13-hd">
                                    <h1>All Instructors <span class="table-project-n"></span></h1>
                                </div>--%>
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
                                            <th>Announcement</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Status</th>
                                            <th>Action(s)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptinfo" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("name") %></td>
                                                    <td><%# Convert.ToDateTime(Eval("StartDate")).ToString("dd/MM/yyyy") %></td>
                                                    <td><%# Convert.ToDateTime(Eval("EndDate")).ToString("dd/MM/yyyy") %></td>
                                                    <td><%#Eval("newstatus") %></td>
                                                    <td>
                                                        <asp:ImageButton AlternateText="Delete" OnClick="btndelete_Click" ImageUrl="UploadFiles/img/del.jpg" ID="btndelete" Width="20px" CommandArgument='<%#Eval("ID") %>' runat="server" />


                                                        |
                                                        <asp:ImageButton AlternateText="change status" OnClick="btninactive_Click" ImageUrl="UploadFiles/img/edit.png" ID="btninactive" Width="20px" CommandArgument='<%#Eval("ID") %>' runat="server" />

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
</asp:Content>
