using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.User;
using DiamondD.Services.Common;
using DiamondD.Services.User;
using DiamondD.Web.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;


namespace DiamondD.Web.Tests.User_Tests
{
    [TestClass]
    public class UserTests
    {
        [TestMethod]
        public void Check_If_User_Is_Valid()
        {
            // @TODO: Need to mock Request, Response in order to make such tests work!

            // Arrange
            UserController controller = new UserController();

            FormCollection collection = new FormCollection();

            collection.Add("userName", "admin");
            collection.Add("password", "admin");
            
            //Act 
            // ActionResult result = controller.Authenticate(collection) as ActionResult;
            // Requires mock HTTP requests.

            //Assert
            //Assert.IsNotNull(result);

        }

        [TestMethod]
        public void Check_If_WebUserService_VerifyCredentials_Returns_True_For_A_Valid_Db_User()
        {
            // Arrange
            IWebUserService wuService = new WebUserService();            

            //Assert
            Assert.IsNotNull(wuService.VerifyCredentials(TestConstants.DbStudentUserName, TestConstants.DbStudentPassword));
        }

        [TestMethod]
        public void Check_If_WebUserService_VerifyCredentials_Returns_False_For_An_InValid_Db_User()
        {
            // Arrange
            IWebUserService wuService = new WebUserService();

            //Assert
            Assert.IsNull(wuService.VerifyCredentials("blank", "blank"));
        }

        [TestMethod]
        public void Check_If_WebUserService_VerifyCredentials_Returns_True_For_A_Valid_Test_User()
        {
            // Arrange
            IWebUserService wuService = new WebUserService(new TestWebUserRepository(), new TestLogService());

            //Assert
            Assert.IsNotNull(wuService.VerifyCredentials("alex", "wonderland"));
        }

        [TestMethod]
        public void Check_If_WebUserService_VerifyCredentials_Returns_False_For_An_InValid_Test_User()
        {
            // Arrange
            IWebUserService wuService = new WebUserService(new TestWebUserRepository(), new TestLogService());

            //Assert
            Assert.IsNull(wuService.VerifyCredentials("nouser", "nopassword"));
        }
        [TestMethod]
        public void Check_If_Student_is_Registered_Successfully_via_SqlWebUserRepository()
        {
            var webUserInfo = new WebUser();
            webUserInfo.StudentId = "TEMP 1";
            webUserInfo.AccountStatus = "InActive";
            webUserInfo.SecretAnswer = "I am student.";
            webUserInfo.SecretQuestion = "Who am I?";
            webUserInfo.Email = "user1@abc.com";
            webUserInfo.WebUserId = Convert.ToInt32(Int32.MaxValue-1);
            webUserInfo.UserName = "user1";
            webUserInfo.WebPassword = "demo1";

            IWebUserRepository webUserService = new SqlWebUserRepository();
            bool isRegistered = webUserService.Register(webUserInfo);

            Assert.IsTrue(isRegistered);
        }

        [TestMethod]
        public void Check_If_Student_is_Registered_Successfully_via_WebUserService()
        {
            var  webUserInfo = new WebUser();
            webUserInfo.StudentId = "Temp 2";
            webUserInfo.AccountStatus = "InActive";
            webUserInfo.SecretAnswer = "I am student.";
            webUserInfo.SecretQuestion = "Who am I?";
            webUserInfo.Email = "user2@abc.com";
            webUserInfo.WebUserId = Convert.ToInt32(Int32.MaxValue);
            webUserInfo.UserName = "user2";
            webUserInfo.WebPassword = "demo2";

            IWebUserService webUserService = new WebUserService();
            bool isRegistered = webUserService.Register(webUserInfo);

            Assert.IsTrue(isRegistered);
        }

        [TestMethod]
        public void Check_If_TestWebUserRepository_Returns_Correct_Role_Against_A_Test_User()
        {
            // Arrange
            IWebUserRepository _Repository = new TestWebUserRepository();

            //Act 
            var userInfo = _Repository.GetUserInfo(1);

            //Assert
            Assert.AreEqual("Student", userInfo.Role);
        }

