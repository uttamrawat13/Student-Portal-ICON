using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Attendance;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface IAttendanceRepository : IBaseRepository
    {
        /// <summary>
        /// Get all student Attendance Review data.
        /// </summary>
        /// <returns>List of Attendance entries data for a student</returns>
        StudentAttendance GetAttendanceReview(int studentNo);
        StudentAttendance GetAttendanceReview(int studentNo, DateTime dateFrom, DateTime dateTo);
        /// <summary>
        /// Get all student attendance summary data.
        /// </summary>
        /// <returns>List of attendance summary entries data for a student</returns>
        StudentAttendanceSummary GetAttendanceSummary(int studentNo);
    }
}
