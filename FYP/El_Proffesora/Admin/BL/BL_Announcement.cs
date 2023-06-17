using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.Admin.BL
{
    public class BL_Announcement
    {

        public int ID { get; set; }
        public string Name { get; set; }
        public int instructorID { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public bool Status { get; set; }

        public bool SaveAnnouncement()
        {
            SqlParameter[] pm = new SqlParameter[6];
            pm[0] = new SqlParameter("ID", ID);
            pm[1] = new SqlParameter("Name", Name);
            pm[2] = new SqlParameter("instructorID", instructorID);
            pm[3] = new SqlParameter("StartDate", StartDate);
            pm[4] = new SqlParameter("EndDate", EndDate);
            pm[5] = new SqlParameter("Status", Status);
            if (DataAccess.ExecuteSpQuery("sp_Announcement", pm) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static DataTable GetAnnouncements(int? _Id)
        {
            return DataAccess.ExecuteSpTable("sp_GetAllAnnouncements", new SqlParameter("instructorID", _Id));
        }
        public static bool ChangeStatus(int _Id)
        {
            SqlParameter[] prm = new SqlParameter[1];
            prm[0] = new SqlParameter("ID", _Id);
            return DataAccess.ExecuteSpQuery("sp_ChangeAnnouncementStatus", prm) == true;
        }
        public static bool Delete(int _Id)
        {
            return DataAccess.ExecuteSpQuery("sp_DeleteAnnouncement", new SqlParameter("ID", _Id));
        }
    }
}