        [TestMethod]
        public void Check_If_SqlUserRepository_Returns_Correct_Role_Against_A_Valid_Db_User()
        {
            // Arrange
            IWebUserRepository _Repository = new SqlWebUserRepository();

            //Act 
            var studentUserInfo = _Repository.GetUserInfo(TestConstants.DbStudentUserId);
            var adminUserInfo = _Repository.GetUserInfo(TestConstants.DbAdminUserId);

            //Assert
            Assert.AreEqual("Student", studentUserInfo.Role);
            Assert.AreEqual("Admin", adminUserInfo.Role);
        }

        [TestMethod]
        public void Check_If_TestWebUserService_Returns_Correct_Role_Against_TestWebUserRepository()
        {
            // Arrange
            IWebUserRepository userRepository = new TestWebUserRepository();
            var testLogService = new TestLogService();
            IWebUserService _Repository = new WebUserService(userRepository, testLogService);

            //Act 
            var studentUserInfo = _Repository.GetUserInfo(1);
            var adminUserInfo = _Repository.GetUserInfo(3);

            //Assert
            Assert.AreEqual("Student", studentUserInfo.Role);
            Assert.AreEqual("Admin", adminUserInfo.Role);
        }

        [TestMethod]
        public void Check_If_WebUserService_Returns_Correct_Role_Against_SqlWebUserRepository()
        {
            // Arrange
            IWebUserRepository userRepository = new SqlWebUserRepository();
            var testLogService = new TestLogService();
            IWebUserService _Repository = new WebUserService(userRepository, testLogService);

            //Act 
            var studentUserInfo = _Repository.GetUserInfo(TestConstants.DbStudentUserId);
            var adminUserInfo = _Repository.GetUserInfo(TestConstants.DbAdminUserId);

            //Assert
            Assert.AreEqual("Student", studentUserInfo.Role);
            Assert.AreEqual("Admin", adminUserInfo.Role);
        }

        [TestMethod]
        public void Check_If_TestWebUserRepository_Returns_Role_Rights_Against_A_Test_User()
        {
            // Arrange
            IWebUserRepository _Repository = new TestWebUserRepository();

            //Act 
            var userInfo = _Repository.GetUserInfo(1);

            //Assert
            Assert.IsNotNull(userInfo.VisibleReports);
        }

        [TestMethod]
        public void Check_If_SqlUserRepository_Returns_Role_Rights_Against_A_Valid_Db_User()
        {
            // Arrange
            IWebUserRepository _Repository = new SqlWebUserRepository();

            //Act 
            var userInfo = _Repository.GetUserInfo(TestConstants.DbStudentUserId);

            //Assert
            Assert.IsNotNull(userInfo.VisibleReports);
        }

        [TestMethod]
        public void Check_If_TestWebUserService_Returns_Role_Rights_Against_TestWebUserRepository()
        {
            // Arrange
            IWebUserRepository userRepository = new TestWebUserRepository();
            var testLogService = new TestLogService();
            IWebUserService _Repository = new WebUserService(userRepository, testLogService);

            //Act 
            var studentUserInfo = _Repository.GetUserInfo(1);
            var adminUserInfo = _Repository.GetUserInfo(3);

            //Assert
            Assert.AreEqual("Student", studentUserInfo.Role);
            Assert.AreEqual("Admin", adminUserInfo.Role);
        }

        [TestMethod]
        public void Check_If_WebUserService_Returns_Role_Rights_Against_SqlWebUserRepository()
        {
            // Arrange
            IWebUserRepository userRepository = new SqlWebUserRepository();
            var testLogService = new TestLogService();
            IWebUserService _Repository = new WebUserService(userRepository, testLogService);

            //Act 
            var studentUserInfo = _Repository.GetUserInfo(TestConstants.DbStudentUserId);
            var adminUserInfo = _Repository.GetUserInfo(TestConstants.DbAdminUserId);

            //Assert
            Assert.AreEqual("Student", studentUserInfo.Role);
            Assert.AreEqual("Admin", adminUserInfo.Role);
        }
    }
}
