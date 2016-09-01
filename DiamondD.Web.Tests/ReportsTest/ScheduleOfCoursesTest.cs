using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.SchedulesOfCourses;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DiamondD.Web.Tests.ReportsTest
{
    [TestClass]
    public class ScheduleOfCoursesTest
    {        
        [TestMethod]
        public void Verify_ScheduleOfCoursesRepository_GetStudentScheduleOfTerm_Returns_Data_Against_Valid_DbStudent()
        {
            IScheduleOfCoursesRepository scheduleOfCoursesRepository = new SqlScheduleOfCoursesRepository();
            var scheduleList = scheduleOfCoursesRepository.GetStudentScheduleOfTerm(TestConstants.DbStudentUserId);

            Assert.IsNotNull(scheduleList);
            Assert.IsTrue(scheduleList.Count > 0);
        }

        [TestMethod]
        public void Verify_TestScheduleOfCoursesRepository_GetStudentScheduleOfTerm_Returns_Data_Against_Valid_TestStudent()
        {
            IScheduleOfCoursesRepository scheduleOfCoursesRepository = new TestScheduleOfCoursesRepository();
            var scheduleList = scheduleOfCoursesRepository.GetStudentScheduleOfTerm(TestConstants.DbStudentUserId);

            Assert.IsNotNull(scheduleList);
            Assert.IsTrue(scheduleList.Count > 0);
        }

        [TestMethod]
        public void Verify_ScheduleOfCoursesService_TestScheduleOfCoursesRepository_GetStudentScheduleOfTerm_Returns_Data_Against_Valid_TestStudent()
        {
            IScheduleOfCoursesService scheduleOfCoursesRepository = new ScheduleOfCoursesService(new TestScheduleOfCoursesRepository());
            var scheduleList = scheduleOfCoursesRepository.GetStudentScheduleOfTerm(TestConstants.DbStudentUserId);

            Assert.IsNotNull(scheduleList);
            Assert.IsTrue(scheduleList.Count > 0);
        }

        [TestMethod]
        public void Verify_ScheduleOfCoursesRepository_GetStudentScheduleOfTerm_Returns_Empty_Data_Against_Invalid_DbStudent()
        {
            IScheduleOfCoursesRepository scheduleOfCoursesRepository = new SqlScheduleOfCoursesRepository();
            var scheduleList = scheduleOfCoursesRepository.GetStudentScheduleOfTerm(TestConstants.InvalidUserId);

            Assert.IsNotNull(scheduleList);
            Assert.IsTrue(scheduleList.Count == 0);
        }

        [TestMethod]
        public void Verify_ScheduleOfCoursesRepository_GetStudentScheduleOfCourses_Returns_Data_Against_Valid_DbStudent_and_Valid_Term()
        {
            IScheduleOfCoursesRepository scheduleOfCoursesRepository = new SqlScheduleOfCoursesRepository();
            var studentScheduleOfCourses = scheduleOfCoursesRepository.GetStudentScheduleOfCourses(TestConstants.DbStudentUserId, TestConstants.DbScheduleOfCourseTerm);

            Assert.IsNotNull(studentScheduleOfCourses);
            Assert.IsNotNull(studentScheduleOfCourses.ScheduleOfCourses);
            Assert.IsNotNull(studentScheduleOfCourses.StudentName);
            Assert.IsTrue(studentScheduleOfCourses.ScheduleOfCourses.Count > 0);
        }

        [TestMethod]
        public void Verify_TestScheduleOfCoursesRepository_GetStudentScheduleOfCourses_Returns_Data_Against_Valid_TestStudent_and_Valid_TestTerm()
        {
            IScheduleOfCoursesRepository scheduleOfCoursesRepository = new TestScheduleOfCoursesRepository();
            var studentScheduleOfCourses = scheduleOfCoursesRepository.GetStudentScheduleOfCourses(1, TestConstants.DbScheduleOfCourseTerm);

            Assert.IsNotNull(studentScheduleOfCourses);
            Assert.IsNotNull(studentScheduleOfCourses.ScheduleOfCourses);
            Assert.IsNotNull(studentScheduleOfCourses.StudentName);
            Assert.IsTrue(studentScheduleOfCourses.ScheduleOfCourses.Count > 0);
        }

        [TestMethod]
        public void Verify_ScheduleOfCoursesService_GetStudentScheduleOfCourses_Returns_Data_Against_Valid_TestStudent_and_Valid_TestTerm()
        {
            IScheduleOfCoursesService scheduleOfCoursesRepository = new ScheduleOfCoursesService(new TestScheduleOfCoursesRepository());
            var studentScheduleOfCourses = scheduleOfCoursesRepository.GetStudentClassSchedule(1, TestConstants.DbScheduleOfCourseTerm);

            Assert.IsNotNull(studentScheduleOfCourses);
            Assert.IsNotNull(studentScheduleOfCourses.ScheduleOfCourses);
            Assert.IsNotNull(studentScheduleOfCourses.StudentName);
            Assert.IsTrue(studentScheduleOfCourses.ScheduleOfCourses.Count > 0);
        }

        [TestMethod]
        public void Verify_ScheduleOfCoursesRepository_GetStudentScheduleOfCourses_Returns_Empty_Data_Against_Invalid_DbStudent_and_Invalid_Term()
        {
            IScheduleOfCoursesRepository scheduleOfCoursesRepository = new SqlScheduleOfCoursesRepository();
            var studentScheduleOfCourses = scheduleOfCoursesRepository.GetStudentScheduleOfCourses(TestConstants.InvalidUserId, TestConstants.InvalidScheduleOfCourseTerm);

            Assert.IsNotNull(studentScheduleOfCourses);
            Assert.IsNotNull(studentScheduleOfCourses.ScheduleOfCourses);
            Assert.IsNull(studentScheduleOfCourses.StudentName);
            Assert.IsTrue(studentScheduleOfCourses.ScheduleOfCourses.Count == 0);
        }

        [TestMethod]
        public void Verify_ScheduleOfCoursesService_ScheduleOfCoursesRepository_GetStudentScheduleOfTerm_Returns_Data_Against_Valid_DbStudent()
        {
            IScheduleOfCoursesService scheduleOfCoursesService = new ScheduleOfCoursesService(new SqlScheduleOfCoursesRepository());
            var scheduleList = scheduleOfCoursesService.GetStudentScheduleOfTerm(TestConstants.DbStudentUserId);

            Assert.IsNotNull(scheduleList);
            Assert.IsTrue(scheduleList.Count > 0);
        }

        [TestMethod]
        public void Verify_ScheduleOfCoursesService_ScheduleOfCoursesRepository_GetStudentScheduleOfTerm_Returns_Empty_Data_Against_Invalid_DbStudent()
        {
            IScheduleOfCoursesService scheduleOfCoursesService = new ScheduleOfCoursesService(new SqlScheduleOfCoursesRepository());
            var scheduleList = scheduleOfCoursesService.GetStudentScheduleOfTerm(TestConstants.InvalidUserId);

            Assert.IsNotNull(scheduleList);
            Assert.IsTrue(scheduleList.Count == 0);
        }

        [TestMethod]
        public void Verify_ScheduleOfCoursesService_ScheduleOfCoursesRepository_GetStudentScheduleOfCourses_Returns_Data_Against_Valid_DbStudent_and_Valid_Term()
        {
            IScheduleOfCoursesService scheduleOfCoursesService = new ScheduleOfCoursesService(new SqlScheduleOfCoursesRepository());
            var studentScheduleOfCourses = scheduleOfCoursesService.GetStudentClassSchedule(TestConstants.DbStudentUserId, TestConstants.DbScheduleOfCourseTerm);

            Assert.IsNotNull(studentScheduleOfCourses);
            Assert.IsNotNull(studentScheduleOfCourses.ScheduleOfCourses);
            Assert.IsNotNull(studentScheduleOfCourses.StudentName);
            Assert.IsTrue(studentScheduleOfCourses.ScheduleOfCourses.Count > 0);
        }

        [TestMethod]
        public void Verify_ScheduleOfCoursesService_ScheduleOfCoursesRepository_GetStudentScheduleOfCourses_Returns_Empty_Data_Against_Invalid_DbStudent_and_Invalid_Term()
        {
            IScheduleOfCoursesService scheduleOfCoursesService = new ScheduleOfCoursesService(new SqlScheduleOfCoursesRepository());
            var studentScheduleOfCourses = scheduleOfCoursesService.GetStudentClassSchedule(TestConstants.InvalidUserId, TestConstants.InvalidScheduleOfCourseTerm);

            Assert.IsNotNull(studentScheduleOfCourses);
            Assert.IsNotNull(studentScheduleOfCourses.ScheduleOfCourses);
            Assert.IsNull(studentScheduleOfCourses.StudentName);
            Assert.IsTrue(studentScheduleOfCourses.ScheduleOfCourses.Count == 0);
        }
    }
}
