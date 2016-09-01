using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.CosmetologyGradeBook;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface ICosmetologyGradeBookRepository : IBaseRepository
    {
        StudentCosmetologyGradeBookTest GetStudentCosmetologyGradeBookTestReport(int studentNo);
        StudentCosmetologyGradeBookSummary GetStudentCosmetologyGradeBookSummaryReport(int studentNo);
        StudentCosmetologyGradeBookLab GetStudentCosmetologyGradeBookLabReport(int studentNo);
    }

}
