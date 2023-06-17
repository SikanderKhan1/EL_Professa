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
    public partial class InstructorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["instructorID"] != null)
            {
                if (!IsPostBack)
                {
                    instructorinfo();
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }

        }

        public void instructorinfo()
        {
            DataTable dt = BL_Instructors.InstructorInfo(Convert.ToInt32(Session["instructorID"]));
            if (dt.Rows.Count > 0)
            {
                lblname.Text = dt.Rows[0]["fullname"].ToString();
                lbleducation.Text = dt.Rows[0]["Education"].ToString();
                lblemail.Text = dt.Rows[0]["Email"].ToString();
                lbladdress.Text = dt.Rows[0]["Address"].ToString();
                lblphone.Text = dt.Rows[0]["Mobile"].ToString();

                profileimage.ImageUrl = "~/Admin/UploadFiles/images/" + dt.Rows[0]["Picture"].ToString();
                Session["InstrName"] = dt.Rows[0]["firstname"].ToString() + " " + dt.Rows[0]["lastname"].ToString();
               
                Session["image"] = dt.Rows[0]["Picture"].ToString();
                txtfirstname.Text = dt.Rows[0]["firstname"].ToString();
                txtlastname.Text = dt.Rows[0]["lastname"].ToString();
                txtmobile.Text = dt.Rows[0]["Mobile"].ToString();
                txtemail.Text = dt.Rows[0]["Email"].ToString();
                txteducation.Text = dt.Rows[0]["Education"].ToString();
                txtaddress.Text = dt.Rows[0]["Address"].ToString();
                txtcnic.Text = dt.Rows[0]["CNIC"].ToString();
                txtdob.Text = Convert.ToDateTime(dt.Rows[0]["DateOfBirth"]).ToString("dd/MM/yyyy");
                txtpassword.Text = dt.Rows[0]["Password"].ToString();
                ddlgender.SelectedValue = dt.Rows[0]["Gender"].ToString();
                hdnpicture.Value = dt.Rows[0]["Picture"].ToString();
               
            }
        }

        protected void fileupload_Load(object sender, EventArgs e)
        {

        }

        public string UploadImage()
        {
            string filename = fileupload.FileName;
            string path = Server.MapPath("\\Admin\\UploadFiles\\images\\" + filename);
            fileupload.SaveAs(path);
            return filename;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            BL_Instructors obj = new BL_Instructors();
            obj.FirstName = txtfirstname.Text;
            obj.LastName = txtlastname.Text;
            obj.Email = txtemail.Text;
            obj.Password = txtpassword.Text;
            obj.Address = txtaddress.Text;
            obj.Mobile = txtmobile.Text;
            obj.CNIC = txtcnic.Text;
            if (fileupload.HasFile)
            {
                obj.Picture = UploadImage();

            }
            obj.Gender = Convert.ToBoolean(ddlgender.SelectedValue);
            obj.DateOfBirth = Convert.ToDateTime(txtdob.Text);
            obj.DateOfJoin = null;
            obj.Education = txteducation.Text;
            obj.IsNew = false;
            obj.InstructorID = Convert.ToInt32(Session["instructorID"]);
            obj.SaveInstructors();
            instructorinfo();
        }
        
    }
}