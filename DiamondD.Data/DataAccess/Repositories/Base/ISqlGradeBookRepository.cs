using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.GradeBook;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
   public interface ISqlGradeBookRepository : IBaseRepository
    {
        StudentGradeBook GetStudentGradeBookDetail(int? studentNo, string term);
        IList<string> GetStudentGradeBokkOfTerm(int studentNo);
        bool IsGradeBookWeighted();
    }
}
