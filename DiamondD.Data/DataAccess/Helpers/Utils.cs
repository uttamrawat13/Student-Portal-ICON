using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Helpers
{
    class Utils
    {
        public static string FormatDateTime(DateTime dateTime)
        {
            return dateTime.ToString("MM/dd/yyyy hh:mm:ss");
        }
    }
}
