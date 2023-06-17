using El_Proffesora.Admin.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.Admin
{
    public partial class ViewAll_Instructors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["instructorID"] != null || Session["AdminID"]!=null)
            {
                if (!IsPostBack)
                {
                    if (Session["instructorID"] != null && Session["AdminID"] == null)
                    {
                        showInstructors();
                        lblhideDelEdit.Visible = false;
                    }
                    else if(Session["instructorID"]==null && Session["AdminID"]!=null)
                    {
                        
                            showInstructors();
                            lblhideDelEdit.Visible = true;
                    }
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
            


        }

        protected void btndelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            if (BL_Instructors.Delete(Convert.ToInt32(btn.CommandArgument)) == true)
            {
                lblmsg.Text = "Deleted successfully!";
            }
            else
            {
                lblmsg.Text = "error";
            }

            showInstructors();
        }

        protected void btninactive_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            if (BL_Instructors.ChangeStatus(Convert.ToInt32(btn.CommandArgument)) == true)
            {
                lblmsg.Text = "Status is updated";
            }
            else
            {
                lblmsg.Text = "Status is not updated";
            }

            showInstructors();
        }

        public void showInstructors()
        {
            rptinstructors.DataSource = BL_Instructors.GetAll();
            rptinstructors.DataBind();
        }
    }
}