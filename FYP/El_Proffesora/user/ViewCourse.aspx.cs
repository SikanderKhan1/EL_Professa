using El_Proffesora.Admin.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.user
{
    public partial class ViewCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    LoadUploads(Convert.ToInt32(Request.QueryString["id"]));
                    LoadCourse(Convert.ToInt32(Request.QueryString["id"]));
                }
                else
                {
                    Response.Redirect("courses.aspx");
                }
            }
        }
        public string IsVideo(int id, string filename)
        {
            if (id == 2)
            {
                return " <video controls='controls' width='250' height='200'>" +
                     " <source src ='../Admin/UploadFiles/" + filename + "' type = 'video/mp4' /> </ video >";
            }
            else
            {
                return "<img src='../Admin/UploadFiles/pdf.jpg' style='height:200px !important' width = '200' />";
            }
        }

        public void LoadCourse(int CourseId)
        {
            rptCourse.DataSource = BL_Courses.GetByCourseId(CourseId);
            rptCourse.DataBind();
        }
        public void LoadUploads(int CourseId)
        {
            DataTable dt = BL_Assignment.Get(null, null, CourseId);
            rptuploads.DataSource = dt; rptuploads.DataBind();
        }

        protected void lnkshowpdf_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string path = Server.MapPath("~/Admin/UploadFiles/" + btn.CommandArgument);
            Response.AddHeader("content-disposition", "attachment; filename=" + path);
            Response.WriteFile(path);
            // Response.End();
        }
    }
}