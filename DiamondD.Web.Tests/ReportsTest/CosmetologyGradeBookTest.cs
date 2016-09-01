using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.CosmetologyGradeBook;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DiamondD.Web.Tests.ReportsTest
{
    [TestClass]
    public class CosmetologyGradeBookTest
    {
        [TestMethod]
        public void Verify_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookSummaryReport_Returns_Data_Against_Valid_Db_Student()
        {
            ICosmetologyGradeBookRepository gradeBookRepository = new SqlCosmetologyGradeBookRepository();
            var studentGradeBookSummary = gradeBookRepository.GetStudentCosmetologyGradeBookSummaryReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentGradeBookSummary);
            Assert.IsNotNull(studentGradeBookSummary.StudentName);
            Assert.IsNotNull(studentGradeBookSummary.CosmetologyGradeBookSummaries);
            Assert.IsTrue(studentGradeBookSummary.CosmetologyGradeBookSummaries.Count > 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookService_GetStudentCosmetologyGradeBookSummaryReport_Returns_Data_Against_Valid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookRepository = new CosmetologyGradeBookService();
            var studentGradeBookSummary = gradeBookRepository.GetStudentCosmetologyGradeBookSummaryReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentGradeBookSummary);
            Assert.IsNotNull(studentGradeBookSummary.StudentName);
            Assert.IsNotNull(studentGradeBookSummary.CosmetologyGradeBookSummaries);
            Assert.IsTrue(studentGradeBookSummary.CosmetologyGradeBookSummaries.Count > 0);
        }

        [TestMethod]
        public void Verify_TestCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookSummaryReport_Returns_Data_Against_Test_Student()
        {
            ICosmetologyGradeBookRepository gradeBookRepository = new TestCosmetologyGradeBookRepository();
            var studentGradeBookSummary = gradeBookRepository.GetStudentCosmetologyGradeBookSummaryReport(1);

            Assert.IsNotNull(studentGradeBookSummary);
            Assert.IsNotNull(studentGradeBookSummary.StudentName);
            Assert.IsNotNull(studentGradeBookSummary.CosmetologyGradeBookSummaries);
            Assert.IsTrue(studentGradeBookSummary.CosmetologyGradeBookSummaries.Count > 0);
        }

        [TestMethod]
        public void Verify_TestCosmetologyGradeBookService_GetStudentCosmetologyGradeBookSummaryReport_Returns_Data_Against_Test_Student()
        {
            ICosmetologyGradeBookService gradeBookRepository = new CosmetologyGradeBookService(new TestCosmetologyGradeBookRepository());
                                                                   
            var studentGradeBookSummary = gradeBookRepository.GetStudentCosmetologyGradeBookSummaryReport(1);

            Assert.IsNotNull(studentGradeBookSummary);
            Assert.IsNotNull(studentGradeBookSummary.StudentName);
            Assert.IsNotNull(studentGradeBookSummary.CosmetologyGradeBookSummaries);
            Assert.IsTrue(studentGradeBookSummary.CosmetologyGradeBookSummaries.Count > 0);
        }

        [TestMethod]
        public void Verify_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookSummaryReport_Returns_Empty_Data_Against_Invalid_Db_Student()
        {
            ICosmetologyGradeBookRepository gradeBookRepository = new SqlCosmetologyGradeBookRepository();
            var studentGradeBookSummary = gradeBookRepository.GetStudentCosmetologyGradeBookSummaryReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentGradeBookSummary);
            Assert.IsNull(studentGradeBookSummary.StudentName);
            Assert.IsNotNull(studentGradeBookSummary.CosmetologyGradeBookSummaries);
            Assert.IsTrue(studentGradeBookSummary.CosmetologyGradeBookSummaries.Count == 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookService_GetStudentCosmetologyGradeBookSummaryReport_Returns_Empty_Data_Against_Invalid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookRepository = new CosmetologyGradeBookService();
            var studentGradeBookSummary = gradeBookRepository.GetStudentCosmetologyGradeBookSummaryReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentGradeBookSummary);
            Assert.IsNull(studentGradeBookSummary.StudentName);
            Assert.IsNotNull(studentGradeBookSummary.CosmetologyGradeBookSummaries);
            Assert.IsTrue(studentGradeBookSummary.CosmetologyGradeBookSummaries.Count == 0);
        }

        [TestMethod]
        public void Verify_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookTestReport_Returns_Data_Against_Valid_Db_Student()
        {
            ICosmetologyGradeBookRepository gradeBookRepository = new SqlCosmetologyGradeBookRepository();
            var studentGradeBookTest = gradeBookRepository.GetStudentCosmetologyGradeBookTestReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentGradeBookTest);
            Assert.IsNotNull(studentGradeBookTest.StudentName);
            Assert.IsNotNull(studentGradeBookTest.CosmetologyGradeBookTests);
            Assert.IsTrue(studentGradeBookTest.CosmetologyGradeBookTests.Count > 0);            
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookService_GetStudentCosmetologyGradeBookTestReport_Returns_Data_Against_Valid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookRepository = new CosmetologyGradeBookService();
            var studentGradeBookTest = gradeBookRepository.GetStudentCosmetologyGradeBookTestReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentGradeBookTest);
            Assert.IsNotNull(studentGradeBookTest.StudentName);
            Assert.IsNotNull(studentGradeBookTest.CosmetologyGradeBookTests);
            Assert.IsTrue(studentGradeBookTest.CosmetologyGradeBookTests.Count > 0);
        }

        [TestMethod]
        public void Verify_TestCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookTestReport_Returns_Data_Against_Test_Student()
        {
            ICosmetologyGradeBookRepository gradeBookRepository = new TestCosmetologyGradeBookRepository();
            var studentGradeBookTest = gradeBookRepository.GetStudentCosmetologyGradeBookTestReport(1);

            Assert.IsNotNull(studentGradeBookTest);
            Assert.IsNotNull(studentGradeBookTest.StudentName);
            Assert.IsNotNull(studentGradeBookTest.CosmetologyGradeBookTests);
            Assert.IsTrue(studentGradeBookTest.CosmetologyGradeBookTests.Count > 0);
        }

        [TestMethod]
        public void Verify_TestCosmetologyGradeBookService_GetStudentCosmetologyGradeBookTestReport_Returns_Data_Against_Test_Student()
        {
            ICosmetologyGradeBookService gradeBookRepository = new CosmetologyGradeBookService(new TestCosmetologyGradeBookRepository());
            var studentGradeBookTest = gradeBookRepository.GetStudentCosmetologyGradeBookTestReport(1);

            Assert.IsNotNull(studentGradeBookTest);
            Assert.IsNotNull(studentGradeBookTest.StudentName);
            Assert.IsNotNull(studentGradeBookTest.CosmetologyGradeBookTests);
            Assert.IsTrue(studentGradeBookTest.CosmetologyGradeBookTests.Count > 0);
        }

        [TestMethod]
        public void Verify_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookTestReport_Returns_Empty_Data_Against_Invalid_Db_Student()
        {
            ICosmetologyGradeBookRepository gradeBookRepository = new SqlCosmetologyGradeBookRepository();
            var studentGradeBookTest = gradeBookRepository.GetStudentCosmetologyGradeBookTestReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentGradeBookTest);
            Assert.IsNull(studentGradeBookTest.StudentName);
            Assert.IsNotNull(studentGradeBookTest.CosmetologyGradeBookTests);
            Assert.IsTrue(studentGradeBookTest.CosmetologyGradeBookTests.Count == 0);            
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookService_GetStudentCosmetologyGradeBookTestReport_Returns_Empty_Data_Against_Invalid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookRepository = new CosmetologyGradeBookService();
            var studentGradeBookTest = gradeBookRepository.GetStudentCosmetologyGradeBookTestReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentGradeBookTest);
            Assert.IsNull(studentGradeBookTest.StudentName);
            Assert.IsNotNull(studentGradeBookTest.CosmetologyGradeBookTests);
            Assert.IsTrue(studentGradeBookTest.CosmetologyGradeBookTests.Count == 0);
        }

        [TestMethod]
        public void Verify_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookLabReport_Returns_Data_Against_Valid_Db_Student()
        {
            ICosmetologyGradeBookRepository gradeBookRepository = new SqlCosmetologyGradeBookRepository();
            var studentGradeBookLab = gradeBookRepository.GetStudentCosmetologyGradeBookLabReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentGradeBookLab);
            Assert.IsNotNull(studentGradeBookLab.StudentName);
            Assert.IsNotNull(studentGradeBookLab.CosmetologyGradeBookLabs);
            Assert.IsTrue(studentGradeBookLab.CosmetologyGradeBookLabs.Count > 0);                 
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookService_GetStudentCosmetologyGradeBookLabReport_Returns_Data_Against_Valid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookRepository = new CosmetologyGradeBookService();
            var studentGradeBookLab = gradeBookRepository.GetStudentCosmetologyGradeBookLabReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentGradeBookLab);
            Assert.IsNotNull(studentGradeBookLab.StudentName);
            Assert.IsNotNull(studentGradeBookLab.CosmetologyGradeBookLabs);
            Assert.IsTrue(studentGradeBookLab.CosmetologyGradeBookLabs.Count > 0);
        }

        [TestMethod]
        public void Verify_TestCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookLabReport_Returns_Data_Against_Test_Student()
        {
            ICosmetologyGradeBookRepository gradeBookRepository = new TestCosmetologyGradeBookRepository();
            var studentGradeBookLab = gradeBookRepository.GetStudentCosmetologyGradeBookLabReport(1);

            Assert.IsNotNull(studentGradeBookLab);
            Assert.IsNotNull(studentGradeBookLab.StudentName);
            Assert.IsNotNull(studentGradeBookLab.CosmetologyGradeBookLabs);
            Assert.IsTrue(studentGradeBookLab.CosmetologyGradeBookLabs.Count > 0);
        }

        [TestMethod]
        public void Verify_TestCosmetologyGradeBookService_GetStudentCosmetologyGradeBookLabReport_Returns_Data_Against_Test_Student()
        {
            ICosmetologyGradeBookService gradeBookRepository = new CosmetologyGradeBookService(new TestCosmetologyGradeBookRepository());
            var studentGradeBookLab = gradeBookRepository.GetStudentCosmetologyGradeBookLabReport(1);

            Assert.IsNotNull(studentGradeBookLab);
            Assert.IsNotNull(studentGradeBookLab.StudentName);
            Assert.IsNotNull(studentGradeBookLab.CosmetologyGradeBookLabs);
            Assert.IsTrue(studentGradeBookLab.CosmetologyGradeBookLabs.Count > 0);
        }

        [TestMethod]
        public void Verify_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookLabReport_Returns_Empty_Data_Against_Invalid_Db_Student()
        {
            ICosmetologyGradeBookRepository gradeBookRepository = new SqlCosmetologyGradeBookRepository();
            var studentGradeBookLab = gradeBookRepository.GetStudentCosmetologyGradeBookLabReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentGradeBookLab);
            Assert.IsNull(studentGradeBookLab.StudentName);
            Assert.IsNotNull(studentGradeBookLab.CosmetologyGradeBookLabs);
            Assert.IsTrue(studentGradeBookLab.CosmetologyGradeBookLabs.Count == 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookService_GetStudentCosmetologyGradeBookLabReport_Returns_Empty_Data_Against_Invalid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookRepository = new CosmetologyGradeBookService();
            var studentGradeBookLab = gradeBookRepository.GetStudentCosmetologyGradeBookLabReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentGradeBookLab);
            Assert.IsNull(studentGradeBookLab.StudentName);
            Assert.IsNotNull(studentGradeBookLab.CosmetologyGradeBookLabs);
            Assert.IsTrue(studentGradeBookLab.CosmetologyGradeBookLabs.Count == 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookRepository_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookSummaryReport_Returns_Data_Against_Valid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookService = new CosmetologyGradeBookService(new SqlCosmetologyGradeBookRepository());
            var studentGradeBookSummary = gradeBookService.GetStudentCosmetologyGradeBookSummaryReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentGradeBookSummary);
            Assert.IsNotNull(studentGradeBookSummary.StudentName);
            Assert.IsNotNull(studentGradeBookSummary.CosmetologyGradeBookSummaries);
            Assert.IsTrue(studentGradeBookSummary.CosmetologyGradeBookSummaries.Count > 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookRepository_TestCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookSummaryReport_Returns_Data_Against_Test_Student()
        {
            ICosmetologyGradeBookService gradeBookService = new CosmetologyGradeBookService(new TestCosmetologyGradeBookRepository());
            var studentGradeBookSummary = gradeBookService.GetStudentCosmetologyGradeBookSummaryReport(1);

            Assert.IsNotNull(studentGradeBookSummary);
            Assert.IsNotNull(studentGradeBookSummary.StudentName);
            Assert.IsNotNull(studentGradeBookSummary.CosmetologyGradeBookSummaries);
            Assert.IsTrue(studentGradeBookSummary.CosmetologyGradeBookSummaries.Count > 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookRepository_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookSummaryReport_Returns_Empty_Data_Against_Invalid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookService = new CosmetologyGradeBookService(new SqlCosmetologyGradeBookRepository());
            var studentGradeBookSummary = gradeBookService.GetStudentCosmetologyGradeBookSummaryReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentGradeBookSummary);
            Assert.IsNull(studentGradeBookSummary.StudentName);
            Assert.IsNotNull(studentGradeBookSummary.CosmetologyGradeBookSummaries);
            Assert.IsTrue(studentGradeBookSummary.CosmetologyGradeBookSummaries.Count == 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookRepository_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookTestReport_Returns_Data_Against_Valid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookService = new CosmetologyGradeBookService(new SqlCosmetologyGradeBookRepository());
            var studentGradeBookTest = gradeBookService.GetStudentCosmetologyGradeBookTestReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentGradeBookTest);
            Assert.IsNotNull(studentGradeBookTest.StudentName);
            Assert.IsNotNull(studentGradeBookTest.CosmetologyGradeBookTests);
            Assert.IsTrue(studentGradeBookTest.CosmetologyGradeBookTests.Count > 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookRepository_TestCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookTestReport_Returns_Data_Against_Test_Student()
        {
            ICosmetologyGradeBookService gradeBookService = new CosmetologyGradeBookService(new TestCosmetologyGradeBookRepository());
            var studentGradeBookTest = gradeBookService.GetStudentCosmetologyGradeBookTestReport(1);

            Assert.IsNotNull(studentGradeBookTest);
            Assert.IsNotNull(studentGradeBookTest.StudentName);
            Assert.IsNotNull(studentGradeBookTest.CosmetologyGradeBookTests);
            Assert.IsTrue(studentGradeBookTest.CosmetologyGradeBookTests.Count > 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookRepository_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookTestReport_Returns_Empty_Data_Against_Invalid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookService = new CosmetologyGradeBookService(new SqlCosmetologyGradeBookRepository());
            var studentGradeBookTest = gradeBookService.GetStudentCosmetologyGradeBookTestReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentGradeBookTest);
            Assert.IsNull(studentGradeBookTest.StudentName);
            Assert.IsNotNull(studentGradeBookTest.CosmetologyGradeBookTests);
            Assert.IsTrue(studentGradeBookTest.CosmetologyGradeBookTests.Count == 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookRepository_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookLabReport_Returns_Data_Against_Valid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookService = new CosmetologyGradeBookService(new SqlCosmetologyGradeBookRepository());
            var studentGradeBookLab = gradeBookService.GetStudentCosmetologyGradeBookLabReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentGradeBookLab);
            Assert.IsNotNull(studentGradeBookLab.StudentName);
            Assert.IsNotNull(studentGradeBookLab.CosmetologyGradeBookLabs);
            Assert.IsTrue(studentGradeBookLab.CosmetologyGradeBookLabs.Count > 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookRepository_TestCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookLabReport_Returns_Data_Against_Test_Student()
        {
            ICosmetologyGradeBookService gradeBookService = new CosmetologyGradeBookService(new TestCosmetologyGradeBookRepository());
            var studentGradeBookLab = gradeBookService.GetStudentCosmetologyGradeBookLabReport(1);

            Assert.IsNotNull(studentGradeBookLab);
            Assert.IsNotNull(studentGradeBookLab.StudentName);
            Assert.IsNotNull(studentGradeBookLab.CosmetologyGradeBookLabs);
            Assert.IsTrue(studentGradeBookLab.CosmetologyGradeBookLabs.Count > 0);
        }

        [TestMethod]
        public void Verify_CosmetologyGradeBookRepository_SqlCosmetologyGradeBookRepository_GetStudentCosmetologyGradeBookLabReport_Returns_Empty_Data_Against_Invalid_Db_Student()
        {
            ICosmetologyGradeBookService gradeBookService = new CosmetologyGradeBookService(new SqlCosmetologyGradeBookRepository());
            var studentGradeBookLab = gradeBookService.GetStudentCosmetologyGradeBookLabReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentGradeBookLab);
            Assert.IsNull(studentGradeBookLab.StudentName);
            Assert.IsNotNull(studentGradeBookLab.CosmetologyGradeBookLabs);
            Assert.IsTrue(studentGradeBookLab.CosmetologyGradeBookLabs.Count == 0);
        }
    }
}
