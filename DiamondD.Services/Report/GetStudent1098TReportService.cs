using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Report;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Common;

namespace DiamondD.Services.Report
{
    public class GetStudent1098TReportService : IGetStudent1098TReportService
    {
        private readonly IGetStudentReports _repository;

        #region Constructors ...
        
        public GetStudent1098TReportService()
        {
            _repository = new SqlGetStudentReports();
        }
        public GetStudent1098TReportService(IGetStudentReports repository)
        {
            _repository = repository;
        }

        #endregion

        public Student1098TReport GetStudent1098TPDF(int studentNo)
        {
            Student1098TReport student1098TPDF = null;
            try
            {
                student1098TPDF = _repository.GetStudent1098TPdf(studentNo);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }

            return student1098TPDF;
        }
    }
}
