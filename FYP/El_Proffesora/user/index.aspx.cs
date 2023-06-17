using El_Proffesora.DAL;
using El_Proffesora.user.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.user
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCatagory();
            LoadCourses();
            getinfo();
            GetAnnouncemenets();
        }
        public void getinfo()
        {
            DataTable dt = DataAccess.ExecuteSpTable("sp_getinfo");
            lblcourses.Text = Convert.ToString(dt.Rows[0]["courses"]);
            lblinstructrs.Text = Convert.ToString(dt.Rows[0]["instructors"]);
            lblstudents.Text = Convert.ToString(dt.Rows[0]["students"]);
        }
        public void GetAnnouncemenets()
        {
            SqlParameter[] prm = new SqlParameter[1];
            prm[0] = new SqlParameter("EndDate", DateTime.Now.Date);
            DataTable dt = DataAccess.ExecuteSpTable("sp_GetAnnouncements",prm);
            rptAnn.DataSource = dt;
            rptAnn.DataBind();
        }
        public void LoadCatagory()
        {
            rptIndexCourseCata.DataSource = BL_LoadCatagory.LoadCatagory();
            rptIndexCourseCata.DataBind();
        } 
        public void LoadCourses()
        {
            rptIndexCourses.DataSource = BL_Courses.LoadCourses();
            rptIndexCourses.DataBind();
        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            BL_User obj = new BL_User();
            obj.Email = txtmail.Text;
            obj.Password = txtpassword.Text;
            DataTable dt = obj.login();
            if (dt.Rows.Count > 0)
            {
                Session["ID"] = dt.Rows[0]["User_ID"].ToString();
                Session["Name"] = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();
                Session["Picture"] = dt.Rows[0]["Picture"].ToString();
                Response.Redirect("index.aspx");
            }
            else
            {
                lblmsg.Text = "invalid email or password..";
            }

        }
    }
}