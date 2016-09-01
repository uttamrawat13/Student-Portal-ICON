using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Ledger;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DiamondD.Web.Tests.ReportsTest
{
    [TestClass]
    public class LedgerTest
    {
        [TestMethod]
        public void Verify_SqlLedgerRepository_GetLedgerReport_Returns_Data_Against_Valid_DbStudent()
        {
            ILedgerRepository ledgerRepository = new SqlLedgerRepository();
            var studentLedger = ledgerRepository.GetLedgerReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentLedger);
            Assert.IsNotNull(studentLedger.StudentName);
            Assert.IsNotNull(studentLedger.ledgerList);
            Assert.IsTrue(studentLedger.ledgerList.Count > 0);
        }

        [TestMethod]
        public void Verify_SqlLedgerService_GetLedgerReport_Returns_Data_Against_Valid_DbStudent()
        {
            ILedgerService ledgerRepository = new LedgerService();
            var studentLedger = ledgerRepository.GetLedgerReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentLedger);
            Assert.IsNotNull(studentLedger.StudentName);
            Assert.IsNotNull(studentLedger.ledgerList);
            Assert.IsTrue(studentLedger.ledgerList.Count > 0);
        }

        [TestMethod]
        public void Verify_TestLedgerRepository_GetLedgerReport_Returns_Data_Against_TestStudent()
        {
            ILedgerRepository ledgerRepository = new TestLedgerRepository();
            var studentLedger = ledgerRepository.GetLedgerReport(1);

            Assert.IsNotNull(studentLedger);
            Assert.IsNotNull(studentLedger.StudentName);
            Assert.IsNotNull(studentLedger.ledgerList);
            Assert.IsTrue(studentLedger.ledgerList.Count > 0);
        }



        [TestMethod]
        public void Verify_LedgerService_SqlLedgerRepository_GetLedgerReport_Returns_Data_Against_Valid_DbStudent()
        {
            ILedgerService ledgerService = new LedgerService(new SqlLedgerRepository());
            var studentLedger = ledgerService.GetLedgerReport(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentLedger);
            Assert.IsNotNull(studentLedger.StudentName);
            Assert.IsNotNull(studentLedger.ledgerList);
            Assert.IsTrue(studentLedger.ledgerList.Count > 0);
        }

        [TestMethod]
        public void Verify_LedgerService_TestLedgerRepository_GetLedgerReport_Returns_Data_Against_TestStudent()
        {
            ILedgerService ledgerService = new LedgerService(new TestLedgerRepository());
            var studentLedger = ledgerService.GetLedgerReport(1);

            Assert.IsNotNull(studentLedger);
            Assert.IsNotNull(studentLedger.StudentName);
            Assert.IsNotNull(studentLedger.ledgerList);
            Assert.IsTrue(studentLedger.ledgerList.Count > 0);
        }
        
        [TestMethod]
        public void Verify_SqlLedgerRepository_GetLedgerReport_Returns_Empty_Data_Against_InValid_DbStudent()
        {
            ILedgerRepository ledgerRepository = new SqlLedgerRepository();
            var studentLedger = ledgerRepository.GetLedgerReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentLedger);
            Assert.IsNull(studentLedger.StudentName);
            Assert.IsNotNull(studentLedger.ledgerList);
            Assert.IsTrue(studentLedger.ledgerList.Count == 0);
        }

        [TestMethod]
        public void Verify_LedgerService_SqlLedgerRepository_GetLedgerReport_Returns_Empty_Data_Against_InValid_DbStudent()
        {
            ILedgerService ledgerService = new LedgerService(new SqlLedgerRepository());
            var studentLedger = ledgerService.GetLedgerReport(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentLedger);
            Assert.IsNull(studentLedger.StudentName);
            Assert.IsNotNull(studentLedger.ledgerList);
            Assert.IsTrue(studentLedger.ledgerList.Count == 0);
        }

    }
}
