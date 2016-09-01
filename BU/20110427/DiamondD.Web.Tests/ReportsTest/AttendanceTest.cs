using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DiamondD.Data.DataAccess.Attendance;
using DiamondD.Services.Attendance;
namespace DiamondD.Web.Tests.ReportsTest
{
    /// <summary>
    /// Summary description for AttendanceTest
    /// </summary>
    [TestClass]
    public class AttendanceTest
    {
        public AttendanceTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        [TestMethod]
        public void SqlAttendanceRepository_Returns_Attendance_Review_Data_For_Student_No_2917()
        {
            IAttendanceRepository attendanceR = new SqlAttendanceRepository();
            var attendancReport = attendanceR.GetAttendanceReview(2917);

            Assert.IsNotNull(attendancReport);
        }

        [TestMethod]
        public void AttendanceReviewService_Returns_Attendance_Review_Data_For_Student_No_2917()
        {
            IAttendanceService attendanceR = new AttendanceReviewService();
            var attendancReport = attendanceR.GetAttendanceReview(2917);

            Assert.IsNotNull(attendancReport);
        }

        [TestMethod]
        public void AttendanceReviewService_Returns_Total_Schedule_Hours_For_Student_No_2917()
        {
            IAttendanceService attendanceService = new AttendanceReviewService();
            var studentAttendance = attendanceService.GetAttendanceReview(2917);

            Assert.IsNotNull(studentAttendance.TotalScheduledHours);
        }

        [TestMethod]
        public void AttendanceReviewService_Returns_Total_Completed_Hours_For_Student_No_2917()
        {
            IAttendanceService attendanceService = new AttendanceReviewService();
            var studentAttendance = attendanceService.GetAttendanceReview(2917);

            Assert.IsNotNull(studentAttendance.TotalCompletedHours);
        }

        [TestMethod]
        public void AttendanceReviewService_Returns_Attendance_Review_Data_View_Model_For_Student_No_2917()
        {
            IAttendanceService attendanceService = new AttendanceReviewService();
            var studentAttendance = attendanceService.GetAttendanceReview(2917);

            Assert.IsNotNull(studentAttendance);
        }
    }
}
