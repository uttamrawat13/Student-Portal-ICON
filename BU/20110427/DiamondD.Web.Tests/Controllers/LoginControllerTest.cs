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
    public class LoginControllerTest
    {
        public LoginControllerTest()
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

    }
}
