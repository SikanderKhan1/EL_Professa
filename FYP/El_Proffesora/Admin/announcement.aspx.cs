using El_Proffesora.Admin.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.Admin
{
    public partial class announcement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["instructorID"] != null)
            {
                if (!IsPostBack)
                {
                    showData();
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            BL_Announcement obj = new BL_Announcement();
            obj.Name = txtannounce.Text;
            obj.instructorID = Convert.ToInt32(Session["instructorID"]);
            obj.StartDate = DateTime.ParseExact(startdate.Text, "dd/MM/yyyy", null);
            obj.EndDate = DateTime.ParseExact(enddate.Text, "dd/MM/yyyy", null);
            obj.Status = true;
            obj.SaveAnnouncement();
            ClearFields();
            msg.Text = "Successful...";
            showData();
        }

        protected void btndelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            if (BL_Announcement.Delete(Convert.ToInt32(btn.CommandArgument)) == true)
            {
                msg.Text = "Deleted successfully!";
            }
            else
            {
                msg.Text = "error";
            }

            showData();
        }

        protected void btninactive_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            if (BL_Announcement.ChangeStatus(Convert.ToInt32(btn.CommandArgument)) == true)
            {
                msg.Text = "Status is changed..";
            }
            else
            {
                msg.Text = "Status is not changed..";
            }

            showData();
        }

        public void showData()
        {

            rptinfo.DataSource = BL_Announcement.GetAnnouncements(Convert.ToInt32(Session["instructorID"]));
            rptinfo.DataBind();
        }

        public void ClearFields()
        {
            txtannounce.Text = "";
            startdate.Text = "";
            enddate.Text = "";
        }
    }
}