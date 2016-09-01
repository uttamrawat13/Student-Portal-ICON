using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Report;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface IReportsRepository:IBaseRepository
    {
        IList<WebReport> GetAllReports(bool IsActiveOnly);
        WebReport GetWebReport(string reportName);
    }
}
