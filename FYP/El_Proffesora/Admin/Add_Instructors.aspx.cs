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
    public partial class Add_Instructors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] != null)
            {
                if (!IsPostBack)
                {
                   
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt = BL_Instructors.CheckInstructor(txtemail.Text, txtmobile.Text, txtcnic.Text);
            if (dt.Rows.Count > 0)
            {
                lblmsg.Text = "Already exists..";
            }
            else
            {
                BL_Instructors obj = new BL_Instructors();
                obj.FirstName = txtfirstname.Text;
                obj.LastName = txtlastname.Text;
                obj.Email = txtemail.Text;
                obj.Mobile = txtmobile.Text;
                obj.Address = txtaddress.Text;
                obj.Education = txteducation.Text;
                obj.DateOfBirth = DateTime.ParseExact(txtdob.Text, "dd/MM/yyyy", null);
                obj.DateOfJoin = DateTime.ParseExact(txtdoj.Text, "dd/MM/yyyy", null);
                obj.Status = Convert.ToBoolean(ddlstatus.SelectedValue);
                obj.Gender = Convert.ToBoolean(ddlgender.SelectedValue);
                
                obj.CNIC = txtcnic.Text;
                if (fileuplod.HasFile)
                {
                    obj.Picture = UploadImage();
                }
                obj.IsNew = true;
                string password = RandomClass.GenerateString(10);
                obj.Password = password;
                if (obj.SaveInstructors() == true)
                {
                    string msg = "Dear " + obj.FirstName + " " + obj.LastName + " ! your registration is done successfully.</br>Email : " + obj.Email + "</br>Password :" + password + "</br>visit on this www.onlinelearning.com  </br><b>Thank you.</b>";

                    SendEmail.SendMail(obj.Email, "Online Learning", msg);

                    SendSms.SendMessage(obj.Mobile.Replace("-", ""), "Welcome");
                    ClearFields();
                    lblmsg.Text = "Instructor is added successfully!";
                }
                else
                {
                    lblmsg.Text = "Try Again";
                }

            }
        }

        protected void fileuplod_Load(object sender, EventArgs e)
        {

        }
        public string UploadImage()
        {
            string filename = fileuplod.FileName;
            string path = Server.MapPath("\\Admin\\UploadFiles\\images\\" + filename);
            fileuplod.SaveAs(path);
            return filename;
        }

        public void ClearFields()
        {
            txtfirstname.Text = "";
            txtlastname.Text = "";
            txtemail.Text = "";
            txtaddress.Text = "";
            txtmobile.Text = "";
            txtaddress.Text = "";
            txtcnic.Text = "";
            txtdob.Text = "";
            txtdoj.Text = "";
            txteducation.Text = "";
            ddlgender.SelectedIndex = -1;
           
           

        }

        
       

        

    
    }
}