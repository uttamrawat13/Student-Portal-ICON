using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Report;
using DiamondD.Data.DataAccess.Repositories.Base;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlGetStudentReports : IGetStudentReports
    {
        public Student1098TReport GetStudent1098TPdf(int studentNo)
        {
            
            var query = new StringBuilder();
            query.AppendFormat("SELECT * FROM Student1098TPDF WHERE StudentNo = {0}", studentNo);

            var report = new Student1098TReport();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    report.StudentNo = Convert.ToInt32(reader[++colIndex]);
                    report.PdfData = reader[++colIndex] as byte[];
                }
            }

            return report;
        }
    }
}
