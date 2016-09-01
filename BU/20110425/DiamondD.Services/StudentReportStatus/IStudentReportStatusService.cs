using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Services.StudentReportStatua
{
    public interface IStudentReportStatusService
    {
        bool GetStudentStatusReport();
        void UpdateStudentStatusReport(bool Status); 
    }
}
