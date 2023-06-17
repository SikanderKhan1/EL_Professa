<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="students.aspx.cs" Inherits="El_Proffesora.Admin.students" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminMasterID">
    <!-- Static Table Start -->
    <div class="data-table-area mg-b-15" style="margin-top: 60px;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="sparkline13-list">
                        <div class="sparkline13-hd">
                            <div class="main-sparkline13-hd">
                                <h1>My Students <span class="table-project-n"></span></h1>
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
                                    data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar" class="tbl">
                                    <thead>
                                        <tr>
                                            <th>Profile</th>
                                            <th>Full Name</th>
                                            <th>Mobile</th>
                                            <th>Email</th>
                                            <th>Gender</th>
                                            <th>Address</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptusers" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <img src='UploadFiles/images/<%# Eval("Picture") %>' width="70" height="70" alt="Alternate Text" /></td>
                                                    <td><%#Eval("fullname") %></td>
                                                    <td><%#Eval("Mobile") %></td>
                                                    <td><%#Eval("Email") %></td>
                                                    <td><%#Eval("newgender") %></td>
                                                    <td><%#Eval("Address") %></td>

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
