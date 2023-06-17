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
    public partial class adminpofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] != null)
            {
                if (!IsPostBack)
                {
                    adminInfo();
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }



        }

        public void adminInfo()
        {
            DataTable dt = BL_admin.AdminInfo(Convert.ToInt32(Session["AdminID"]));
            if (dt.Rows.Count > 0)
            {
                lblname.Text = dt.Rows[0]["AdminName"].ToString();
                lblemail.Text = dt.Rows[0]["Email"].ToString();
                lblphone.Text = dt.Rows[0]["Mobile"].ToString();
                lblpassword.Text = dt.Rows[0]["Password"].ToString();
                adminprofileimage.ImageUrl = "~/Admin/UploadFiles/images/" + dt.Rows[0]["Image"].ToString();
                hdnpicture.Value = dt.Rows[0]["Image"].ToString();


                txtfirstname.Text = dt.Rows[0]["AdminName"].ToString();
                txtemail.Text = dt.Rows[0]["Email"].ToString();
                txtpassword.Text = dt.Rows[0]["Password"].ToString();
                txtmobile.Text = dt.Rows[0]["Mobile"].ToString();

            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            BL_admin obj = new BL_admin();
            obj.AdminID = Convert.ToInt32(Session["AdminID"]);
            obj.AdminName = txtfirstname.Text;
            obj.Email = txtemail.Text;
            obj.Password = txtpassword.Text;
            obj.Mobile = txtmobile.Text;
            if (fileupload.HasFile)
            {
                obj.Picture = UploadImage();
            }
            else
            {
                obj.Picture = hdnpicture.Value;
            }
            obj.IsNew = false;
            if (obj.updateAdmin() == true)
            {
                lblmsg.Text = "Profile updated... ";
                Session["AdminName"] = obj.AdminName;
                Session["image"] = obj.Picture;
            }
            else
            {
                lblmsg.Text = "try Again";
            }
            adminInfo();
        }

        public string UploadImage()
        {
            string filename = fileupload.FileName;
            string path = Server.MapPath("\\Admin\\UploadFiles\\images\\" + filename);
            fileupload.SaveAs(path);
            return filename;
        }


        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }
    }
}