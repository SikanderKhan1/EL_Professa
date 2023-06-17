using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.user.BL
{
    public class BL_Instructor
    {

        public static DataTable LoadTopInstructor()
        {
            return DataAccess.ExecuteSpTable("sp_LoadInstructors");
        }
        public static int GetLastRecord()
        {
            return Convert.ToInt32(DataAccess.ExecuteTable("sp_CountInst").Rows[0][0]);

        }
        public static DataTable LoadAll(int p)
        {
            return DataAccess.ExecuteSpTable("sp_TopIns ", new SqlParameter[1] { new SqlParameter("rec", p) });
        }
        public static DataTable GetStudentsByInstructorId(int Id)
        {
            return DataAccess.ExecuteSpTable("sp_GetStudentsByInstructorId", new SqlParameter("instructorID", Id));
        }

    }
    
}