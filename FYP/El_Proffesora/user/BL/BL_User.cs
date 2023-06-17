using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.user.BL
{
    public class BL_User
    {
        public int User_ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Mobile { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public bool Gender { get; set; }
        public string Password { get; set; }

        public bool Status { get; set; }
        public bool IsNew { get; set; }
        public string Picture { get; set; }

        public bool save()
        {
            SqlParameter[] pm = new SqlParameter[11];
            pm[0] = new SqlParameter("User_ID", User_ID);
            pm[1] = new SqlParameter("FirstName", FirstName);
            pm[2] = new SqlParameter("LastName", LastName);
            pm[3] = new SqlParameter("Mobile", Mobile);
            pm[4] = new SqlParameter("Address", Address);
            pm[5] = new SqlParameter("Email", Email);
            pm[6] = new SqlParameter("Gender", Gender);
            pm[7] = new SqlParameter("Password", Password);
            pm[8] = new SqlParameter("Status", Status);
            pm[9] = new SqlParameter("IsNew", IsNew);
            pm[10] = new SqlParameter("Picture", Picture);
            if (DataAccess.ExecuteSpQuery("sp_user", pm) == true)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public DataTable login()
        {
            SqlParameter[] pm = new SqlParameter[2];
            pm[0] = new SqlParameter("Email", Email);
            pm[1] = new SqlParameter("Password", Password);
            DataTable dt = new DataTable();
            dt = DataAccess.ExecuteSpTable("sp_login", pm);
            if (dt.Rows.Count > 0)
            {
                return dt;
            }
            else
            {
                return dt;
            }

        }
        public static DataTable GetAll()
        {

            return DataAccess.ExecuteSpTable("sp_GetAllUsers");

        }
        public static DataTable GetInfo(int Id)
        {

            return DataAccess.ExecuteSpTable("sp_userprofile", new SqlParameter("ID", Id));

        }
        public static DataTable AuthUser(string Email, string Mobile)
        {
            SqlParameter[] pm = new SqlParameter[2];
            pm[0] = new SqlParameter("Email", Email);
            pm[1] = new SqlParameter("Mobile", Mobile);
            return DataAccess.ExecuteSpTable("AuthUser");

        }

    }
}