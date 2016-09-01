using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Report
{
    public class WebReport
    {
        public int WebReportId { get; set; }
        public string ReportName { get; set; }
        public string DisplayName { get; set; }
        public bool Active { get; set; }
    }
}
