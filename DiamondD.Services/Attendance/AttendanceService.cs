using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Attendance;
using System.Data.SqlClient;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Common;

namespace DiamondD.Services.Attendance
{
    public class AttendanceService : IAttendanceService
    {
        private readonly IAttendanceRepository _repository;

        #region Constructors ...

        public AttendanceService()
        {
            _repository = new SqlAttendanceRepository();
        }

        public AttendanceService(IAttendanceRepository repository)
        {
            this._repository = repository;
        }

        #endregion

        public StudentAttendance GetAttendanceReview(int studentNo)
        {
            try
            {
                var attendanceReview = _repository.GetAttendanceReview(studentNo);

                return attendanceReview;
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
        public StudentAttendance GetAttendanceReview(int studentNo, DateTime dateFrom, DateTime dateTo)
        {
            try
            {
                var attendanceReview = _repository.GetAttendanceReview(studentNo, dateFrom, dateTo);

                return attendanceReview;
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
        public StudentAttendanceSummary GetAttendanceSummary(int studentNo)
        {
            try
            {
                var attendanceSummary = _repository.GetAttendanceSummary(studentNo);

                return attendanceSummary;
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
