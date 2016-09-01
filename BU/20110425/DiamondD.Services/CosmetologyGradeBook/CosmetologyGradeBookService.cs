using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.CosmetologyGradeBook;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Common;

namespace DiamondD.Services.CosmetologyGradeBook
{
    public class CosmetologyGradeBookService : ICosmetologyGradeBookService
    {
         private readonly ICosmetologyGradeBookRepository _repository;

        #region Constructors ...

        public CosmetologyGradeBookService()
        {
            _repository = new SqlCosmetologyGradeBookRepository();
        }

        public CosmetologyGradeBookService(ICosmetologyGradeBookRepository repository)
        {
            this._repository = repository;
        }

        #endregion

        public StudentCosmetologyGradeBookTest GetStudentCosmetologyGradeBookTestReport(int studentNo)
        {
            try
            {
                var cosmetologyGradeBookTestReport = _repository.GetStudentCosmetologyGradeBookTestReport(studentNo);

                return cosmetologyGradeBookTestReport;
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
        public StudentCosmetologyGradeBookSummary GetStudentCosmetologyGradeBookSummaryReport(int studentNo)
        {
            try
            {
                var cosmetologyGradeBookSummaryReport = _repository.GetStudentCosmetologyGradeBookSummaryReport(studentNo);

                return cosmetologyGradeBookSummaryReport;
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
        public StudentCosmetologyGradeBookLab GetStudentCosmetologyGradeBookLabReport(int studentNo)
        {
            try
            {
                var cosmetologyGradeBookLabReport = _repository.GetStudentCosmetologyGradeBookLabReport(studentNo);

                return cosmetologyGradeBookLabReport;
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
