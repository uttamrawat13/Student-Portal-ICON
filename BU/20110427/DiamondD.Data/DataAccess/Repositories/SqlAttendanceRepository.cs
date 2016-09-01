using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Attendance;
using DiamondD.Data.DataAccess.Repositories.Base;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace DiamondD.Data.DataAccess.Repositories
{
   public class SqlAttendanceRepository : IAttendanceRepository
    {
       public StudentAttendance GetAttendanceReview(int studentNo)
       {
            var query = new StringBuilder();
            query.AppendFormat("SELECT [StudentNo],[Student],[Course],[TermBeginDate],[ClassDate],[ClassStartTime],[ClassEndTime],[ClassHours],[Complete],[AttendanceHours],[CourseDescription],[AttendanceCode],[AttendedAdj],[ScheduledAdj] ")
                .AppendFormat(" FROM vWebAttendanceReview WHERE StudentNo = {0} ORDER BY ClassDate ASC", studentNo);

            var attendanceEntries = new List<AttendanceEntry>();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var attendanceEntry = new AttendanceEntry
                    {
                        //AttendanceType = reader[++colIndex] as string,
                        StudentNo = reader[++colIndex] as int?,
                        Student = reader[++colIndex] as string,
                        Course = reader[++colIndex] as string,
                        TermBeginDate = reader[++colIndex] as DateTime?,
                        ClassDate = reader[++colIndex] as DateTime?,
                        ClassStartTime = reader[++colIndex] as DateTime?,
                        ClassEndTime = reader[++colIndex] as DateTime?,
                        ClassHours = reader[++colIndex] as string,
                        Complete = reader[++colIndex] as string,
                        AttendanceHours = reader[++colIndex] as double?,
                        CourseDescription = reader[++colIndex] as string,
                        AttendanceCode = reader[++colIndex] as string,
                        AttendedAdj = reader[++colIndex] as double?,
                        ScheduledAdj = reader[++colIndex] as double?
                    };

                    attendanceEntries.Add(attendanceEntry);
                }
            }

            return new StudentAttendance(attendanceEntries);
       }
       public StudentAttendance GetAttendanceReview(int studentNo, DateTime dateFrom, DateTime dateTo)
       {
           var query = new StringBuilder();
           query.AppendFormat("SELECT StudentNo, student, Course, ClassDate, ClassStartTime, ClassEndTime, ClassHours, AttendanceHours, AttendanceCode, Complete, CourseDescription, AttendedAdj, ScheduledAdj ")
               .AppendFormat(" FROM vWebAttendanceReview ")
               .AppendFormat(" WHERE StudentNo = {0} AND ClassDate BETWEEN '{1}' AND '{2}' ORDER BY ClassDate ASC", studentNo, dateFrom, dateTo);

           var attendanceEntries = new List<AttendanceEntry>();

           using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
           {
               while (reader.Read())
               {
                   int colIndex = -1;
                   var attendanceEntry = new AttendanceEntry
                   {
                       StudentNo = reader[++colIndex] as int?,
                       Student = reader[++colIndex] as string,
                       Course = reader[++colIndex] as string,
                       ClassDate = reader[++colIndex] as DateTime?,
                       ClassStartTime = reader[++colIndex] as DateTime?,
                       ClassEndTime = reader[++colIndex] as DateTime?,
                       ClassHours = reader[++colIndex] as string,
                       AttendanceHours = reader[++colIndex] as double?,
                       AttendanceCode = reader[++colIndex] as string,
                       ScheduledComplete = reader[++colIndex] as string,
                       CourseDescription = reader[++colIndex] as string,
                       AttendedAdj = reader[++colIndex] as double?,
                       ScheduledAdj = reader[++colIndex] as double?
                   };

                   attendanceEntries.Add(attendanceEntry);
               }
           }

           query = new StringBuilder();
           query.AppendFormat("SELECT SUM(AttendedAdj) as TotalScheduledAttended,Sum(ScheduledAdj) as  TotalScheduledComplete")
               .AppendFormat(" FROM vWebAttendanceReview")
               .AppendFormat(" WHERE StudentNo = {0} ", studentNo);
           
           double totalScheduledComplete = 0.0;
           double totalScheduledAttended = 0.0;
           
           using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
           {
               while (reader.Read())
               {
                   int colIndex = -1;
                   double.TryParse(reader[++colIndex].ToString(), out totalScheduledAttended);
                   double.TryParse(reader[++colIndex].ToString(), out totalScheduledComplete);
               }
           }

           return new StudentAttendance(attendanceEntries, dateFrom, dateTo, totalScheduledComplete, totalScheduledAttended);
       }

       public StudentAttendanceSummary GetAttendanceSummary(int studentNo)
       {
           var query = new StringBuilder();
           query.AppendFormat("SELECT StudentNo, Student, Course, CourseDescription, TermBeginDate, ScheduledTotal, ScheduledToDate, AttendedToDate")
           .AppendFormat(" FROM vWebAttendanceSummary")
           .AppendFormat(" WHERE StudentNo = {0} ORDER BY TermBeginDate ASC", studentNo);

           var attendanceSummaries = new List<AttendanceSummary>();

           using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
           {
               while (reader.Read())
               {
                   int colIndex = -1;
                   var attendanceSummary = new AttendanceSummary();

                   attendanceSummary.StudentNo = reader[++colIndex] as int?;
                   attendanceSummary.Student = reader[++colIndex] as string;
                   attendanceSummary.Course = reader[++colIndex] as string;
                   attendanceSummary.CourseDescription = reader[++colIndex] as string;
                   attendanceSummary.TermBeginDate = reader[++colIndex] as DateTime?;
                   attendanceSummary.ScheduledTotal = reader[++colIndex] as double?;
                   attendanceSummary.ScheduledToDate = reader[++colIndex] as double?;
                   attendanceSummary.AttendedToDate = reader[++colIndex] as double?;
                   attendanceSummary.AttendedPercentage = ((attendanceSummary.AttendedToDate * 100) / attendanceSummary.ScheduledToDate);

                   attendanceSummaries.Add(attendanceSummary);
               }
           }
           return new StudentAttendanceSummary(attendanceSummaries);
       }
    }
}
