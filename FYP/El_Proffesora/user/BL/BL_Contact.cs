using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.user.BL
{
    public class BL_Contact
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Msg { get; set; }


        public void Save()
        {
            SqlParameter[] prm = new SqlParameter[4];
            prm[0] = new SqlParameter("Name",Name);
            prm[1] = new SqlParameter("Email",Email);
            prm[2] = new SqlParameter("Mobile",Mobile);
            prm[3] = new SqlParameter("Message",Msg);
            DataAccess.ExecuteSpQuery("sp_Contact",prm);
        }
    }
}