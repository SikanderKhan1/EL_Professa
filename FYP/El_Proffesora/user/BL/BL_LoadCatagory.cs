using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace El_Proffesora.user.BL
{
    public class BL_LoadCatagory
    {
        public int CatagoryID { get; set; }
        public string CatagoryName { get; set; }
        public string CatagoryImage { get; set; }

        public static DataTable  LoadCatagory()
        {
            return DataAccess.ExecuteSpTable("sp_TopCata");
        }
        public static DataTable Loadcatagories()
        {
            return DataAccess.ExecuteSpTable("sp_GetAllCata");
        }
        public static DataTable LoadInstructors()
        {
            return DataAccess.ExecuteSpTable("sp_GetAllInstructors");
        }
        public static DataTable LoadCataType()
        {
            return DataAccess.ExecuteSpTable("sp_GetCataType");
        }
        

    }
    
}