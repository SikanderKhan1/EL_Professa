using El_Proffesora.user.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_Proffesora.user
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                if (!IsPostBack)
                {
                    data();
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }


        public void data()
        {
            DataTable dt = BL_User.GetInfo(Convert.ToInt32(Session["ID"]));
            if (dt.Rows.Count > 0)
            {
                txtfname.Text = dt.Rows[0]["FirstName"].ToString();
                txtlname.Text = dt.Rows[0]["LastName"].ToString();
                txtemail.Text = dt.Rows[0]["Email"].ToString();
                txtmobile.Text = dt.Rows[0]["Mobile"].ToString();
                txtaddress.Text = dt.Rows[0]["Address"].ToString();
                ddlgender.SelectedValue = dt.Rows[0]["Gender"].ToString();
                txtpassword.Text = dt.Rows[0]["Password"].ToString();
                hdnUserProfile.Value =dt.Rows[0]["Picture"].ToString();
            }
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

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            

            BL_User obj = new BL_User();
            obj.FirstName = txtfname.Text;
            obj.LastName = txtlname.Text;
            obj.Email = txtemail.Text;
            obj.Password = txtpassword.Text;
            obj.Address = txtaddress.Text;
            obj.Mobile = txtmobile.Text;
            if (fileupload.HasFile == true)
            {
                obj.Picture = UploadImage();
            }
            else
            {
                obj.Picture = hdnUserProfile.Value;
            }
            obj.Gender = Convert.ToBoolean(ddlgender.SelectedValue);
            obj.IsNew = false;
            obj.User_ID = Convert.ToInt32(Session["ID"]);
            if (obj.save() == true)
            {
                lblmsg.Text = "Profile updated successfully..";
                Session["Name"] = obj.FirstName + " " + obj.LastName;
                Session["Picture"] = obj.Picture;

            }
            else
            {
                lblmsg.Text = "Please try again..";
            }

            data();

        }
    }
}