using El_Proffesora.Admin.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.Admin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (checkbox.Checked == true)
            {
                BL_admin obj = new BL_admin();
                obj.Email = txtusername.Text;
                obj.Password = txtpassword.Text;
                BL_admin admin = obj.Authenticate();
                if (admin != null)
                {
                    Session["AdminID"] = admin.AdminID;
                    Session["AdminName"] = admin.AdminName;
                    Session["image"] = admin.Picture;
                    Response.Redirect("index.aspx");
                }
                else
                {
                    lblmsg.Text = "invalid email or password!";
                }
            }
            else
            {
                BL_Instructors obj = new BL_Instructors();
                obj.Email = txtusername.Text;
                obj.Password = txtpassword.Text;
                BL_Instructors instr = obj.Authenticate();
                if (instr != null)
                {
                    Session["instructorID"] = instr.InstructorID;
                    Session["InstrName"] = instr.FirstName + " " + instr.LastName;
                    Session["Courseid"] = instr.CourseID;
                    Session["image"] = instr.Picture;
                    Session["categoryid"] = instr.CategoryID; Response.Redirect("index.aspx");
                }
                else
                {
                    lblmsg.Text = "invalid email or password!";
                }
            }

        }
    }
}