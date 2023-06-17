using El_Proffesora.Admin.BL;
using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.Admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //upload();
                //getinfo();
            }

        }

        //public void getinfo()
        //{
        //    DataTable dt = DataAccess.ExecuteSpTable("sp_getinfo");
        //    //lblcourses.Text = Convert.ToString(dt.Rows[0]["courses"]);
        //    lblinstructrs.Text = Convert.ToString(dt.Rows[0]["instructors"]);
        //    lblstudents.Text = Convert.ToString(dt.Rows[0]["students"]);
        //}


        //public void upload()
        //{
        //    rptinfo.DataSource = BL_Announcement.GetAnnouncements(null);
        //    rptinfo.DataBind();
        //}
    }
}