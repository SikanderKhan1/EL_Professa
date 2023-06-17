using El_Proffesora.Admin.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.Admin
{
    public partial class InstructorUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["instructorID"] != null)
            {
                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["upid"]))
                    {
                        GetUpload();
                    }
                    
                    loadCourses();
                    assignmentType();
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }

        }


        public void GetUpload()
        {
            DataTable dt = BL_Assignment.Get(Convert.ToInt32(Request.QueryString["upid"]), Convert.ToInt32(Session["instructorID"]),null);
            txtassignmenName.Text = dt.Rows[0]["AssignmentName"].ToString();
            ddlassignmnettype.SelectedValue = dt.Rows[0]["AssignmentTypeID"].ToString();
            ddlCourseid.SelectedValue = dt.Rows[0]["CourseID"].ToString();
            hdnid.Value = dt.Rows[0]["AssignmentTypeID"].ToString();
        }
        public void Courses()
        {
            ddlassignmnettype.DataSource = BL_Courses.GetAll(Convert.ToInt32(Session["instructorID"]));
            ddlassignmnettype.DataValueField = "CourseId";
            ddlassignmnettype.DataTextField = "CourseName";
            ddlassignmnettype.DataBind();
            ddlassignmnettype.Items.Insert(0, new ListItem("---Select Course---", "-1"));
        }

        public void assignmentType()
        {
            ddlassignmnettype.DataSource = BL_AssignmentType.GetAll();
            ddlassignmnettype.DataValueField = "AssignmentTypeID";
            ddlassignmnettype.DataTextField = "AssignmentType";
            ddlassignmnettype.DataBind();
            ddlassignmnettype.Items.Insert(0, new ListItem("---Select Type---", "-1"));
        }

        
        public void loadCourses()
        {
            ddlCourseid.DataSource = BL_Courses.GetAll(Convert.ToInt32(Session["instructorID"]));
            ddlCourseid.DataValueField = "CourseID";
            ddlCourseid.DataTextField = "CourseName";
            ddlCourseid.DataBind();
            ddlCourseid.Items.Insert(0, new ListItem("-- Select Course--", "-1"));
            ddlCourseid.SelectedValue = Session["Courseid"].ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            BL_Assignment obj = new BL_Assignment();
            obj.Isnew = true;
            if (hdnid.Value != "")
            {
                obj.Isnew = false;
                obj.AssignmentID = Convert.ToInt32(hdnid.Value);
            }
            obj.AssignmentName = txtassignmenName.Text;
            obj.AssignmentTypeId = Convert.ToInt32(ddlassignmnettype.SelectedValue);

            obj.UploadDate = DateTime.Now;
            obj.InstructorID = Convert.ToInt32(Session["instructorID"]);
           
            obj.CourseID = Convert.ToInt32(ddlCourseid.SelectedValue);
            obj.FileName = UploadFile();
            if (obj.saveAssignment())
            {
                lblmsg.Text = "Upload successful...";
                hdnid.Value = "";
                ddlassignmnettype.SelectedValue = "-1";
                txtassignmenName.Text = "";
            }
        }

        public string UploadFile()
        {
            string filename = "";
            if (ulpoadfile.HasFile)
            {
                filename = ulpoadfile.FileName;
                ulpoadfile.SaveAs(Server.MapPath("\\Admin\\UploadFiles\\" + filename));
            }
            return filename;

        }
    }
}