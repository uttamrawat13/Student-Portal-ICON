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
    /// Summary description for ReportControllerTest
    /// </summary>
    [TestClass]
    public class ReportControllerTest
    {
        public ReportControllerTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        [TestMethod]
        public void Check_If_Transcript_View_Page_Exists()
        {
            // Arrange
            ReportsController controller = new ReportsController();

            // Act
            ViewResult result = controller.Transcript() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        [TestMethod]
        public void Check_If_Student_Detail_View_Page_Exists()
        {
            // Arrange
            ReportsController controller = new ReportsController();

            // Act
            ViewResult result = controller.StudentDetail() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        [TestMethod]
        public void Check_If_Student_Grade_History_View_Page_Exists()
        {
            // Arrange
            ReportsController controller = new ReportsController();

            // Act
            ViewResult result = controller.GradeHistory() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        [TestMethod]
        public void Check_If_Student_Payment_Schedule_View_Page_Exists()
        {
            // Arrange
            ReportsController controller = new ReportsController();

            // Act
            ViewResult result = controller.PaymentSchedule() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        [TestMethod]
        public void Check_If_Student_Attendance_View_Page_Exists()
        {
            // Arrange
            ReportsController controller = new ReportsController();

            // Act
            ViewResult result = controller.AttendanceReview() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
    }
}
