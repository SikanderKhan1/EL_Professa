using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.user.BL
{
    public class BL_Courses
    {
        public static DataTable LoadCourses()
        {
            return DataAccess.ExecuteSpTable("sp_LoadTopCourses");
        }
        public static DataTable GetAll(int? CategoryId, int? InstructorId)
        {
            SqlParameter[] prm = new SqlParameter[2];
            prm[0] = new SqlParameter("CategoryID", CategoryId);
            prm[1] = new SqlParameter("InstructorId", InstructorId);
            return DataAccess.ExecuteSpTable("sp_GetAllCourses", prm);

        }

    }
}