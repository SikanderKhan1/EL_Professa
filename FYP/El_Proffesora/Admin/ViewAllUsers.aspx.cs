using El_Proffesora.user.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.Admin
{
    public partial class ViewAllUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["instructorID"] != null || Session["AdminID"] != null)
            {
                if (!IsPostBack)
                {
                    
                        showUsers();
                    
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
            
        }



        public void showUsers()
        {
            rptusers.DataSource = BL_User.GetAll();
            rptusers.DataBind();
        }
    }
}