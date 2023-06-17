<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="index.aspx.cs" Inherits="El_Proffesora.Admin.index" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminMasterID">
    <div class="analytics-sparkle-area" style="margin: 60px 0">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-sm-4 col-xs-12">
                    <div class="analytics-sparkle-line reso-mg-b-30">
                        <div class="analytics-content">
                            <h5>Registered Students</h5>
                            <h2><span class="counter">
                                <asp:Label Text="" ID="lblstudents" runat="server" /></span> </h2>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-4 col-xs-12">
                    <div class="analytics-sparkle-line reso-mg-b-30">
                        <div class="analytics-content">
                            <h5>Our Instructors</h5>
                            <h2><span class="counter">
                                <asp:Label Text="" ID="lblinstructrs" runat="server" /></span> </h2>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-4 col-xs-12">
                    <div class="analytics-sparkle-line reso-mg-b-30">
                        <div class="analytics-content">
                            <h5>Our Courses</h5>
                            <h2><span class="counter">
                                <asp:Label Text="" ID="lblcourses" runat="server" /></span> </h2>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="data-table-area mg-b-15" style="margin-top: -20px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="sparkline13-list">
                        <div class="sparkline13-hd">
                            <div class="main-sparkline13-hd">
                                <h1>Announcements <span class="table-project-n"></span></h1>
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
                                            <th>Announcement</th>
                                            <th>Made By</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptinfo" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("name") %></td>
                                                    <td><%#Eval("fullname") %></td>
                                                    <td><%# Convert.ToDateTime(Eval("StartDate")).ToString("dd/MM/yyyy") %></td>
                                                    <td><%# Convert.ToDateTime(Eval("EndDate")).ToString("dd/MM/yyyy") %></td>
                                                    <td><%#Eval("newstatus") %></td>

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
