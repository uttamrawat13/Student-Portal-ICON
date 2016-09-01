using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.ClassSchedules;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface IClassScheduleRepositry : IBaseRepository
    {
        StudentClassSchedule GetStudentClassSchedule(int studentNo);
    }
}
