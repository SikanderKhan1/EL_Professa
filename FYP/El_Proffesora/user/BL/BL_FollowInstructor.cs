using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.user.BL
{
    public class BL_FollowInstructor
    {
        public int FollowInstuctorId { get; set; }
        public int StudentId { get; set; }
        public int InstructorId { get; set; }

        public static DataTable LoadTopInstructor()
        {
            return DataAccess.ExecuteSpTable("sp_LoadInstructors");
        }
        public BL_FollowInstructor()
        {
            FollowInstuctorId = 0;
        }

        public bool Save()
        {
            SqlParameter[] pm = new SqlParameter[3];
            pm[0] = new SqlParameter("FollowInstuctorId", FollowInstuctorId);
            pm[1] = new SqlParameter("StudentId", StudentId);
            pm[2] = new SqlParameter("InstructorId", InstructorId);

            if (DataAccess.ExecuteSpQuery("sp_FollowInstuctor", pm) == true)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        public static DataTable Get(int UserId)
        {
            SqlParameter[] prm = new SqlParameter[1];
            prm[0] = new SqlParameter("UserId", UserId);
            return DataAccess.ExecuteSpTable("sp_GetFavInst", prm);

        }
        public static void Delete(int _FollowInstuctorId)
        {
            SqlParameter[] pm = new SqlParameter[1];
            pm[0] = new SqlParameter("FollowInstuctorId", _FollowInstuctorId);
            DataAccess.ExecuteSpQuery("sp_FollowInstuctor", pm);
        }
        public static DataTable GetStudentsByInstructorId(int Id)
        {
            return DataAccess.ExecuteSpTable("sp_GetStudentsByInstructorId", new SqlParameter("instructorID", Id));
        }
       
    }
}