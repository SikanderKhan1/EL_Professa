using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.Admin.BL
{
    public class BL_admin
    {

        public int AdminID { get; set; }
        public string AdminName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Mobile { get; set; }
        public string Picture { get; set; }
        public bool IsNew { get; set; }

        public BL_admin Authenticate()
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("Email", Email);
            p[1] = new SqlParameter("Password", Password);
            DataTable dt = DataAccess.ExecuteSpTable("sp_AdminAuth", p);
            if (dt.Rows.Count > 0)
            {
                BL_admin obj = new BL_admin();
                obj.AdminID = Convert.ToInt32(dt.Rows[0]["AdminID"]);
                obj.AdminName = Convert.ToString(dt.Rows[0]["AdminName"]);
                obj.Picture = dt.Rows[0]["Image"].ToString();
                return obj;
            }
            else
            {
                return null;
            }
        }
        public bool updateAdmin()
        {
            SqlParameter[] prm = new SqlParameter[7];
            prm[0] = new SqlParameter("AdminID", AdminID);
            prm[1] = new SqlParameter("AdminName", AdminName);
            prm[2] = new SqlParameter("Email", Email);
            prm[3] = new SqlParameter("Password", Password);
            prm[4] = new SqlParameter("Mobile", Mobile);
            prm[5] = new SqlParameter("Image", Picture);
            prm[6] = new SqlParameter("IsNew", IsNew);
            if (DataAccess.ExecuteSpQuery("sp_SaveAdmin", prm) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static DataTable AdminInfo(int _AdminId)
        {
            return DataAccess.ExecuteSpTable("sp_AdminInfo", new SqlParameter("AdminID", _AdminId));
        }
    }
}