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
    public partial class myuploads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["instructorID"] != null)
            {
                if (!IsPostBack)
                {
                    LoadUploads();
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }

        public string IsVideo(int id, string filename)
        {
            if (id == 2)
            {
                return " <video controls='controls' width='250' height='200'>" +
                     " <source src ='UploadFiles/" + filename + "' type = 'video/mp4' /> </ video >";
            }
            else
            {
                return "<img src='UploadFiles/pdf.jpg' style='height:200px !important' width = '200' />";
            }
        }


        public void LoadUploads()
        {
            DataTable dt = BL_Assignment.Get(null, Convert.ToInt32(Session["instructorID"]),null);
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