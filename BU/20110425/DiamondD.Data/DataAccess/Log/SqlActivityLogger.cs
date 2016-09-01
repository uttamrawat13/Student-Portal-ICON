using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using DiamondD.Data.DataAccess.Repositories;

namespace DiamondD.Data.DataAccess.Log
{
    public class SqlActivityLogger
    {
        public void LogUserAction(string userName, string action, string note)
        {
            var db = SqlRepositoryUtils.CreateDatabase();

            var studentQuery = new StringBuilder();
            studentQuery.AppendFormat("(SELECT WebUserId ")
                .AppendFormat(" FROM WebUser WHERE WebUserName='{0}')", userName);

            var studentNo = db.ExecuteScalar(CommandType.Text, studentQuery.ToString());

            var query = new StringBuilder();
            query.AppendFormat(
                "INSERT INTO WebLog(LogDateTime, WebUserId, LogAction, LogNote)")
                .AppendFormat("VALUES('{0}',{1},'{2}','{3}')", DateTime.Now, studentNo, action, note);

            db.ExecuteNonQuery(CommandType.Text, query.ToString());
        }
    }
}
