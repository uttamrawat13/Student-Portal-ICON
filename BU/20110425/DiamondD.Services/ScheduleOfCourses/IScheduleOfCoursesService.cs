using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.ScheduleOfCourses;

namespace DiamondD.Services.SchedulesOfCourses
{
   public interface IScheduleOfCoursesService
    {
       StudentScheduleOfCourses GetStudentClassSchedule(int studentNo, string termDate);
       IList<string> GetStudentScheduleOfTerm(int studentNo);
    }
}
