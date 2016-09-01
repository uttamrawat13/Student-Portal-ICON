using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.User;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web.Mvc;
using DiamondD.Services.User;

namespace DiamondD.Web.Tests.User_Tests
{
    /// <summary>
    /// Summary description for UserSettingTests
    /// </summary>
    [TestClass]
    public class UserSettingTests
    {
        private const int DbStudentNo = 3889;
        public UserSettingTests()
        {
            //
            // TODO: Add constructor logic here
            //
        }

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
        public void Check_WebUser_information_Is_Successfully_get_From_SQL_Repository_For_A_Valid_Db_Student()
        {
            // Arrange
            IWebUserRepository _Repository = new SqlWebUserRepository();

            //Act 
            var userInfo = _Repository.GetUserInfo(DbStudentNo);

            //Assert
            Assert.IsNotNull(userInfo);
        }

        [TestMethod]
        public void Check_WebUser_information_Is_Successfully_get_From_Service_For_A_Valid_Db_Student()
        {
            // Arrange
            IWebUserService _Repository = new WebUserService();

            //Act 
            WebUser result = _Repository.GetUserInfo(DbStudentNo) as WebUser;

            //Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Change_Password_Successfully_In_SQL_Repository_For_A_Valid_Db_Student()
        {
            // Get old Password
            IWebUserService webUserService = new WebUserService();
            WebUser userInfo = webUserService.GetUserInfo(DbStudentNo);

            // Arrange
            IWebUserRepository _Repository = new SqlWebUserRepository();

            _Repository.UpdatePassword(DbStudentNo, "Test");
            
            // Get new password
            WebUser userInfoNew = webUserService.GetUserInfo(DbStudentNo);
            //Assert
            Assert.AreNotSame(userInfoNew.WebPassword, userInfo.WebPassword);

            // Revert
            _Repository.UpdatePassword(DbStudentNo, userInfo.WebPassword);
        }

        [TestMethod]
        public void Change_Password_Successfully_Service_For_A_Valid_Db_Student()
        {
            // Get old Password
            IWebUserService webUserService = new WebUserService();
            WebUser userInfo = webUserService.GetUserInfo(DbStudentNo);

            // Arrange
            IWebUserService _Repository = new WebUserService();

            _Repository.UpdatePassword(DbStudentNo, "Test");

            // Get new password
            WebUser userInfoNew = webUserService.GetUserInfo(DbStudentNo);
            //Assert
            Assert.AreNotSame(userInfoNew.WebPassword, userInfo.WebPassword);

            // Revert
            _Repository.UpdatePassword(DbStudentNo, userInfo.WebPassword);
        }

        [TestMethod]
        public void Change_Email_Successfully_In_SQL_Repository_For_A_Valid_Db_Student()
        {
            // Get old Password
            IWebUserService webUserService = new WebUserService();
            WebUser userInfo = webUserService.GetUserInfo(DbStudentNo);

            // Arrange
            IWebUserRepository _Repository = new SqlWebUserRepository();

            _Repository.UpdateEmail(DbStudentNo, "Test@test.com");

            // Get new password
            WebUser userInfoNew = webUserService.GetUserInfo(DbStudentNo);
            //Assert
            Assert.AreNotSame(userInfoNew.Email, userInfo.Email);

            // Revert
            _Repository.UpdateEmail(DbStudentNo, userInfo.Email);
        }

        [TestMethod]
        public void Change_Email_Successfully_In_Service_For_A_Valid_Db_Student()
        {
            // Get old Password
            IWebUserService webUserService = new WebUserService();
            WebUser userInfo = webUserService.GetUserInfo(DbStudentNo);

            // Arrange
            IWebUserService _Repository = new WebUserService();

            _Repository.UpdateEmail(DbStudentNo, "Test@test.com");

            // Get new password
            WebUser userInfoNew = webUserService.GetUserInfo(DbStudentNo);
            //Assert
            Assert.AreNotSame(userInfoNew.Email, userInfo.Email);

            // Revert
            _Repository.UpdateEmail(DbStudentNo, userInfo.Email);
        }

        [TestMethod]
        public void Change_Secret_Question_Answer_Successfully_In_SQL_Repository_For_A_Valid_Db_Student()
        {
            // Get old Password
            IWebUserService webUserService = new WebUserService();
            WebUser userInfo = webUserService.GetUserInfo(DbStudentNo);

            // Arrange
            IWebUserRepository _Repository = new SqlWebUserRepository();

            _Repository.UpdateSecretQuestionAnswer(DbStudentNo, "what your name?", "Test");

            // Get new password
            WebUser userInfoNew = webUserService.GetUserInfo(DbStudentNo);
            //Assert
            Assert.AreNotSame(userInfoNew.SecretQuestion, userInfo.SecretQuestion);
            Assert.AreNotSame(userInfoNew.SecretAnswer, userInfo.SecretAnswer);

            // Revert
            _Repository.UpdateSecretQuestionAnswer(DbStudentNo, userInfo.SecretQuestion, userInfo.SecretAnswer);
        }
    }
}
