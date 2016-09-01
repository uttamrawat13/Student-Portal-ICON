using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Log;
using System.Data.SqlClient;

namespace DiamondD.Services.Common
{
    public class LogService : ILogService
    {
        public void LogUserAction(string userName, string action, string note)
        {
            try
            {
                var log = new SqlActivityLogger();
                log.LogUserAction(userName, action, note);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
    }
}
