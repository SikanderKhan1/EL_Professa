using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace El_Proffesora.Admin.BL
{
    public class RandomClass
    {

        public static string GenerateString(int length)
        {
            string s = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM0123456789";
            string code = "";
            Random r = new Random();
            for (int i = 0; i < length; i++)
            {
                code += s[r.Next(0, s.Length - 1)].ToString();
            }
            return code;
        }

    }
}