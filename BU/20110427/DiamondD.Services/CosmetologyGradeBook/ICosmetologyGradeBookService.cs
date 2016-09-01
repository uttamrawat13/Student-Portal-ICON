using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.CosmetologyGradeBook;

namespace DiamondD.Services.CosmetologyGradeBook
{
    public interface ICosmetologyGradeBookService
    {
        StudentCosmetologyGradeBookTest GetStudentCosmetologyGradeBookTestReport(int studentNo);
        StudentCosmetologyGradeBookSummary GetStudentCosmetologyGradeBookSummaryReport(int studentNo);
        StudentCosmetologyGradeBookLab GetStudentCosmetologyGradeBookLabReport(int studentNo);

    }
}
