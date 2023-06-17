using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.Admin.BL
{
    public class BL_Instructors
    {
        public int InstructorID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int CourseID { get; set; }
        public string Mobile { get; set; }
        public string Address { get; set; }
        public string Education { get; set; }
        public int CategoryID { get; set; }
        public DateTime DateOfBirth { get; set; }
        public bool Status { get; set; }
        public bool Gender { get; set; }
        public DateTime? DateOfJoin { get; set; }
        public string CNIC { get; set; }
        public string Picture { get; set; }
        public bool IsNew { get; set; }

        public bool SaveInstructors()
        {
            SqlParameter[] prm = new SqlParameter[15];
            prm[0] = new SqlParameter("FirstName", FirstName);
            prm[1] = new SqlParameter("LastName", LastName);
            prm[2] = new SqlParameter("Email", Email);
            prm[3] = new SqlParameter("Password", Password);
            prm[4] = new SqlParameter("Mobile", Mobile);
            prm[5] = new SqlParameter("Address", Address);
            prm[6] = new SqlParameter("Education", Education);
            prm[7] = new SqlParameter("DateOfBirth", DateOfBirth);
            prm[8] = new SqlParameter("Status", Status);
            prm[9] = new SqlParameter("Gender", Gender);
            prm[10] = new SqlParameter("CNIC", CNIC);
            prm[11] = new SqlParameter("IsNew", IsNew);
            prm[12] = new SqlParameter("Picture", Picture);
            prm[13] = new SqlParameter("DateOfJoin", DateOfJoin);
            prm[14] = new SqlParameter("InstructorID", InstructorID);
            if (DataAccess.ExecuteSpQuery("sp_SaveInstructors", prm) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static DataTable CheckInstructor(string _Email, string _Mobile, string _CNIC)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("Email", _Email);
            p[1] = new SqlParameter("Mobile", _Mobile);
            p[2] = new SqlParameter("CNIC", _CNIC);
            return DataAccess.ExecuteSpTable("CheckInst", p);
        }
        public BL_Instructors Authenticate()
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("Email", Email);
            p[1] = new SqlParameter("Password", Password);
            DataTable dt = DataAccess.ExecuteSpTable("sp_AuthInst", p);
            if (dt.Rows.Count > 0)
            {
                BL_Instructors obj = new BL_Instructors();
                obj.InstructorID = Convert.ToInt32(dt.Rows[0]["InstructorID"]);
                obj.FirstName = Convert.ToString(dt.Rows[0]["FirstName"]);
                obj.LastName = Convert.ToString(dt.Rows[0]["LastName"]);
                obj.Picture = Convert.ToString(dt.Rows[0]["Picture"]);
                return obj;
            }
            else
            {
                return null;
            }

        }
        public static bool Delete(int Id)
        {
            return DataAccess.ExecuteSpQuery("sp_deleteInstructor", new SqlParameter("InstructorID", Id));
        }

        public static bool ChangeStatus(int Id)
        {
            SqlParameter[] prm = new SqlParameter[1];
            prm[0] = new SqlParameter("InstructorID", Id);
            return DataAccess.ExecuteSpQuery("sp_ChangeInstructorStatus", prm);
        }

        public static DataTable InstructorInfo(int Id)
        {
            return DataAccess.ExecuteSpTable("sp_InstructorProfile", new SqlParameter("instructorID", Id));
        }
        public static DataTable GetAll()
        {
            return DataAccess.ExecuteSpTable("sp_GetInstructors");
        }
        public static DataTable GetTopInstructors()
        {
            return DataAccess.ExecuteSpTable("sp_TopInstructors"); ;
        }
    }
}