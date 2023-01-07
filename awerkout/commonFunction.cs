using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace awerkout
{
    public class commonFunction
    {
        public static void debugMessage(string debugmsg)
        {
            System.Diagnostics.Debug.WriteLine(debugmsg);
        }

        static Random rdm = new Random();

        public static string getRandomHexNumber(int digits) {
            byte[] buffer = new byte[digits / 2];
            rdm.NextBytes(buffer);
            string res = String.Concat(buffer.Select(x => x.ToString("X2")).ToArray());
            if (digits % 2 == 0)
            {
                return res;
            }
            return res + rdm.Next(16).ToString("X");
        }
    }


}