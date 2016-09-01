using DiamondD.Data.DataAccess.Report;
using DiamondD.Data.DataAccess.Repositories.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlReportsRepository:IReportsRepository
    {
        public IList<WebReport> GetAllReports(bool IsActiveOnly)
        {
            IList<WebReport> reportsList = new List<WebReport>();

            var sql = new StringBuilder();
            sql.Append("SELECT ReportId, ReportName, Active, DisplayName From WebReport");
            if (IsActiveOnly)
                sql.Append(" WHERE Active = 'Y' ");


            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {
                while (reader.Read())
                {
                    int qgColIndex = -1;
                    var newReport = new WebReport()
                    {
                        WebReportId= reader.GetInt32(++qgColIndex),
                        ReportName = reader.GetString(++qgColIndex),
                        Active = reader.GetString(++qgColIndex) == "Y" ? true : false,
                        DisplayName = reader.IsDBNull(++qgColIndex) ? "" : reader.GetString(qgColIndex)
                    };
                    reportsList.Add(newReport);
                }
            }
            return reportsList;
        }


        public WebReport GetWebReport(string reportName)
        {
            WebReport report = null;

            var sql = new StringBuilder();
            sql.AppendFormat("SELECT ReportId, ReportName, Active, DisplayName From WebReport Where ReportName='{0}'",reportName);

            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {
                while (reader.Read())
                {
                    int qgColIndex = -1;
                    report = new WebReport()
                    {
                        WebReportId = reader.GetInt32(++qgColIndex),
                        ReportName = reader.GetString(++qgColIndex),
                        Active = reader.GetString(++qgColIndex) == "Y" ? true : false,
                        DisplayName = reader.IsDBNull(++qgColIndex) ? "" : reader.GetString(qgColIndex)
                    };
                    
                }
            }
            return report;
        }
    }
}
