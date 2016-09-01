using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.ScheduleOfCourses;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface IScheduleOfCoursesRepository : IBaseRepository
    {
        StudentScheduleOfCourses GetStudentScheduleOfCourses(int studentNo, string termDate);
        IList<string> GetStudentScheduleOfTerm(int studentNo);
    }
}
