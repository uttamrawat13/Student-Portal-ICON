using System;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DiamondD.Web;
using DiamondD.Web.Controllers;

namespace DiamondD.Web.Tests.Controllers
{

    [TestClass]
    public class AccountControllerTest
    {

        [TestMethod]
        public void Change_Password_Get_Returns_View()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.ChangePassword();

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
        }

        [TestMethod]
        public void Change_Password_Post_Redirects_On_Success()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            RedirectToRouteResult result = (RedirectToRouteResult)controller.ChangePassword("oldPass", "newPass", "newPass");

            // Assert
            Assert.AreEqual("ChangePasswordSuccess", result.RouteValues["action"]);
        }

        [TestMethod]
        public void Change_Password_Post_Returns_View_If_Current_Password_Not_Specified()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.ChangePassword("", "newPassword", "newPassword");

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("You must specify a current password.", result.ViewData.ModelState["currentPassword"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Change_Password_Post_Returns_View_If_New_Password_Does_Not_Match_Confirm_Password()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.ChangePassword("currentPassword", "newPassword", "otherPassword");

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("The new password and confirmation password do not match.", result.ViewData.ModelState["_FORM"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Change_Password_Post_Returns_View_If_New_Password_Is_Null()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.ChangePassword("currentPassword", null, null);

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("You must specify a new password of 6 or more characters.", result.ViewData.ModelState["newPassword"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Change_Password_Post_Returns_View_If_New_Password_Is_Too_Short()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.ChangePassword("currentPassword", "12345", "12345");

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("You must specify a new password of 6 or more characters.", result.ViewData.ModelState["newPassword"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Change_Password_Post_Returns_View_If_Provider_Rejects_Password()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.ChangePassword("oldPass", "badPass", "badPass");

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("The current password is incorrect or the new password is invalid.", result.ViewData.ModelState["_FORM"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Change_Password_Success()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.ChangePasswordSuccess();

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Constructor_Sets_Properties()
        {
            // Arrange
            IFormsAuthentication formsAuth = new MockFormsAuthenticationService();
            IMembershipService membershipService = new AccountMembershipService();

            // Act
            AccountController controller = new AccountController(formsAuth, membershipService);

            // Assert
            Assert.AreEqual(formsAuth, controller.FormsAuth, "FormsAuth property did not match.");
            Assert.AreEqual(membershipService, controller.MembershipService, "MembershipService property did not match.");
        }

        [TestMethod]
        public void Constructor_Sets_Properties_To_Default_Values()
        {
            // Act
            AccountController controller = new AccountController();

            // Assert
            Assert.IsNotNull(controller.FormsAuth, "FormsAuth property is null.");
            Assert.IsNotNull(controller.MembershipService, "MembershipService property is null.");
        }

        [TestMethod]
        public void Login_Get()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.LogOn();

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Login_Post_Redirects_Home_If_Login_Successful_But_No_Return_UrlGiven()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            RedirectToRouteResult result = (RedirectToRouteResult)controller.LogOn("someUser", "goodPass", true, null);

            // Assert
            Assert.AreEqual("Home", result.RouteValues["controller"]);
            Assert.AreEqual("Index", result.RouteValues["action"]);
        }

        [TestMethod]
        public void Login_Post_Redirects_To_Return_Url_If_Login_Successful_And_Return_Url_Given()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            RedirectResult result = (RedirectResult)controller.LogOn("someUser", "goodPass", false, "someUrl");

            // Assert
            Assert.AreEqual("someUrl", result.Url);
        }

        [TestMethod]
        public void Login_Post_Returns_View_If_Password_Not_Specified()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.LogOn("username", "", true, null);

            // Assert
            Assert.AreEqual("You must specify a password.", result.ViewData.ModelState["password"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Login_Post_Returns_View_If_Username_Not_Specified()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.LogOn("", "somePass", false, null);

            // Assert
            Assert.AreEqual("You must specify a username.", result.ViewData.ModelState["username"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Login_Post_Returns_View_If_Username_Or_Password_Is_Incorrect()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.LogOn("someUser", "badPass", true, null);

            // Assert
            Assert.AreEqual("The username or password provided is incorrect.", result.ViewData.ModelState["_FORM"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Log_Off()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            RedirectToRouteResult result = (RedirectToRouteResult)controller.LogOff();

            // Assert
            Assert.AreEqual("Home", result.RouteValues["controller"]);
            Assert.AreEqual("Index", result.RouteValues["action"]);
        }

        [TestMethod]
        public void Register_Get()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.Register();

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
        }

        [TestMethod]
        public void Register_Post_Redirects_Home_If_Registration_Successful()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            RedirectToRouteResult result = (RedirectToRouteResult)controller.Register("someUser", "email", "goodPass", "goodPass");

            // Assert
            Assert.AreEqual("Home", result.RouteValues["controller"]);
            Assert.AreEqual("Index", result.RouteValues["action"]);
        }

        [TestMethod]
        public void Register_Post_Returns_View_If_Email_Not_Specified()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.Register("username", "", "password", "password");

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("You must specify an email address.", result.ViewData.ModelState["email"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Register_Post_Returns_View_If_New_Password_Does_Not_Match_Confirm_Password()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.Register("username", "email", "password", "password2");

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("The new password and confirmation password do not match.", result.ViewData.ModelState["_FORM"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Register_Post_Returns_View_If_Password_Is_Null()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.Register("username", "email", null, null);

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("You must specify a password of 6 or more characters.", result.ViewData.ModelState["password"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Register_Post_Returns_View_If_Password_Is_TooS_hort()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.Register("username", "email", "12345", "12345");

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("You must specify a password of 6 or more characters.", result.ViewData.ModelState["password"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Register_Post_Returns_View_If_Registration_Fails()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.Register("someUser", "DuplicateUserName" /* error */, "badPass", "badPass");

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("Username already exists. Please enter a different user name.", result.ViewData.ModelState["_FORM"].Errors[0].ErrorMessage);
        }

        [TestMethod]
        public void Register_Post_Returns_View_If_Username_Not_Specified()
        {
            // Arrange
            AccountController controller = GetAccountController();

            // Act
            ViewResult result = (ViewResult)controller.Register("", "email", "password", "password");

            // Assert
            Assert.AreEqual(6, result.ViewData["PasswordLength"]);
            Assert.AreEqual("You must specify a username.", result.ViewData.ModelState["username"].Errors[0].ErrorMessage);
        }

        private static AccountController GetAccountController()
        {
            IFormsAuthentication formsAuth = new MockFormsAuthenticationService();
            MembershipProvider membershipProvider = new MockMembershipProvider();
            AccountMembershipService membershipService = new AccountMembershipService(membershipProvider);
            AccountController controller = new AccountController(formsAuth, membershipService);
            ControllerContext controllerContext = new ControllerContext(new MockHttpContext(), new RouteData(), controller);
            controller.ControllerContext = controllerContext;
            return controller;
        }

        public class MockFormsAuthenticationService : IFormsAuthentication
        {
            public void SignIn(string userName, bool createPersistentCookie)
            {
            }

            public void SignOut()
            {
            }
        }

        public class MockIdentity : IIdentity
        {
            public string AuthenticationType
            {
                get
                {
                    return "MockAuthentication";
                }
            }

            public bool IsAuthenticated
            {
                get
                {
                    return true;
                }
            }

            public string Name
            {
                get
                {
                    return "someUser";
                }
            }
        }

        public class MockPrincipal : IPrincipal
        {
            IIdentity _identity;

            public IIdentity Identity
            {
                get
                {
                    if (_identity == null)
                    {
                        _identity = new MockIdentity();
                    }
                    return _identity;
                }
            }

            public bool IsInRole(string role)
            {
                return false;
            }
        }

        public class MockMembershipUser : MembershipUser
        {
            public override bool ChangePassword(string oldPassword, string newPassword)
            {
                return newPassword.Equals("newPass");
            }
        }

        public class MockHttpContext : HttpContextBase
        {
            private IPrincipal _user;

            public override IPrincipal User
            {
                get
                {
                    if (_user == null)
                    {
                        _user = new MockPrincipal();
                    }
                    return _user;
                }
                set
                {
                    _user = value;
                }
            }
        }

        public class MockMembershipProvider : MembershipProvider
        {
            string _applicationName;

            public override string ApplicationName
            {
                get
                {
                    return _applicationName;
                }
                set
                {
                    _applicationName = value;
                }
            }

            public override bool EnablePasswordReset
            {
                get
                {
                    return false;
                }
            }

            public override bool EnablePasswordRetrieval
            {
                get
                {
                    return false;
                }
            }

            public override int MaxInvalidPasswordAttempts
            {
                get
                {
                    return 0;
                }
            }

            public override int MinRequiredNonAlphanumericCharacters
            {
                get
                {
                    return 0;
                }
            }

            public override int MinRequiredPasswordLength
            {
                get
                {
                    return 6;
                }
            }

            public override string Name
            {
                get
                {
                    return null;
                }
            }

            public override int PasswordAttemptWindow
            {
                get
                {
                    return 3;
                }
            }

            public override MembershipPasswordFormat PasswordFormat
            {
                get
                {
                    return MembershipPasswordFormat.Clear;
                }
            }

            public override string PasswordStrengthRegularExpression
            {
                get
                {
                    return null;
                }
            }

            public override bool RequiresQuestionAndAnswer
            {
                get
                {
                    return false;
                }
            }

            public override bool RequiresUniqueEmail
            {
                get
                {
                    return false;
                }
            }

            public override bool ChangePassword(string username, string oldPassword, string newPassword)
            {
                throw new NotImplementedException();
            }

            public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
            {
                throw new NotImplementedException();
            }

            public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, Object providerUserKey, out MembershipCreateStatus status)
            {
                MockMembershipUser user = new MockMembershipUser();

                if (username.Equals("someUser") && password.Equals("goodPass") && email.Equals("email"))
                {
                    status = MembershipCreateStatus.Success;
                }
                else
                {
                    // the 'email' parameter contains the status we want to return to the user
                    status = (MembershipCreateStatus)Enum.Parse(typeof(MembershipCreateStatus), email);
                }

                return user;
            }

            public override bool DeleteUser(string username, bool deleteAllRelatedData)
            {
                throw new NotImplementedException();
            }

            public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
            {
                throw new NotImplementedException();
            }

            public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
            {
                throw new NotImplementedException();
            }

            public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
            {
                throw new NotImplementedException();
            }

            public override int GetNumberOfUsersOnline()
            {
                throw new NotImplementedException();
            }

            public override string GetPassword(string username, string answer)
            {
                throw new NotImplementedException();
            }

            public override string GetUserNameByEmail(string email)
            {
                throw new NotImplementedException();
            }

            public override MembershipUser GetUser(Object providerUserKey, bool userIsOnline)
            {
                throw new NotImplementedException();
            }

            public override MembershipUser GetUser(string username, bool userIsOnline)
            {
                return new MockMembershipUser();
            }

            public override string ResetPassword(string username, string answer)
            {
                throw new NotImplementedException();
            }

            public override bool UnlockUser(string userName)
            {
                throw new NotImplementedException();
            }

            public override void UpdateUser(MembershipUser user)
            {
                throw new NotImplementedException();
            }

            public override bool ValidateUser(string username, string password)
            {
                return password.Equals("goodPass");
            }

        }
    }
}
