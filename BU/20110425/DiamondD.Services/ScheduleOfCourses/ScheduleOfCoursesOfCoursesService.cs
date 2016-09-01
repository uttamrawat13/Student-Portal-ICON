using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.ScheduleOfCourses;
using DiamondD.Services.Common;

namespace DiamondD.Services.SchedulesOfCourses
{
   public class ScheduleOfCoursesOfCoursesService : IScheduleOfCoursesService
    {
       private readonly IScheduleOfCoursesRepositry _repository;

       #region Constructors ...

        public ScheduleOfCoursesOfCoursesService()
        {
            _repository = new SqlScheduleOfCoursesOfCoursesRepository();
        }

        public ScheduleOfCoursesOfCoursesService(IScheduleOfCoursesRepositry repository)
        {
            this._repository = repository;
        }

        #endregion


       public StudentScheduleOfCourses GetStudentClassSchedule(int studentNo, string termDate)
       {
           try
           {
               StudentScheduleOfCourses scheduleOfCourses = _repository.GetStudentScheduleOfCourses(studentNo, termDate);
               return scheduleOfCourses;
           }
           catch (SqlException sqlEx)
           {
               throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
           }
           catch (Exception ex)
           {
               throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
           }
       }

       public IList<string> GetStudentScheduleOfTerm(int studentNo)
       {
            try
            {
                IList<string> termList = _repository.GetStudentScheduleOfTerm(studentNo);
                return termList;
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
       }
    }
}
