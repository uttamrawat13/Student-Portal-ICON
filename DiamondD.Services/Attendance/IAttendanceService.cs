using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Attendance;

namespace DiamondD.Services.Attendance
{
    public interface IAttendanceService
    {
        /// <summary>
        /// Get a Student's complete attendance (for all classes).
        /// </summary>
        /// <param name="studentNo">The student number.</param>
        /// <returns>Returns a student's attendance for all classes he/she has taken.</returns>
        StudentAttendance GetAttendanceReview(int studentNo);

        StudentAttendance GetAttendanceReview(int studentNo, DateTime dateFrom, DateTime dateTo);

        /// <summary>
        /// Get a Student's attendance summary (for all classes).
        /// </summary>
        /// <param name="studentNo">The student number.</param>
        /// <returns>Returns a student's attendance summary for all classes he/she has taken.</returns>
        StudentAttendanceSummary GetAttendanceSummary(int studentNo);
    }
}
