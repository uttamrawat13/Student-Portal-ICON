using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.ScheduleOfCourses;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DiamondD.Web.Tests.ReportsTest
{

    public class TestScheduleOfCoursesRepository : IScheduleOfCoursesRepository
    {
        private Dictionary<int, StudentScheduleOfCourses> scheduleOfCourses { get; set; }

        public TestScheduleOfCoursesRepository()
        {
            init();
        }

        private void init()
        {
            #region Insert Test Data of Schedule of Courses
            
            
            scheduleOfCourses = new Dictionary<int, StudentScheduleOfCourses>();
            
            var classSchedules = new List<ScheduleOfCourse>();

            // Enter Test Data
            var classSchedule1 = new ScheduleOfCourse
            {
                StudentNo = 1,
                Student = "Alex",
                TermBeginDate = new DateTime(10, 01, 12, 00, 00, 00, 000),
                Course = "PRP001  (Test-1)",
                CourseDescription = "Test",
                Room = "5",
                Instructor = "john",
                Units = 1600.00,
                FirstClassDate = new DateTime(10, 01, 12, 00, 00, 00, 000),
                LastClassDate = new DateTime(10, 02, 12, 00, 00, 00, 000),
            };

            classSchedules.Add(classSchedule1);

            // Enter Test Data
            var classSchedule2 = new ScheduleOfCourse
            {
                StudentNo = 1,
                Student = "Alex",
                TermBeginDate = new DateTime(10, 03, 12, 00, 00, 00, 000),
                Course = "PRP001  (Test-2)",
                CourseDescription = "Test",
                Room = "5",
                Instructor = "john",
                Units = 1600.00,
                FirstClassDate = new DateTime(10, 03, 12, 00, 00, 00, 000),
                LastClassDate = new DateTime(10, 04, 12, 00, 00, 00, 000),
            };

            classSchedules.Add(classSchedule2);

            // Enter Test Data
            var classSchedule3 = new ScheduleOfCourse
            {
                StudentNo = 1,
                Student = "Alex",
                TermBeginDate = new DateTime(10, 05, 12, 00, 00, 00, 000),
                Course = "PRP001  (Test-3)",
                CourseDescription = "Test",
                Room = "5",
                Instructor = "john",
                Units = 1600.00,
                FirstClassDate = new DateTime(10, 05, 12, 00, 00, 00, 000),
                LastClassDate = new DateTime(10, 06, 12, 00, 00, 00, 000),
            };

            classSchedules.Add(classSchedule3);

            var studentAttendance = new StudentScheduleOfCourses(classSchedules);
            scheduleOfCourses.Add(1, studentAttendance);



            classSchedules = new List<ScheduleOfCourse>();

            // Enter Test Data
            classSchedule1 = new ScheduleOfCourse
            {
                StudentNo = 2,
                Student = "Ben",
                TermBeginDate = new DateTime(10, 01, 12, 00, 00, 00, 000),
                Course = "PRP001  (Test-1)",
                CourseDescription = "Test",
                Room = "5",
                Instructor = "john",
                Units = 1600.00,
                FirstClassDate = new DateTime(10, 01, 12, 00, 00, 00, 000),
                LastClassDate = new DateTime(10, 02, 12, 00, 00, 00, 000),
            };

            classSchedules.Add(classSchedule1);

            // Enter Test Data
            classSchedule2 = new ScheduleOfCourse
            {
                StudentNo = 2,
                Student = "Ben",
                TermBeginDate = new DateTime(10, 03, 12, 00, 00, 00, 000),
                Course = "PRP001  (Test-2)",
                CourseDescription = "Test",
                Room = "5",
                Instructor = "john",
                Units = 1600.00,
                FirstClassDate = new DateTime(10, 03, 12, 00, 00, 00, 000),
                LastClassDate = new DateTime(10, 04, 12, 00, 00, 00, 000),
            };

            classSchedules.Add(classSchedule2);

            // Enter Test Data
            classSchedule3 = new ScheduleOfCourse
            {
                StudentNo = 2,
                Student = "Ben",
                TermBeginDate = new DateTime(10, 05, 12, 00, 00, 00, 000),
                Course = "PRP001  (Test-3)",
                CourseDescription = "Test",
                Room = "5",
                Instructor = "john",
                Units = 1600.00,
                FirstClassDate = new DateTime(10, 05, 12, 00, 00, 00, 000),
                LastClassDate = new DateTime(10, 06, 12, 00, 00, 00, 000),
            };

            classSchedules.Add(classSchedule3);

            studentAttendance = new StudentScheduleOfCourses(classSchedules);
            scheduleOfCourses.Add(2, studentAttendance);

            #endregion
        }


        public StudentScheduleOfCourses GetStudentScheduleOfCourses(int studentNo, string termDate)
        {
            return scheduleOfCourses[studentNo];
        }

        public IList<string> GetStudentScheduleOfTerm(int studentNo)
        {
            var termList = new List<string>();

                DateTime termDateTime1 = new DateTime(10, 01, 12, 00, 00, 00, 000);
                string termDate1 = termDateTime1.Date.ToString("MM/dd/yyyy");
                termList.Add(termDate1);

                DateTime termDateTime2 = new DateTime(10, 04, 12, 00, 00, 00, 000);
                string termDate2 = termDateTime2.Date.ToString("MM/dd/yyyy");
                termList.Add(termDate2);

                DateTime termDateTime3 = new DateTime(10, 08, 12, 00, 00, 00, 000);
                string termDate3 = termDateTime3.Date.ToString("MM/dd/yyyy");
                termList.Add(termDate3);

            return termList;
        }
    }
}
