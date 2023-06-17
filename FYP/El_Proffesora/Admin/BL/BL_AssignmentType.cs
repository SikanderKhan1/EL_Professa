using El_Proffesora.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace El_Proffesora.Admin.BL
{
    public class BL_AssignmentType
    {

        public int AssignmentTypeId { get; set; }
        public string AssignmentTypeName { get; set; }

        public static DataTable GetAll()
        {
            return DataAccess.ExecuteSpTable("sp_LoadAssigmentType");
        }
    }
}