using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.ProgramCourseStatus;
using System.Data.SqlClient;
using DiamondD.Services.Common;

namespace DiamondD.Services.ProgramCourseStatus
{
   public class ProgramCourseProgressService : IProgramCourseProgressService
    {
       private readonly IProgramCourseProgressRepository _repository;

       #region Constructors ...
        
        public ProgramCourseProgressService()
        {
            _repository = new SqlProgramCourseProgressRepository();
        }
        public ProgramCourseProgressService(IProgramCourseProgressRepository repository)
        {
            _repository = repository;
        }

        #endregion

        public StudentProgramCourseProgress GetStudentProgramCoursePrograssDetail(int? studentNo)
        {
            try
            {
                StudentProgramCourseProgress paymentSchedule = _repository.GetStudentProgramCoursePrograssDetail(studentNo);
                return paymentSchedule;
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
