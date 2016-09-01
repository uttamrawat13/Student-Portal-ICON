using DiamondD.Data.DataAccess.Report;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Services.Report
{
    public interface IReportsService
    {
        IList<WebReport> GetAllWebReports(bool IsActiveOnly);
        WebReport GetWebReport(string reportName);
    }
}
