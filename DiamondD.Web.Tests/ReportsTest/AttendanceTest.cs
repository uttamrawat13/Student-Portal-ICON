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
    { public AttendanceTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        [TestMethod]
        public void SqlAttendanceRepository_Returns_Attendance_Review_Data_For_a_Valid_DbStudent()
        {
            IAttendanceRepository attendanceReview = new SqlAttendanceRepository();
            var attendancReport = attendanceReview.GetAttendanceReview(TestConstants.DbStudentUserId);

            Assert.IsNotNull(attendancReport);
        }

        [TestMethod]
        public void AttendanceService_Returns_Attendance_Review_Data_For_a_Valid_DbStudent()
        {
            IAttendanceService attendanceReview = new AttendanceService();
            var attendancReport = attendanceReview.GetAttendanceReview(TestConstants.DbStudentUserId);

            Assert.IsNotNull(attendancReport);
        }


        [TestMethod]
        public void TestAttendanceRepository_Returns_Attendance_Review_Data_For_a_Test_Student()
        {
            IAttendanceRepository attendanceReview = new TestAttendanceRepository();
            var attendancReport = attendanceReview.GetAttendanceReview(1);

            Assert.IsNotNull(attendancReport);
        }

        [TestMethod]
        public void AttendanceService_SqlAttendanceRepository_Returns_Attendance_Review_Data_For_a_Valid_DbStudent()
        {
            IAttendanceService attendanceService = new AttendanceService();
            var attendancReport = attendanceService.GetAttendanceReview(TestConstants.DbStudentUserId);

            Assert.IsNotNull(attendancReport);
        }

        [TestMethod]
        public void AttendanceService_TestAttendanceRepository_Returns_Attendance_Review_Data_For_a_Test_Student()
        {
            IAttendanceService attendanceService = new AttendanceService(new TestAttendanceRepository());
            var attendancReport = attendanceService.GetAttendanceReview(1);

            Assert.IsNotNull(attendancReport);
        }

        [TestMethod]
        public void SqlAttendanceRepository_Returns_Total_Schedule_Hours_For_a_Valid_DbStudent()
        {
            IAttendanceRepository attendanceRepository = new SqlAttendanceRepository();
            var studentAttendance = attendanceRepository.GetAttendanceReview(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentAttendance.TotalScheduledHours);
        }


        [TestMethod]
        public void TestAttendanceRepository_Returns_Total_Schedule_Hours_For_a_Valid_DbStudent()
        {
            IAttendanceRepository attendanceRepository = new SqlAttendanceRepository();
            var studentAttendance = attendanceRepository.GetAttendanceReview(1);

            Assert.IsNotNull(studentAttendance.TotalScheduledHours);
        }

        [TestMethod]
        public void AttendanceService_TestAttendanceRepository_Returns_Total_Schedule_Hours_For_a_Test_Student()
        {
            IAttendanceService attendanceService = new AttendanceService(new TestAttendanceRepository());
            var studentAttendance = attendanceService.GetAttendanceReview(1);

            Assert.IsNotNull(studentAttendance.TotalScheduledHours);
        }

        [TestMethod]
        public void AttendanceService_SqlAttendanceRepository_Returns_Total_Schedule_Hours_For_a_Valid_DbStudent()
        {
            IAttendanceService attendanceService = new AttendanceService();
            var studentAttendance = attendanceService.GetAttendanceReview(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentAttendance.TotalScheduledHours);
        }

        [TestMethod]
        public void SqlAttendanceRepository_Returns_Total_Completed_Hours_For_a_Valid_DbStudent()
        {
            IAttendanceRepository attendanceRepository = new SqlAttendanceRepository();
            var studentAttendance = attendanceRepository.GetAttendanceReview(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentAttendance.TotalCompletedHours);
        }

        [TestMethod]
        public void TestAttendanceRepository_Returns_Total_Completed_Hours_For_a_Test_Student()
        {
            IAttendanceRepository attendanceRepository = new TestAttendanceRepository();
            var studentAttendance = attendanceRepository.GetAttendanceReview(1);

            Assert.IsNotNull(studentAttendance.TotalCompletedHours);
        }

        [TestMethod]
        public void AttendanceService_TestAttendanceRepository_Returns_Total_Completed_Hours_For_a_Test_Student()
        {
            IAttendanceService attendanceService = new AttendanceService(new TestAttendanceRepository());
            var studentAttendance = attendanceService.GetAttendanceReview(1);

            Assert.IsNotNull(studentAttendance.TotalCompletedHours);
        }

        [TestMethod]
        public void TestAttendanceService_TestAttendanceService_Returns_Total_Completed_Hours_For_a_Test_Student()
        {
            IAttendanceService attendanceService = new AttendanceService(new TestAttendanceRepository());
            var studentAttendance = attendanceService.GetAttendanceReview(1);

            Assert.IsNotNull(studentAttendance.TotalCompletedHours);
        }


        [TestMethod]
        public void AttendanceService_SqlAttendanceRepository_Returns_Total_Completed_Hours_For_a_Valid_DbStudent()
        {
            IAttendanceService attendanceService = new AttendanceService();
            var studentAttendance = attendanceService.GetAttendanceReview(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentAttendance.TotalCompletedHours);
        }


        [TestMethod]
        public void SqlAttendanceRepository_Returns_StudentAttendance_Data_For_a_Valid_DbStudent()
        {
            IAttendanceRepository attendanceRepository = new SqlAttendanceRepository();
            var studentAttendance = attendanceRepository.GetAttendanceReview(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentAttendance);
        }

        [TestMethod]
        public void TestAttendanceRepository_Returns_StudentAttendance_Data_For_a_Test_Student()
        {
            IAttendanceRepository attendanceRepository = new TestAttendanceRepository();
            var studentAttendance = attendanceRepository.GetAttendanceReview(1);

            Assert.IsNotNull(studentAttendance);
        }


        [TestMethod]
        public void AttendanceService_TestAttendanceRepository_Returns_StudentAttendance_Data_For_a_Test_Student()
        {
            IAttendanceService attendanceService = new AttendanceService(new TestAttendanceRepository());
            var studentAttendance = attendanceService.GetAttendanceReview(1);

            Assert.IsNotNull(studentAttendance);
        }


        [TestMethod]
        public void AttendanceService_SqlAttendanceRepository_Returns_StudentAttendance_Data_For_a_Valid_DbStudent()
        {
            IAttendanceService attendanceService = new AttendanceService();
            var studentAttendance = attendanceService.GetAttendanceReview(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentAttendance);
        }
    }
}
