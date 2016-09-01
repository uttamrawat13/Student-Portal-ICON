using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.FinancialAid;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.FinancialAid;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DiamondD.Services;

namespace DiamondD.Web.Tests.ReportsTest
{
    [TestClass]
    public class FinancialAidAwardTest
    {
        [TestMethod]
        public void SqlFinancialAidRepository_GetAidAwards_Returns_Valid_Data_Against_a_Valid_DbUser()
        {
            IFinancialAidRepository aidRepository = new SqlFinancialAidRepository();
            var aidList = aidRepository.GetAidDetails(TestConstants.DbStudentUserId);

            Assert.IsNotNull(aidList.StudentName);
            Assert.IsNotNull(aidList.AidDetails);
            Assert.IsTrue(aidList.AidDetails.Count >= 0);


        }

        [TestMethod]
        public void TestFinancialAidRepository_GetAidAwards_Returns_Valid_Data_Against_a_Valid_TestUser()
        {
            IFinancialAidRepository aidRepository = new TestFinancialAidRepository();
            var aidList = aidRepository.GetAidDetails(1);

            Assert.IsNotNull(aidList.StudentName);
            Assert.IsNotNull(aidList.AidDetails);
            Assert.IsTrue(aidList.AidDetails.Count >= 0);

        }

        [TestMethod]
        public void SqlFinancialAidRepository_GetAidAwards_Returns_Correct_Response_Against_an_Invalid_DbUser()
        {
            IFinancialAidRepository aidRepository = new SqlFinancialAidRepository();
            var aidList = aidRepository.GetAidDetails(TestConstants.InvalidUserId);

            Assert.IsNull(aidList.StudentName);
            Assert.IsNotNull(aidList.AidDetails);
            Assert.IsTrue(aidList.AidDetails.Count == 0);
        }

        [TestMethod]
        public void TestFinancialAidRepository_GetAidAwards_Returns_Correct_Response_Against_an_Invalid_TestUser()
        {
            IFinancialAidRepository aidRepository = new SqlFinancialAidRepository();
            var aidList = aidRepository.GetAidDetails(-1);

            Assert.IsNull(aidList.StudentName);
            Assert.IsNotNull(aidList.AidDetails);
            Assert.IsTrue(aidList.AidDetails.Count == 0);
        }


        [TestMethod]
        public void FinancialAidService_SqlFinancialAidRepository_GetAidAwards_Returns_Valid_Data_Against_a_Valid_DbUser()
        {
            IFinancialAidService financialAidService = new FinancialAidService(new SqlFinancialAidRepository());
            var aidList = financialAidService.GetAidDetails(TestConstants.DbStudentUserId);

            Assert.IsNotNull(aidList.StudentName);
            Assert.IsNotNull(aidList.AidDetails.Count);
            Assert.IsTrue(aidList.AidDetails.Count >= 0);
        }

        [TestMethod]
        public void FinancialAidService_TestFinancialAidRepository_GetAidAwards_Returns_Valid_Data_Against_a_Valid_TestUser()
        {
            IFinancialAidService financialAidService = new FinancialAidService(new TestFinancialAidRepository());
            var aidList = financialAidService.GetAidDetails(1);

            Assert.IsNotNull(aidList.StudentName);
            Assert.IsNotNull(aidList.AidDetails.Count);
            Assert.IsTrue(aidList.AidDetails.Count >= 0);


            double totalAmount = 0.0;
            foreach (var kvp in aidList.AidDetails)
            {
                foreach (var list in kvp.Value)
                {
                    totalAmount += list.Amount;
                }
            }

        }

        [TestMethod]
        public void FinancialAidService_SqlFinancialAidRepository_GetAidAwards_Returns_Correct_Response_Against_an_Invalid_DbUser()
        {
            IFinancialAidService financialAidService = new FinancialAidService(new SqlFinancialAidRepository());
            var aidList = financialAidService.GetAidDetails(TestConstants.InvalidUserId);

            Assert.IsNull(aidList.StudentName);
            Assert.IsNotNull(aidList.AidDetails);
            Assert.IsTrue(aidList.AidDetails.Count == 0);
        }


        [TestMethod]
        public void FinancialAidService_TestFinancialAidRepository_GetAidAwards_Returns_Correct_Response_Against_an_Invalid_TestUser()
        {
            IFinancialAidService financialAidService = new FinancialAidService(new TestFinancialAidRepository());
            var aidList = financialAidService.GetAidDetails(-1);

            Assert.IsNull(aidList.StudentName);
            Assert.IsNotNull(aidList.AidDetails);
            Assert.IsTrue(aidList.AidDetails.Count == 0);
        }
    }
}
