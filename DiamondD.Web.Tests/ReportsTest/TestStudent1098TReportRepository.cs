using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Report;
using DiamondD.Data.DataAccess.Repositories.Base;

namespace DiamondD.Web.Tests.ReportsTest
{
    class TestStudent1098TReportRepository : IGetStudentReports
    {
        public Student1098TReport GetStudent1098TPdf(int studentNo)
        {
            var report = new Student1098TReport
                             {
                                 StudentNo = studentNo,
                                 PdfData = new byte[] {0x12, 0x0F, 0xF0}
                             };

            return report;
        }
    }
}
