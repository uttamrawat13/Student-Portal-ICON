using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DiamondD.Data.DataAccess.StudentReportStatus;
using DiamondD.Services.StudentReportStatua;

namespace DiamondD.Web.Tests.ReportsTest
{
    /// <summary>
    /// Summary description for UnitTest1
    /// </summary>
    [TestClass]
    public class StudentReportStatusTest
    {
        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test 
        // [TestInitialize()]
        // public void MyTestInitialize() { }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        [TestMethod]
        public void Get_Student_Report_Status_From_Repository()
        {
            IWebReportStatusRepository reportStatus = new SqlReportStatusRepository();
            Assert.IsNotNull(reportStatus.GetStudentStatusReport());
        }

        public void Get_Student_Report_Status_From_Serivce()
        {
            IStudentReportStatusService reportStatus = new StudentReportStatusService();
            Assert.IsNotNull(reportStatus.GetStudentStatusReport());
        }
    }
}
