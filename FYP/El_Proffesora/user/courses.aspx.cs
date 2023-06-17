using El_Proffesora.user.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.user
{
    public partial class courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCatagories();
                LoadInstructors();
                LoadCataType();
                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    
                    LoadAllCourses(Convert.ToInt32(Request.QueryString["id"]), null);
                }
                else
                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["iid"])))
                {
                    LoadAllCourses( null, Convert.ToInt32(Request.QueryString["iid"]));
                }
                else
                {
                    LoadAllCourses(null, null);
                }
            }
        }
        public void LoadCatagories()
        {
            rptSideBarCata.DataSource = BL_LoadCatagory.Loadcatagories();
            rptSideBarCata.DataBind();
        }
        public void LoadInstructors()
        {
            rptSidebarInstructor.DataSource = BL_LoadCatagory.LoadInstructors();
            rptSidebarInstructor.DataBind();
        }
        public void LoadCataType()
        {
            rptCataType.DataSource = BL_LoadCatagory.LoadCataType();
            rptCataType.DataBind();
        }
        public void LoadAllCourses(int? CategoryId,int? InstructorId)
        {
            rptGetAllCourses.DataSource = BL_Courses.GetAll(CategoryId,InstructorId);
            rptGetAllCourses.DataBind();
        }

        protected void SideBarCata_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            LoadAllCourses(Convert.ToInt32(btn.CommandArgument), null);  
        }

        protected void SideBarInstructor_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            LoadAllCourses(null, Convert.ToInt32(btn.CommandArgument));
        }
    }
}