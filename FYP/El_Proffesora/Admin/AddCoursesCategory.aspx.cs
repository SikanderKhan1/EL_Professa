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
    public partial class AddCourcesCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["instructorID"] != null || Session["AdminID"] != null)
            {
                if (!IsPostBack)
                {
                    if (Session["instructorID"] != null && Session["AdminID"] == null)
                    {
                        CataActionLbl.Visible = false;
                        showCategory(); 
                        AddCataForm.Visible = false;
                    }
                    else if (Session["instructorID"] == null && Session["AdminID"] != null)
                    {
                        CataActionLbl.Visible = true;
                        showCategory();
                        AddCataForm.Visible = true;
                    }
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
        public void showCategory()
        {
            rptcategory.DataSource = BL_CourseCategory.LoadAll();
            rptcategory.DataBind();

        }
        public string UploadImage()
        {
            string filename = "";
            if (fileupload.HasFile)
            {
                filename = fileupload.FileName;
                string path = Server.MapPath("\\Admin\\UploadFiles\\images\\" + filename);
                fileupload.SaveAs(path);
            }
            return filename;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            BL_CourseCategory obj = new BL_CourseCategory();
            obj.IsNew = true;
            if (hdnid.Value != "")
            {
                obj.CategoryID = Convert.ToInt32(hdnid.Value);
                obj.IsNew = false;
            }
            obj.CategoryName = txtcategory.Text;
            if (fileupload.HasFile == true)
            {
                obj.image = UploadImage();
            }
            else
            {
                obj.image = hdncataimg.Value;
            }
            if (obj.saveCategory() == true)
            {
                lblmsg.Text = "Saved Successfully!";
            }
            else
            {
                lblmsg.Text = "Try again";

            }
            hdnid.Value = "";
            txtcategory.Text = "";
            showCategory();
        }

        protected void btnstatus_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            DataTable dt = BL_CourseCategory.LoadAllByCategoryID(Convert.ToInt32(btn.CommandArgument));
            if (dt.Rows.Count > 0)
            {
                txtcategory.Text = dt.Rows[0]["CategoryName"].ToString();
                hdnid.Value = dt.Rows[0]["CategoryID"].ToString();
                hdncataimg.Value = dt.Rows[0]["image"].ToString();
            }
        }

        protected void btndelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            if (BL_CourseCategory.Delete(Convert.ToInt32(btn.CommandArgument)))
            {
                lblmsg.Text = "Deleted";
            }
            else
            {
                lblmsg.Text = "Error occured";
            }
            showCategory();
        }

        protected void btndelete_Click1(object sender, EventArgs e)
        {

        }
    }
}