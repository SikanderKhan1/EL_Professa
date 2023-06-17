<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="ViewAll_Instructors.aspx.cs" Inherits="El_Proffesora.Admin.ViewAll_Instructors" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminMasterID">
    <!-- Static Table Start -->
    <div class="data-table-area mg-b-15" style="margin-top: 60px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="sparkline13-list">
                        <div class="sparkline13-hd">
                            <div class="main-sparkline13-hd">
                                <h1>All Instructors <span class="table-project-n"></span></h1>
                                <div class="text-right">
                                    <asp:Label Text="" Style="margin-bottom: 20px" Font-Italic="true" Font-Bold="true" ForeColor="Green" ID="lblmsg" runat="server" />
                                </div>
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
                                            <th>Profile</th>
                                            <th>Full Name</th>
                                            <th>CNIC</th>
                                            <th>Mobile</th>
                                            <th>Gender</th>
                                            <th>Course</th>
                                            <th>Date Of Joining</th>
                                            <th>Status</th>
                                            
                                                <asp:Label runat="server" ID="lblhideDelEdit">
                                                <th>Action(s)</th>
                                                </asp:Label>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptinstructors" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <img src='UploadFiles/images/<%# Eval("Picture") %>' width="70" height="70" alt="Alternate Text" /></td>
                                                    <td><%#Eval("FullName") %></td>
                                                    <td><%#Eval("CNIC") %></td>
                                                    <td><%#Eval("Mobile") %></td>
                                                    <td><%#Eval("newGender") %></td>
                                                    <td><%#Eval("CourseName") %></td>
                                                    <td><%#Convert.ToDateTime(Eval("DateOfJoin")).ToString("dd/MM/yyyy") %></td>
                                                    <td><%#Eval("newStatus") %></td>
                                                    <td>
                                                        <% if (Session["AdminID"] !=null)
                                                            { %>
                                                        <asp:ImageButton AlternateText="Delete" OnClick="btndelete_Click" ImageUrl="UploadFiles/img/del.jpg" ID="btndelete" Width="20px" CommandArgument='<%#Eval("instructorid") %>' runat="server" />
                                                        |
                                                        <asp:ImageButton AlternateText="change status" OnClick="btninactive_Click" ImageUrl="UploadFiles/img/edit.png" Width="20px" ID="btninactive" CommandArgument='<%#Eval("Instructorid") %>' runat="server" />
                                                        
                                                            <% } %>
                                                        <% else
                                                            {

                                                            }
                                                           %>
                                                        

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
