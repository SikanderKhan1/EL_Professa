using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.Admin.BL
{
    public class BL_CourseCategory
    {

        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public bool IsNew { get; set; }
        public string image { get; set; }

        public bool saveCategory()
        {
            SqlParameter[] prm = new SqlParameter[4];
            prm[0] = new SqlParameter("CategoryName", CategoryName);
            prm[1] = new SqlParameter("IsNew", IsNew);
            prm[2] = new SqlParameter("CategoryID", CategoryID);
            prm[3] = new SqlParameter("image",image);
            if (DataAccess.ExecuteSpQuery("sp_SaveCategory", prm) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static bool Delete(int Id)
        {
            SqlParameter[] prm = new SqlParameter[1];
            prm[0] = new SqlParameter("CategoryID", Id);
            return DataAccess.ExecuteSpQuery("sp_DeleteCategory", prm);
        }

        public static DataTable LoadAll()
        {
            return DataAccess.ExecuteSpTable("sp_showCategory");
        }
        public static DataTable LoadAllByCategoryID(int Id)
        {
            SqlParameter[] prm = new SqlParameter[1];
            prm[0] = new SqlParameter("CategoryID", Id);
            return DataAccess.ExecuteSpTable("sp_ChangeCategoryStatus", prm);
        }
    }
}