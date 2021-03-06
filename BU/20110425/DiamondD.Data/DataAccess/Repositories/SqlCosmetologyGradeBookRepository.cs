﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.CosmetologyGradeBook;
using System.Data;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlCosmetologyGradeBookRepository : ICosmetologyGradeBookRepository
    {
        public StudentCosmetologyGradeBookSummary GetStudentCosmetologyGradeBookSummaryReport(int studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT StudentNo, Student, GradeBookGPA, TotalScheduled, TotalAttended, AttendancePercentage,TotalRequiredHours, TotalTransferHours, TotalHoursRemaining")
            .AppendFormat(" FROM vWebCosmetologyGradeBookSummary")
            .AppendFormat(" WHERE StudentNo = {0} ORDER BY Student ASC", studentNo);

            var cosmetologyGradeBookSummary = new List<CosmetologyGradeBookSummary>();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var gradeBookSummary = new CosmetologyGradeBookSummary
                    {
                        StudentNo = reader[++colIndex] as int?,
                        Student = reader[++colIndex] as string,
                        GradeBookGPA = reader[++colIndex] as double?,
                        TotalScheduled = reader[++colIndex] as double?,
                        TotalAttended = reader[++colIndex] as double?,
                        AttendancePercentage = reader[++colIndex] as double?,
                        TotalRequiredHours = reader[++colIndex] as double?,
                        TotalTransferHours = reader[++colIndex] as double?,
                        TotalHoursRemaining = reader[++colIndex] as double?
                    };
                    cosmetologyGradeBookSummary.Add(gradeBookSummary);
                }
            }
            return new StudentCosmetologyGradeBookSummary(cosmetologyGradeBookSummary);
        }
        public StudentCosmetologyGradeBookTest GetStudentCosmetologyGradeBookTestReport(int studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT StudentNo, Student, [Description], CompletedPoints")
            .AppendFormat(" FROM vWebCosmetologyGradeBookTest")
            .AppendFormat(" WHERE StudentNo = {0} ORDER BY Student, [Description] ASC", studentNo);

            var cosmetologyGradeBookTest = new List<CosmetologyGradeBookTest>();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var gradeBookTest = new CosmetologyGradeBookTest
                    {
                        StudentNo = reader[++colIndex] as int?,
                        Student = reader[++colIndex] as string,
                        Description = reader[++colIndex] as string,
                        CompletedPoints = reader[++colIndex] as double?

                    };
                    cosmetologyGradeBookTest.Add(gradeBookTest);
                }
            }
            return new StudentCosmetologyGradeBookTest(cosmetologyGradeBookTest);
        }
        public StudentCosmetologyGradeBookLab GetStudentCosmetologyGradeBookLabReport(int studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT StudentNo, Student, [Description], CompletedSessions, RequiredSessions ")
            .AppendFormat(" FROM vWebCosmetologyGradeBookLab")
            .AppendFormat(" WHERE StudentNo = {0} ORDER BY Student, [Description] ASC", studentNo);

            var cosmetologyGradeBookLab = new List<CosmetologyGradeBookLab>();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var gradeBookLab = new CosmetologyGradeBookLab
                    {
                        StudentNo = reader[++colIndex] as int?,
                        Student = reader[++colIndex] as string,
                        Description = reader[++colIndex] as string,
<<<<<<< .mine
                        CompletedSessions = reader[++colIndex] as int?,
=======
                        CompletedSessions = int.Parse(reader[++colIndex].ToString()) as int?,
>>>>>>> .r74
                        RequiredSessions = int.Parse(reader[++colIndex].ToString()) as int?
                    };
                    cosmetologyGradeBookLab.Add(gradeBookLab);
                }
            }
            return new StudentCosmetologyGradeBookLab(cosmetologyGradeBookLab);


        }
    }
}
