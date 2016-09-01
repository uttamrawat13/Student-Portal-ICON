using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.ProgramCourseStatus;

namespace DiamondD.Services.ProgramCourseStatus
{
   public interface IProgramCourseProgressService
    {
       StudentProgramCourseProgress GetStudentProgramCoursePrograssDetail(int? studentNo);
    }
}
