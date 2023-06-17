using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.user.BL
{
    public class BL_FollowCourse
    {

        public int FollowCourseId { get; set; }
        public int StudentId { get; set; }
        public int CourseId { get; set; }

        public BL_FollowCourse()
        {
            FollowCourseId = 0;
        }

        public bool save()
        {
            SqlParameter[] pm = new SqlParameter[3];
            pm[0] = new SqlParameter("FollowCourseId", FollowCourseId);
            pm[1] = new SqlParameter("StudentId", StudentId);
            pm[2] = new SqlParameter("CourseId", CourseId);

            if (DataAccess.ExecuteSpQuery("sp_FollowCourse", pm) == true)
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
            return DataAccess.ExecuteSpTable("sp_GetFavCourse", prm);

        }
        public static void Delete(int _FollowCourseId)
        {
            SqlParameter[] pm = new SqlParameter[1];
            pm[0] = new SqlParameter("FollowCourseId", _FollowCourseId);
            DataAccess.ExecuteSpQuery("sp_FollowCourse", pm);
        }

    }
}