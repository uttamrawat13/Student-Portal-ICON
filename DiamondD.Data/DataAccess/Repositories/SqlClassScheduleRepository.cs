using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.ClassSchedules;
using System.Data;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlClassScheduleRepository : IClassScheduleRepositry
    {
        public StudentClassSchedule GetStudentClassSchedule(int studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT StudentNo, Student, TermBeginDate, Course, CourseDescription, Room, Instructor, Units, FirstClassDate,                                 LastClassDate")
            .AppendFormat(" FROM vWebScheduleOfCourses")
            .AppendFormat(" WHERE StudentNo = {0}", studentNo);

            var classSchedules = new List<ClassSchedule>();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var classSchedule = new ClassSchedule()
                    {
                    StudentNo = reader[++colIndex] as int?,
                    Student = reader[++colIndex] as string,
                    TermBeginDate = reader[++colIndex] as DateTime?,
                    Course = reader[++colIndex] as string,
                    CourseDescription = reader[++colIndex] as string,
                    Room = reader[++colIndex] as string,
                    Instructor = reader[++colIndex] as string,
                    Units = reader[++colIndex] as double?,
                    FirstClassDate = reader[++colIndex] as string,
                    LastClassDate = reader[++colIndex] as string
                };
                    classSchedules.Add(classSchedule);
                }
            }

            return new StudentClassSchedule(classSchedules);
        }
    }
}
