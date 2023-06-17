<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/AdminMaster.Master" CodeBehind="myuploads.aspx.cs" Inherits="El_Proffesora.Admin.myuploads" %>

<asp:Content runat="server" ContentPlaceHolderID="AdminMasterID">
<div class="courses-area" style="margin-top:70px">
            <div class="container-fluid">
                <div class="row">
                    <asp:Repeater ID="rptuploads" runat="server">
                        <ItemTemplate>
                             <div class="col-lg-3">
                        <div class="courses-inner res-mg-b-30">
                          
                               
                            <div class="courses-title text-center">
                              
                                <a href="#"> <%# IsVideo(Convert.ToInt32(Eval("AssignmentTypeID")),Convert.ToString(Eval("FileName")))%>
                         </a>         <h2  style="color:blue"><%# Eval("AssignmentName") %></h2>
                            </div>
                            
                            <div class="course-des">
                                <p><span><i class="fa fa-clock"></i></span> <b style="color:blue">Category : </b> <%# Eval("CategoryName") %></p>
                                <p><span><i class="fa fa-clock"></i></span> <b  style="color:blue">Course : </b> <%# Eval("CourseName") %></p>
                                <p><span><i class="fa fa-clock"></i></span> <b  style="color:blue">Upload Date : </b> <%# Convert.ToDateTime(Eval("UploadDate")).ToString("dd/MM/yyyy hh:mm tt") %></p>
                            </div>
                            <div class="product-buttons">
                                <a href="InstructorUpload.aspx?upid=<%# Eval("AssignmentID") %>" class="btn button-default cart-btn">Update</a>
                             <asp:LinkButton Text="Download" OnClick="lnkshowpdf_Click" CssClass="btn button-default cart-btn" CommandArgument='<%# Eval("FileName") %>' runat="server" />
                          
                            </div>
                        </div>
                    </div>
                        </ItemTemplate>
                    </asp:Repeater>
                   
                   
                    </div>
                </div>
          
        </div>
</asp:Content>