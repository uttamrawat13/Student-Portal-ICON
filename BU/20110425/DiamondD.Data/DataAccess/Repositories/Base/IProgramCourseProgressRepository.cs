using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.ProgramCourseStatus;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface IProgramCourseProgressRepository : IBaseRepository
    {
        StudentProgramCourseProgress GetStudentProgramCoursePrograssDetail(int? studentNo);
    }
}
