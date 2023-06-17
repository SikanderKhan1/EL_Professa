using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.Admin.BL
{
    public class BL_Courses
    {
        public int CourseID { get; set; }
        public string CourseName { get; set; }
        public int CategoryID { get; set; }
        public string Picture { get; set; }
        public bool IsNew { get; set; }
        public int InstructorID { get; set; }


        public bool saveCourses()
        {
            SqlParameter[] prm = new SqlParameter[6];

            prm[0] = new SqlParameter("CourseName", CourseName);
            prm[1] = new SqlParameter("CategoryID", CategoryID);
            prm[2] = new SqlParameter("Picture", Picture);
            prm[3] = new SqlParameter("IsNew", IsNew);
            prm[4] = new SqlParameter("CourseId", CourseID);
            prm[5] = new SqlParameter("InstructorID", InstructorID);

            if (DataAccess.ExecuteSpQuery("sp_SaveCourses", prm) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static bool Delete(int _CourseId)
        {
            SqlParameter[] prm = new SqlParameter[1];
            prm[0] = new SqlParameter("CourseId", _CourseId);
            if (DataAccess.ExecuteSpQuery("sp_DeleteCourse", prm) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static DataTable GetById(int _CourseId)
        {
            SqlParameter[] prm = new SqlParameter[1];
            prm[0] = new SqlParameter("CategoryID", _CourseId);
            return DataAccess.ExecuteSpTable("sp_GetCoursesByCategoryId", prm);

        }
        public static DataTable GetByCourseId(int _CourseId)
        {
            SqlParameter[] prm = new SqlParameter[1];
            prm[0] = new SqlParameter("CourseId", _CourseId);
            return DataAccess.ExecuteSpTable("sp_GetCourseByCourseId", prm);

        }
       
        public static DataTable GetCourseCategory()
        {
            return DataAccess.ExecuteSpTable("sp_CourseCategory");
        }
        public static DataTable GetTopCourses()
        {
            return DataAccess.ExecuteSpTable("sp_TopCourses");
        }
        public static DataTable GetCoursesByCourseCategory(int Id)
        {
            return DataAccess.ExecuteSpTable("sp_GetCoursesByCategoryId", "CategoryID", Id);
        }
        public static DataTable CourseByCatId(int Id)
        {
            return DataAccess.ExecuteSpTable("sp_LoadCourseByCategoryId", "CategoryID", Id);
        }
        public static DataTable GetAll(int InstructorId)
        {
            SqlParameter[] prm = new SqlParameter[1];
            prm[0] = new SqlParameter("InstructorId", InstructorId);
            return DataAccess.ExecuteSpTable("sp_ShowCourses",prm);
        }
    }
}