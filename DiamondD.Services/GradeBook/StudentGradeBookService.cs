using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.GradeBook;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Common;

namespace DiamondD.Services.GradeBook
{
    public class StudentGradeBookService : IStudentGradeBookService
    {
        private readonly ISqlGradeBookRepository _repository;

        #region Constructors ...

        public StudentGradeBookService()
        {
            _repository = new SqlGradeBookRepository();
        }
        public StudentGradeBookService(ISqlGradeBookRepository repository)
        {
            _repository = repository;
        }

        #endregion
        public StudentGradeBook GetStudentGradeBookDetail(int? studentNo, string term)
        {
            try
            {
                StudentGradeBook studentGradeBook = _repository.GetStudentGradeBookDetail(studentNo, term);
                return studentGradeBook;
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

        public IList<string> GetStudentGradeBokkOfTerm(int studentNo)
        {
            try
            {
                IList<string> termList = _repository.GetStudentGradeBokkOfTerm(studentNo);
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


        public bool IsGradeBookWeighted()
        {
            try
            {
                bool result = _repository.IsGradeBookWeighted();
                return result;
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
