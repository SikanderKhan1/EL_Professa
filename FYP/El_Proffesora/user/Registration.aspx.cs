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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string UploadImage()
        {
            string filename = fileupload.FileName;
            string path = Server.MapPath("\\Admin\\UploadFiles\\images\\" + filename);
            fileupload.SaveAs(path);
            return filename;
        }


        protected void btnReg_Click(object sender, EventArgs e)
        {
            DataTable dt = BL_User.AuthUser(txtemail.Text, txtmobile.Text);
            if (dt.Rows.Count > 0)
            {
                lblmsg.Text = "Already exists..";
            }
            else
            {
                BL_User obj = new BL_User();
                obj.FirstName = txtfname.Text;
                obj.LastName = txtlname.Text;
                obj.Gender = Convert.ToBoolean(ddlgender.SelectedValue);
                obj.Email = txtemail.Text;
                obj.Password = txtpassword.Text;
                obj.Address = txtaddress.Text;
                obj.Mobile = txtmobile.Text;
                obj.Status = true;
                obj.IsNew = true;
                if (fileupload.HasFile)
                {
                    obj.Picture = UploadImage();
                }

                string msg = "Dear" + obj.FirstName + " " + obj.LastName + "! Your registration in Online Academy is done successfully. Your \n Email : " + obj.Email + "\n Password :" + obj.Password + " \n <b> Thank you";
                //SendSms.send(obj.Mobile, msg);
                //SendEmail.SendMail(obj.Email, "Academy Registration", msg);
                if (obj.save())
                {
                    Response.Redirect("index.aspx");
                }
            }
        }
    }
}