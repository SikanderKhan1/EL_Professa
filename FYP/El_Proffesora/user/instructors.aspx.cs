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
    public partial class instructors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadInstructor();
        }

        public void LoadInstructor()
        {
            rptInstructor.DataSource = BL_FollowInstructor.LoadTopInstructor();
            rptInstructor.DataBind();
        }
    }
}