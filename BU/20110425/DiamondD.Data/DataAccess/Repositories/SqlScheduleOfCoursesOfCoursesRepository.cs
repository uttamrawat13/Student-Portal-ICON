using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using System.Data;
using DiamondD.Data.DataAccess.ScheduleOfCourses;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlScheduleOfCoursesOfCoursesRepository : IScheduleOfCoursesRepositry
    {
        public StudentScheduleOfCourses GetStudentScheduleOfCourses(int studentNo,string termDate)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT StudentNo, Student, TermBeginDate, Course, CourseDescription, Room, Instructor, Units, FirstClassDate, LastClassDate")
            .AppendFormat(" FROM vWebScheduleOfCourses")
            .AppendFormat(" WHERE StudentNo = {0} AND TermBeginDate = '{1}'", studentNo, termDate);

            var classSchedules = new List<ScheduleOfCourse>();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var classSchedule = new ScheduleOfCourse()
                    {
                    StudentNo = reader[++colIndex] as int?,
                    Student = reader[++colIndex] as string,
                    TermBeginDate = reader[++colIndex] as DateTime?,
                    Course = reader[++colIndex] as string,
                    CourseDescription = reader[++colIndex] as string,
                    Room = reader[++colIndex] as string,
                    Instructor = reader[++colIndex] as string,
                    Units = reader[++colIndex] as double?,
                    FirstClassDate = reader[++colIndex] as DateTime?,
                    LastClassDate = reader[++colIndex] as DateTime?
                };
                    classSchedules.Add(classSchedule);
                }
            }

            return new StudentScheduleOfCourses(classSchedules);
        }

        public IList<string> GetStudentScheduleOfTerm(int studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT DISTINCT TermBeginDate")
                .AppendFormat(" FROM vWebScheduleOfCourses")
                .AppendFormat(" WHERE StudentNo = {0}", studentNo)
                .AppendFormat("ORDER BY TermBeginDate DESC");

            var termList = new List<string>();
            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    DateTime termDateTime = reader.GetDateTime(0);
                    string termDate = termDateTime.Date.ToString("MM/dd/yyyy");
                    termList.Add(termDate);
                }
            }

            return termList;
        }
    }
}
