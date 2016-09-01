using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Report;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DiamondD.Web.Tests.ReportsTest
{
    [TestClass]
    public class Student1098_TReportTest
    {
        [TestMethod]
        public void Verify_Sql1098_TReportRepository_Get1098_TReport_Returns_Data_Against_Valid_DbStudent()
        {
            IGetStudentReports student1098_TReportRepository = new SqlGetStudentReports();
            var student1098_TReport = student1098_TReportRepository.GetStudent1098TPdf(TestConstants.DbStudentUserId);

            Assert.IsNotNull(student1098_TReport);
            Assert.IsNotNull(student1098_TReport.PdfData);
        }

        [TestMethod]
        public void Verify_SqlStudent1098_TReportTestService_GetStudent1098_TReportTestReport_Returns_Data_Against_Valid_DbStudent()
        {
            IGetStudent1098TReportService student1098_TReport = new GetStudent1098TReportService();
            var student1098_T = student1098_TReport.GetStudent1098TPDF(TestConstants.DbStudentUserId);

            Assert.IsNotNull(student1098_T);
            Assert.IsNotNull(student1098_T.PdfData);
        }
        [TestMethod]
        public void Verify_TestStudent1098_TReportRepository_GetStudent1098_TReportTestReport_Returns_Data_Against_TestStudent()
        {
            IGetStudentReports student1098_TReport = new TestStudent1098TReportRepository();
            var student1098_T = student1098_TReport.GetStudent1098TPdf(1);

            Assert.IsNotNull(student1098_T);
            Assert.IsNotNull(student1098_T.StudentNo);
            Assert.IsNotNull(student1098_T.PdfData);
        }

        [TestMethod]
        public void Verify_TestStudent1098_TReportService_SqlStudent1098_TReportRepository_GetStudent1098_TReport_Returns_Data_Against_Valid_DbStudent()
        {
            IGetStudent1098TReportService student1098_TReport = new GetStudent1098TReportService(new SqlGetStudentReports());
            var student1098_T = student1098_TReport.GetStudent1098TPDF(TestConstants.DbStudentUserId);

            Assert.IsNotNull(student1098_T);
            Assert.IsNotNull(student1098_T.PdfData);
            Assert.IsNotNull(student1098_T.StudentNo);
        }


        [TestMethod]
        public void Verify_Student1098_TReportService_TestStudent1098_TReportRepository_GetStudent1098_TReportReport_Returns_Data_Against_TestStudent()
        {
            IGetStudent1098TReportService student1098_TReport = new GetStudent1098TReportService(new TestStudent1098TReportRepository());
            var student1098_T = student1098_TReport.GetStudent1098TPDF(TestConstants.DbStudentUserId);

            Assert.IsNotNull(student1098_T);
            Assert.IsNotNull(student1098_T.PdfData);
            Assert.IsNotNull(student1098_T.StudentNo);
        }

        [TestMethod]
        public void Verify_SqlStudent1098_TReportRepository_GetStudent1098_TReportReport_Returns_Empty_Data_Against_InValid_DbStudent()
        {
            IGetStudentReports student1098_TReportRepository = new SqlGetStudentReports();
            var student1098_TReport = student1098_TReportRepository.GetStudent1098TPdf(TestConstants.InvalidUserId);

            Assert.IsNull(student1098_TReport.PdfData);
        }

        [TestMethod]
        public void Verify_SqlStudent1098_TReportTestService_GetStudent1098_TReportTestReport_Returns_Data_Against_InValid_DbStudent()
        {
            IGetStudent1098TReportService student1098_TReport = new GetStudent1098TReportService();
            var student1098_T = student1098_TReport.GetStudent1098TPDF(TestConstants.InvalidUserId);

            Assert.IsNull(student1098_T.PdfData);
        }
    }
}
