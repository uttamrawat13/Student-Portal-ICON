using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using System.Data.SqlClient;
using DiamondD.Services.Common;

namespace DiamondD.Services.StudentReportStatua
{
    public class StudentReportStatusService : IStudentReportStatusService
    {
        private readonly IWebReportStatusRepository _repository;

        public StudentReportStatusService()
        {
            _repository = new SqlReportStatusRepository();
        }
        public bool GetStudentStatusReport()
        {
            return _repository.GetStudentStatusReport();
        }
        public void UpdateStudentStatusReport(bool status)
        {
            try
             {
                _repository.UpdateStudentStatusReport(status);
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
