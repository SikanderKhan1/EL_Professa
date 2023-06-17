using El_Proffesora.user.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.Admin
{
    public partial class students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["instructorID"] != null)
            {
                if (!IsPostBack)
                {
                    LoadMyStudents();
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }

        }


        public void LoadMyStudents()
        {

            rptusers.DataSource = BL_FollowInstructor.GetStudentsByInstructorId(Convert.ToInt32(Session["instructorID"]));

            rptusers.DataBind();

        }
    }
}