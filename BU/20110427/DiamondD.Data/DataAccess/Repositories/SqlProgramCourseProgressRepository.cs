using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.ProgramCourseStatus;
using System.Data;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlProgramCourseProgressRepository : IProgramCourseProgressRepository
    {
        public StudentProgramCourseProgress GetStudentProgramCoursePrograssDetail(int? studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT  TOP (100) PERCENT StudentNo, Student, ReportGroup, CourseNo, CourseCode, CourseDescription, Units")
            .AppendFormat(" FROM vWebProgramCourseProgress")
            .AppendFormat(" WHERE StudentNo = {0} ORDER BY Student, ReportGroup, CourseCode", studentNo);

            var programCoursePrograssDetail = new List<ProgramCourseProgress>();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var programCoursePrograss = new ProgramCourseProgress()
                    {

                        StudentNo = reader[++colIndex] as int?,
                        Student = reader[++colIndex] as string,
                        ReportGroup = reader[++colIndex] as string,
                        CourseNo = reader[++colIndex] as int?,
                        CourseCode = reader[++colIndex] as string,
                        CourseDescription = reader[++colIndex] as string,
                        Units = reader[++colIndex] as double?
                    };
                    programCoursePrograssDetail.Add(programCoursePrograss);
                }
            }
            return new StudentProgramCourseProgress(programCoursePrograssDetail);
        }
    }
}
