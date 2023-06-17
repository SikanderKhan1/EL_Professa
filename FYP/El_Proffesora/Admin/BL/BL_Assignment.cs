using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.Admin.BL
{
    public class BL_Assignment
    {
        public int UploadID { get; set; }
        public int AssignmentID { get; set; }
        public string AssignmentName { get; set; }
        public int AssignmentTypeId { get; set; }
        public int InstructorID { get; set; }
        public int CategoryID { get; set; }
        public int CourseID { get; set; }
        public DateTime UploadDate { get; set; }
        public string FileName { get; set; }

        public bool Isnew { get; set; }




        public bool saveAssignment()
        {
            SqlParameter[] prm = new SqlParameter[8];
            prm[0] = new SqlParameter("AssignmentId", AssignmentID);
            prm[1] = new SqlParameter("AssignmentName", AssignmentName);
            prm[2] = new SqlParameter("AssignmentTypeId", AssignmentTypeId);
            prm[3] = new SqlParameter("InstructorID", InstructorID);
            prm[4] = new SqlParameter("CourseID", CourseID);
            prm[5] = new SqlParameter("UploadDate", UploadDate);
            prm[6] = new SqlParameter("FileName", FileName);
            prm[7] = new SqlParameter("Isnew", Isnew);
            if (AssignmentID>0)
            {
                prm = new SqlParameter[4];
                prm[0] = new SqlParameter("AssignmentId", AssignmentID);
                prm[1] = new SqlParameter("AssignmentName", AssignmentName);
                prm[2] = new SqlParameter("AssignmentTypeId", AssignmentTypeId);
                prm[3] = new SqlParameter("FileName", FileName);
                if (DataAccess.ExecuteSpQuery("sp_UpdateAssignments", prm) == true)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                if (DataAccess.ExecuteSpQuery("sp_Assignments", prm) == true)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public static DataTable Get(int? AssignmentId, int? InstructorId,int? CourseId)
        {
            SqlParameter[] prm = new SqlParameter[3];
            prm[0] = new SqlParameter("AssignmentId", AssignmentId);
            prm[1] = new SqlParameter("InstructorId", InstructorId);
            prm[2] = new SqlParameter("CourseId", CourseId);
            return DataAccess.ExecuteSpTable("sp_GetAssignments", prm);
        }
        public static DataSet GetAssignments(int InstructorId)
        {
            SqlParameter[] pr = new SqlParameter[1];
            pr[0] = new SqlParameter("InstructorId", InstructorId);
            DataSet ds = DataAccess.ExecuteSpDataSet("sp_LoadAssignments", pr);
            return ds;
        }

    }
}