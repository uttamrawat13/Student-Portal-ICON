using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.CosmetologyGradeBook;
using DiamondD.Data.DataAccess.Ledger;
using DiamondD.Data.DataAccess.Repositories.Base;

namespace DiamondD.Web.Tests.ReportsTest
{

    public class TestCosmetologyGradeBookRepository : ICosmetologyGradeBookRepository
    {
        private Dictionary<int, StudentCosmetologyGradeBookTest> studentCosmetologyGradeBookTest { get; set; }
        private Dictionary<int, StudentCosmetologyGradeBookSummary> studentCosmetologyGradeBookSummary { get; set; }
        private Dictionary<int, StudentCosmetologyGradeBookLab> studentCosmetologyGradeBookLab { get; set; }

        public TestCosmetologyGradeBookRepository()
        {
            init();
        }

        private void init()
        {
            #region Insert Test Data of Student Cosmetology Grade Book Test

            studentCosmetologyGradeBookTest = new Dictionary<int, StudentCosmetologyGradeBookTest>();

            var cosmetologyGradeBookTest = new List<DiamondD.Data.DataAccess.CosmetologyGradeBook.CosmetologyGradeBookTest>();
            // Enter Test Data
            var gradeBookTest1 = new DiamondD.Data.DataAccess.CosmetologyGradeBook.CosmetologyGradeBookTest
            {
                StudentNo = 1,
                Student = "Alex",
                Description = "Test 1",
                CompletedPoints = 95.00
            };

            cosmetologyGradeBookTest.Add(gradeBookTest1);
            // Enter Test Data
            var gradeBookTest2 = new DiamondD.Data.DataAccess.CosmetologyGradeBook.CosmetologyGradeBookTest
            {
                StudentNo = 1,
                Student = "Alex",
                Description = "Test 2",
                CompletedPoints = 100
            };

            cosmetologyGradeBookTest.Add(gradeBookTest2);
            // Enter Test Data
            var gradeBookTest3 = new DiamondD.Data.DataAccess.CosmetologyGradeBook.CosmetologyGradeBookTest
            {
                StudentNo = 1,
                Student = "Alex",
                Description = "Test 3",
                CompletedPoints = 95.00
            };

            cosmetologyGradeBookTest.Add(gradeBookTest3);

            var CosmetologyGradeBookTest = new StudentCosmetologyGradeBookTest(cosmetologyGradeBookTest);
            studentCosmetologyGradeBookTest.Add(1, CosmetologyGradeBookTest);

            #endregion

            #region Insert Test Data of Student Cosmetology Grade Book Summary

            studentCosmetologyGradeBookSummary = new Dictionary<int, StudentCosmetologyGradeBookSummary>();

            var cosmetologyGradeBookSummary = new List<CosmetologyGradeBookSummary>();
            // Enter Valid Data
            var gradeBookSummary1 = new CosmetologyGradeBookSummary
            {
                StudentNo = 1,
                Student = "Alex",
                GradeBookGPA = 90.00,
                TotalScheduled = 2000.00,
                TotalAttended = 1500.00,
                AttendancePercentage = 75.00,
                TotalRequiredHours = 1800,
                TotalTransferHours = 500,
                TotalHoursRemaining = 300.00
            };
            cosmetologyGradeBookSummary.Add(gradeBookSummary1);
            // Enter Valid Data
            var gradeBookSummary2 = new CosmetologyGradeBookSummary
            {
                StudentNo = 1,
                Student = "Alex",
                GradeBookGPA = 90.00,
                TotalScheduled = 2000.00,
                TotalAttended = 1600.00,
                AttendancePercentage = 80.00,
                TotalRequiredHours = 1800,
                TotalTransferHours = 500,
                TotalHoursRemaining = 200.00
            };
            cosmetologyGradeBookSummary.Add(gradeBookSummary2);
            // Enter Valid Data
            var gradeBookSummary3 = new CosmetologyGradeBookSummary
            {
                StudentNo = 1,
                Student = "Alex",
                GradeBookGPA = 90.00,
                TotalScheduled = 2000.00,
                TotalAttended = 1700.00,
                AttendancePercentage = 85.00,
                TotalRequiredHours = 1800,
                TotalTransferHours = 500,
                TotalHoursRemaining = 100.00
            };
            cosmetologyGradeBookSummary.Add(gradeBookSummary3);

            var CosmetologyGradeBookSummary = new StudentCosmetologyGradeBookSummary(cosmetologyGradeBookSummary);
            studentCosmetologyGradeBookSummary.Add(1, CosmetologyGradeBookSummary);

            #endregion

            #region Insert Test Data of Student Cosmetology Grade Book Lab

            studentCosmetologyGradeBookLab = new Dictionary<int, StudentCosmetologyGradeBookLab>();

            var cosmetologyGradeBookLab = new List<CosmetologyGradeBookLab>();
            //Enter Valid Data
            var gradeBookLab1 = new CosmetologyGradeBookLab
            {
                StudentNo = 1,
                Student = "Alex",
                Description = "Test 1",
                CompletedSessions = 150,
                RequiredSessions = 160
            };
            cosmetologyGradeBookLab.Add(gradeBookLab1);

            //Enter Valid Data
            var gradeBookLab2 = new CosmetologyGradeBookLab
            {
                StudentNo = 1,
                Student = "Alex",
                Description = "Test 2",
                CompletedSessions = 60,
                RequiredSessions = 100
            };
            cosmetologyGradeBookLab.Add(gradeBookLab2);

            //Enter Valid Data
            var gradeBookLab3 = new CosmetologyGradeBookLab
            {
                StudentNo = 1,
                Student = "Alex",
                Description = "Test 3",
                CompletedSessions = 50,
                RequiredSessions = 50
            };
            cosmetologyGradeBookLab.Add(gradeBookLab3);

            var CosmetologyGradeBookLab = new StudentCosmetologyGradeBookLab(cosmetologyGradeBookLab);
            studentCosmetologyGradeBookLab.Add(1, CosmetologyGradeBookLab);

            #endregion

        }

        public StudentCosmetologyGradeBookTest GetStudentCosmetologyGradeBookTestReport(int studentNo)
        {
            return studentCosmetologyGradeBookTest[studentNo];
        }

        public StudentCosmetologyGradeBookSummary GetStudentCosmetologyGradeBookSummaryReport(int studentNo)
        {
            return studentCosmetologyGradeBookSummary[studentNo];
        }

        public StudentCosmetologyGradeBookLab GetStudentCosmetologyGradeBookLabReport(int studentNo)
        {
            return studentCosmetologyGradeBookLab[studentNo];
        }
    }
}
