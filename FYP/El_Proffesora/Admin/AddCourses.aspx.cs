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
    public partial class AddCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["instructorID"] != null || Session["AdminID"] != null)
            {
                if (!IsPostBack)
                {
                    if (Session["instructorID"] != null && Session["AdminID"] == null)
                    {
                        lblcourseCataAction.Visible = false;
                        loadCategories();
                        ShowCourses();
                        NewCourseForm.Visible = true;
                    }
                    else if (Session["instructorID"] == null && Session["AdminID"] != null)
                    {

                        loadCategories();
                        ShowCourses();
                        NewCourseForm.Visible = false;
                    }
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }


        }

        public void loadCategories()
        {
            ddlcategory.DataSource = BL_Courses.GetCourseCategory();
            ddlcategory.DataValueField = "CategoryID";
            ddlcategory.DataTextField = "CategoryName";
            ddlcategory.DataBind();
            ddlcategory.Items.Insert(0, new ListItem("--- Select Category---", "-1"));
        }

        public void ShowCourses()
        {
            rptcategory.DataSource = BL_Courses.GetAll(Convert.ToInt32(Session["instructorID"]));
            rptcategory.DataBind();
        }

        protected void btndelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            if (BL_Courses.Delete(Convert.ToInt32(btn.CommandArgument)))
            {
                lblmsg.Text = "Deleted";
            }
            else
            {
                lblmsg.Text = "Error occured";
            }
            ShowCourses();
        }
        protected void btnstatus_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            DataTable dt = BL_Courses.GetById(Convert.ToInt32(btn.CommandArgument));
            if (dt.Rows.Count > 0)
            {
                txtCourse.Text = dt.Rows[0]["CourseName"].ToString();
                ddlcategory.SelectedValue = dt.Rows[0]["CategoryID"].ToString();
                hdnid.Value = Convert.ToString(dt.Rows[0]["CourseID"]);
            }
            ShowCourses();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            BL_Courses obj = new BL_Courses();
            obj.IsNew = true;
            if (hdnid.Value != "")
            {
                obj.CourseID = Convert.ToInt32(hdnid.Value);
                obj.IsNew = false;
            }

            obj.CourseName = txtCourse.Text;
            obj.CategoryID = Convert.ToInt32(ddlcategory.SelectedValue);
            obj.InstructorID = Convert.ToInt32(Session["instructorID"]);
            if (fileupload.HasFile)
            {
                obj.Picture = UploadImage();
            }
            if (obj.saveCourses() == true)
            {
                ClearFeild();
                lblmsg.Text = "Save Successfully!";
            }
            else
            {
                lblmsg.Text = "Try Again";
            }
            hdnid.Value = "";
            ShowCourses();
        }



        public string UploadImage()
        {
            string filename = fileupload.FileName;
            string path = Server.MapPath("\\Admin\\UploadFiles\\images\\" + filename);
            fileupload.SaveAs(path);
            return filename;
        }
        public void ClearFeild()
        {
            ddlcategory.SelectedValue = "-1";
            txtCourse.Text = "";
        }
    }
}