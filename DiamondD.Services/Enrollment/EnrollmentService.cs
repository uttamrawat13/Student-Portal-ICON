using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Enrollment;
using System.Data.SqlClient;
using DiamondD.Services.Common;
using DiamondD.Data.DataAccess.Repositories;

namespace DiamondD.Services.Enrollment
{
    public class EnrollmentService : IEnrollmentService
    {
        private IEnrollmentRepository _enrollmentRepository;

        public EnrollmentService()
        {
            _enrollmentRepository = new SqlEnrollmentRepository();
        }

        public EnrollmentService(IEnrollmentRepository enrollmentRepository)
        {
            this._enrollmentRepository = enrollmentRepository;
        }

        public int EnrollStudent(CourseEnrollment courseOffering)
        {
            try
            {
                return _enrollmentRepository.EnrollStudent(courseOffering);
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


        public IList<CourseOffering> FetchCourseOfferings(int studentId, int termId, out int totalRows, int pageNumber, int pageSize)
        {
            try
            {
                return _enrollmentRepository.FetchCourseOfferings(studentId, termId, out totalRows, pageNumber, pageSize);
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


        public Dictionary<int, DateTime> FetchTermsForOnlineEnrollment()
        {
            try
            {
                return _enrollmentRepository.FetchTermsForOnlineEnrollment();
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


        public bool UnEnrollStudent(int studentId, int courseOfferingNo)
        {
            try
            {
                return _enrollmentRepository.UnEnrollStudent(studentId, courseOfferingNo);
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
