using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DiamondD.Web.Controllers;
using System.Web.Mvc;

namespace DiamondD.Web.Tests.Controllers
{
    /// <summary>
    /// Summary description for LoginControllerTest
    /// </summary>
    [TestClass]
    public class UserControllerTest
    {
        public UserControllerTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        [TestMethod]
        public void Check_If_Login_View_Page_Exists()
        {
            // Arrange
            UserController controller = new UserController();

            // Act
            ViewResult result = controller.Login() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }


        //[TestMethod]
        //public void Check_If_Home_View_Page_Exists()
        //{
        //    // Arrange
        //    UserController controller = new UserController();

            
        //    // Act
        //    ViewResult result = controller.Home() as ViewResult;

        //    // Assert
        //    Assert.IsNotNull(result);
        //}

        //[TestMethod]
        //public void Check_If_AdminSettings_View_Page_Exists()
        //{
        //    // Arrange
        //    UserController controller = new UserController();

        //    // Act
        //    ViewResult result = controller.AdminSettings() as ViewResult;

        //    // Assert
        //    Assert.IsNotNull(result);
        //}

        //[TestMethod]
        //public void Check_If_AskSecretQuestion_View_Page_Exists()
        //{
        //    // Arrange
        //    UserController controller = new UserController();

        //    // Act
        //    ViewResult result = controller.AskSecretQuestion() as ViewResult;

        //    // Assert
        //    Assert.IsNotNull(result);
        //}

        [TestMethod]
        public void Check_If_Register_View_Page_Exists()
        {
            // Arrange
            UserController controller = new UserController();

            // Act
            ViewResult result = controller.Register() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        //[TestMethod]
        //public void Check_If_ResendActivateAccount_View_Page_Exists()
        //{
        //    // Arrange
        //    UserController controller = new UserController();

        //    // Act
        //    ViewResult result = controller.ResendActivateAccount() as ViewResult;

        //    // Assert
        //    Assert.IsNotNull(result);
        //}

        [TestMethod]
        public void Check_If_ResetPassword_View_Page_Exists()
        {
            // Arrange
            UserController controller = new UserController();

            // Act
            ViewResult result = controller.ResetPassword() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        //[TestMethod]
        //public void Check_If_Rights_View_Page_Exists()
        //{
        //    // Arrange
        //    UserController controller = new UserController();

        //    // Act
        //    ViewResult result = controller.Rights() as ViewResult;

        //    // Assert
        //    Assert.IsNotNull(result);
        //}

        //[TestMethod]
        //public void Check_If_UserSettings_View_Page_Exists()
        //{
        //    // Arrange
        //    UserController controller = new UserController();

        //    // Act
        //    ViewResult result = controller.UserSettings() as ViewResult;

        //    // Assert
        //    Assert.IsNotNull(result);
        //}
    }
}
