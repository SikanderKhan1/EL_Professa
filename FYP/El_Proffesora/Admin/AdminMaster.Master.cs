using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null && Session["instructorid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Session["AdminID"]==null)
            {
                btnAddinstructor.Visible = false;
            }

        }


        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }

        protected void btntext_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Instructors.aspx");
        }
    }
}