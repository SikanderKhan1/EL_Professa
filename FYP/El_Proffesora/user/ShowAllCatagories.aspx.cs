using El_Proffesora.Admin.BL;
using El_Proffesora.DAL;
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
    public partial class ShowAllCatagories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                if (!IsPostBack)
                {
                    LoadAllCata(Convert.ToInt32(null));

                    ViewState["page"] = 0;
                    ViewState["lastrecord"] =BL_CourseCategory.GetLastRecord();
                    LoadAllCata(Convert.ToInt32(ViewState["page"]));
                    ViewState["page"] = Convert.ToInt32(ViewState["lastrecord"]) > 6 ? 6 : 0;
                    btnprev.Enabled = false;
                    btnnext.Enabled = Convert.ToInt32(ViewState["lastrecord"]) > 6 ? true : false;
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
            
        }

        public void LoadAllCata(int p)  
           
        {
            rptGetAllCatagories.DataSource = BL_CourseCategory.LoadAll(p);
            rptGetAllCatagories.DataBind();
        }
        
        protected void btnLoadCataCourse_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int IDD=Convert.ToInt32(btn.CommandArgument);
            Response.Redirect("ViewCourse.aspx?val="+IDD);
        }
        
        protected void btnnext_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ViewState["page"]) < Convert.ToInt32(ViewState["lastrecord"]))
            {
                LoadAllCata(Convert.ToInt32(ViewState["page"]));

                ViewState["page"] = Convert.ToInt32(ViewState["page"]) + 6;
                if (Convert.ToInt32(ViewState["lastrecord"]) <= Convert.ToInt32(ViewState["page"]))
                {

                    //lblpag.Text = ViewState["lastrecord"] + " of " + ViewState["lastrecord"];
                    btnnext.Enabled = false;
                    ViewState["page"] = Convert.ToInt32(ViewState["page"]) - 6;


                }
                else
                {
                    //lblpag.Text = ViewState["page"] + " of " + ViewState["lastrecord"];
                    btnnext.Enabled = true;
                }

                btnprev.Enabled = Convert.ToInt32(ViewState["page"]) > 0 ? true : false;
            }
        }

        protected void btnprev_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ViewState["page"]) > 0)
            {
                ViewState["page"] = Convert.ToInt32(ViewState["page"]) - 6;
                LoadAllCata(Convert.ToInt32(ViewState["page"]));

                
            }
            btnprev.Enabled = Convert.ToInt32(ViewState["page"]) > 0 ? true : false;

            btnnext.Enabled = Convert.ToInt32(ViewState["page"]) < Convert.ToInt32(ViewState["lastrecord"]) ? true : false;
        }
    }
}