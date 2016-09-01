using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlReportStatusRepository : IWebReportStatusRepository
    {
        public bool GetStudentStatusReport()
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT TOP 1 SSReport ")
                .AppendFormat(" FROM WebStudentStatusReport ");

            object ssReport = false;

            ssReport = this.ExecuteScalar(CommandType.Text, query.ToString());

            if (ssReport != null && ssReport is bool)
                return (bool)ssReport;
            else
                return false;
        }

        public void UpdateStudentStatusReport(bool status)
        {
            var query = new StringBuilder();
            query.AppendFormat(
                "UPDATE WebStudentStatusReport SET SSReport = {0}", status);
                     
            this.ExecuteNonQuery(CommandType.Text, query.ToString());
        }
    }
}
