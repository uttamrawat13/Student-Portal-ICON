using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Common;

namespace DiamondD.Services.Common
{
    public class CommonService:ICommonService
    {
        private readonly ICommonRepository _repository;
        private readonly ILogService _logService;

        public CommonService()
        {
            _repository = new SqlCommonRepository();
            _logService = new LogService();
        }



        public IList<Course> GetCourses(bool fetchActiveOnly = true)
        {
            return _repository.GetCourses(fetchActiveOnly);
        }

        public IList<Session> GetSessions(bool fetchActiveOnly = true)
        {
            return _repository.GetSessions(fetchActiveOnly);
        }

        public IList<StudentStatus> GetStudentStatusList(bool fetchActiveOnly = true)
        {
            return _repository.GetStudentStatusList(fetchActiveOnly);
        }

        public IList<Program> GetPrograms(bool fetchActiveOnly = true)
        {
            return _repository.GetPrograms(fetchActiveOnly);        
        }
        public IList<Term> GetTerms()
        {
            return _repository.GetTerms();        
        }
        
        public IList<StudentGroup> GetStudentGroups(bool fetchActiveOnly = true)
        {
            return _repository.GetStudentGroups(fetchActiveOnly);        
        }
    }
}
