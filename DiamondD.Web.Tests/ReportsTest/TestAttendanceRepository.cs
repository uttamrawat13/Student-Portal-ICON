using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Attendance;
using DiamondD.Data.DataAccess.Repositories.Base;

namespace DiamondD.Web.Tests.ReportsTest
{
    public class TestAttendanceRepository : IAttendanceRepository
    {
        private Dictionary<int, StudentAttendance> AttendanceData { get; set; }
        private Dictionary<int, StudentAttendanceSummary> SummaryData { get; set; }

        public TestAttendanceRepository()
        {
            Init();
        }

        private void Init()
        {
            #region Filling AttendanceData Test Data

            AttendanceData = new Dictionary<int, StudentAttendance>();

            var attendanceEntries = new List<AttendanceEntry>();

            var attendanceEntry1 = new AttendanceEntry
                                      {
                                          StudentNo = 1,
                                          Student = "Alex",
                                          Course = "Test001 (T-1)",
                                          TermBeginDate = new DateTime(2011, 2, 16),
                                          ClassDate = new DateTime(2011, 2, 16),
                                          ClassStartTime = new DateTime(1899, 12, 30, 5, 30, 0),
                                          ClassEndTime = new DateTime(1899, 12, 30, 9, 30, 0),
                                          ClassHours = "4",
                                          Complete = "Y",
                                          AttendanceHours = 4,
                                          CourseDescription = "This is test 1 course.",
                                          AttendanceCode = "P",
                                          AttendedAdj = 4,
                                          ScheduledAdj = 4
                                      };

            var attendanceEntry2 = new AttendanceEntry
                                       {
                                           StudentNo = 1,
                                           Student = "Alex",
                                           Course = "Test001 (T-1)",
                                           TermBeginDate = new DateTime(2011, 2, 16),
                                           ClassDate = new DateTime(2011, 2, 17),
                                           ClassStartTime = new DateTime(1899, 12, 30, 5, 30, 0),
                                           ClassEndTime = new DateTime(1899, 12, 30, 9, 30, 0),
                                           ClassHours = "4",
                                           Complete = "Y",
                                           AttendanceHours = 4,
                                           CourseDescription = "This is test 1 course.",
                                           AttendanceCode = "P",
                                           AttendedAdj = 4,
                                           ScheduledAdj = 4
                                       };

            var attendanceEntry3 = new AttendanceEntry
                                       {
                                           StudentNo = 1,
                                           Student = "Alex",
                                           Course = "Test002 (T-2)",
                                           TermBeginDate = new DateTime(2011, 2, 16),
                                           ClassDate = new DateTime(2011, 3, 10),
                                           ClassStartTime = null,
                                           ClassEndTime = null,
                                           ClassHours = "0",
                                           Complete = "Y",
                                           AttendanceHours = 3,
                                           CourseDescription = "This is test 3 course.",
                                           AttendanceCode = "P",
                                           AttendedAdj = 3,
                                           ScheduledAdj = 3
                                       };

            attendanceEntries.Add(attendanceEntry1);
            attendanceEntries.Add(attendanceEntry2);
            attendanceEntries.Add(attendanceEntry3);

            var studentAttendance = new StudentAttendance(attendanceEntries);
            AttendanceData.Add(1, studentAttendance);


            attendanceEntry1 = new AttendanceEntry
            {
                StudentNo = 2,
                Student = "Ben",
                Course = "Test011 (T-11)",
                TermBeginDate = new DateTime(2011, 3, 8),
                ClassDate = new DateTime(2011, 3, 8),
                ClassStartTime = new DateTime(1899, 12, 30, 5, 30, 0),
                ClassEndTime = new DateTime(1899, 12, 30, 9, 30, 0),
                ClassHours = "4",
                Complete = "Y",
                AttendanceHours = 4,
                CourseDescription = "This is a test 11 course.",
                AttendanceCode = "P",
                AttendedAdj = 4,
                ScheduledAdj = 4
            };

            attendanceEntry2 = new AttendanceEntry
            {
                StudentNo = 2,
                Student = "Ben",
                Course = "Test012 (T-12)",
                TermBeginDate = new DateTime(2011, 3, 8),
                ClassDate = new DateTime(2011, 3, 9),
                ClassStartTime = new DateTime(1899, 12, 30, 5, 30, 0),
                ClassEndTime = new DateTime(1899, 12, 30, 9, 30, 0),
                ClassHours = "4",
                Complete = "Y",
                AttendanceHours = 4,
                CourseDescription = "This is a test 2 course.",
                AttendanceCode = "P",
                AttendedAdj = 4,
                ScheduledAdj = 4
            };

            attendanceEntry3 = new AttendanceEntry
            {
                StudentNo = 2,
                Student = "Ben",
                Course = "Test013 (T-13)",
                TermBeginDate = new DateTime(2011, 3, 8),
                ClassDate = new DateTime(2011, 3, 22),
                ClassStartTime = null,
                ClassEndTime = null,
                ClassHours = "4",
                Complete = "Y",
                AttendanceHours = 4,
                CourseDescription = "This is a test 13 course.",
                AttendanceCode = "P",
                AttendedAdj = 4,
                ScheduledAdj = 4
            };

            attendanceEntries = new List<AttendanceEntry> {attendanceEntry1, attendanceEntry2, attendanceEntry3};
            studentAttendance = new StudentAttendance(attendanceEntries);
            AttendanceData.Add(2, studentAttendance);

            #endregion

            SummaryData = new Dictionary<int, StudentAttendanceSummary>();

            var attendanceSummary1 = new AttendanceSummary();
            attendanceSummary1.StudentNo = 1;
            attendanceSummary1.Student = "Alex";
            attendanceSummary1.Course = "Test001 (T-1)";
            attendanceSummary1.CourseDescription = "This is Test 1 Course";
            attendanceSummary1.TermBeginDate = new DateTime(2011, 2, 16);
            attendanceSummary1.ScheduledTotal = 8;
            attendanceSummary1.ScheduledToDate = 8;
            attendanceSummary1.AttendedToDate = 8;
            attendanceSummary1.AttendedPercentage = ((attendanceSummary1.AttendedToDate * 100) / attendanceSummary1.ScheduledToDate);


            var attendanceSummary2 = new AttendanceSummary();
            attendanceSummary2.StudentNo = 1;
            attendanceSummary2.Student = "Alex";
            attendanceSummary2.Course = "Test002 (T-2)";
            attendanceSummary2.CourseDescription = "This is Test 2 Course";
            attendanceSummary2.TermBeginDate = new DateTime(2011, 2, 16);
            attendanceSummary2.ScheduledTotal = 3;
            attendanceSummary2.ScheduledToDate = 3;
            attendanceSummary2.AttendedToDate = 3;
            attendanceSummary2.AttendedPercentage = ((attendanceSummary2.AttendedToDate * 100) / attendanceSummary2.ScheduledToDate);

            var summary = new StudentAttendanceSummary(new[] {attendanceSummary1, attendanceSummary2});

            SummaryData.Add(1, summary);


            attendanceSummary1 = new AttendanceSummary();
            attendanceSummary1.StudentNo = 2;
            attendanceSummary1.Student = "Ben";
            attendanceSummary1.Course = "Test011 (T-11)";
            attendanceSummary1.CourseDescription = "This is Test 11 Course";
            attendanceSummary1.TermBeginDate = new DateTime(2011, 2, 16);
            attendanceSummary1.ScheduledTotal = 8;
            attendanceSummary1.ScheduledToDate = 8;
            attendanceSummary1.AttendedToDate = 8;
            attendanceSummary1.AttendedPercentage = ((attendanceSummary1.AttendedToDate * 100) / attendanceSummary1.ScheduledToDate);


            attendanceSummary2 = new AttendanceSummary();
            attendanceSummary2.StudentNo = 2;
            attendanceSummary2.Student = "Ben";
            attendanceSummary2.Course = "Test012 (T-12)";
            attendanceSummary2.CourseDescription = "This is Test 12 Course";
            attendanceSummary2.TermBeginDate = new DateTime(2011, 2, 16);
            attendanceSummary2.ScheduledTotal = 12;
            attendanceSummary2.ScheduledToDate = 12;
            attendanceSummary2.AttendedToDate = 12;
            attendanceSummary2.AttendedPercentage = ((attendanceSummary2.AttendedToDate * 100) / attendanceSummary2.ScheduledToDate);

            summary = new StudentAttendanceSummary(new[] {attendanceSummary1, attendanceSummary2});
            SummaryData.Add(2, summary);
        }

        public StudentAttendance GetAttendanceReview(int studentNo)
        {
            return AttendanceData[studentNo];
        }

        public StudentAttendance GetAttendanceReview(int studentNo, DateTime dateFrom, DateTime dateTo)
        {
            var filteredEntries = new List<AttendanceEntry>();
            var studentAttendance = AttendanceData[studentNo];
            double? totalScheduledComplete = 0.0;
            double? totalScheduledAttended = 0.0;

            foreach (var entry in studentAttendance.AttendanceEntries)
            {
                if (entry.ClassDate >= dateFrom && entry.ClassDate <= dateTo)
                {
                    filteredEntries.Add(entry);

                    totalScheduledAttended += entry.AttendedAdj;
                    totalScheduledComplete += entry.ScheduledAdj;
                }
            }
            return new StudentAttendance(filteredEntries, dateFrom, dateTo, totalScheduledComplete.Value, totalScheduledAttended.Value);
        }

        public StudentAttendanceSummary GetAttendanceSummary(int studentNo)
        {
            return SummaryData[studentNo];
        }
    }
}
