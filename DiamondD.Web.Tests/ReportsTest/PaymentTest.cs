using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Payment;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DiamondD.Services.PaymentScheduleService;
namespace DiamondD.Web.Tests.ReportsTest
{
    /// <summary>
    /// Summary description for PaymentTest
    /// </summary>
    [TestClass]
    public class PaymentTest
    {
        public PaymentTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        [TestMethod]
        public void SqlPaymentRepository_Retruns_Payment_Schedule_Data_For_DbStudent()
        {
            IPaymentRepository paymentRepository = new SqlPaymentRepository();
            PaymentSchedule paySchedule = paymentRepository.GetPaymentSchedule(TestConstants.DbStudentUserId);

            Assert.IsNotNull(paySchedule);
            Assert.IsTrue(paySchedule.Payments.Count > 0);
            Assert.IsNotNull(paySchedule.StudentName);
        }

        [TestMethod]
        public void TestPaymentRepository_Retruns_Payment_Schedule_Data_For_TestStudent()
        {
            IPaymentRepository paymentRepository = new TestPaymentRepository();
            PaymentSchedule paySchedule = paymentRepository.GetPaymentSchedule(1);

            Assert.IsNotNull(paySchedule);
            Assert.IsTrue(paySchedule.Payments.Count > 0);
            Assert.IsNotNull(paySchedule.StudentName);
        }

        [TestMethod]
        public void PaymentService_SqlPaymentRepository_Retruns_Payment_Schedule_Data_For_DbStudent()
        {
            IPaymentService paymentService = new PaymentService();
            PaymentSchedule paySchedule = paymentService.GetPaymentSchedule(TestConstants.DbStudentUserId);

            Assert.IsNotNull(paySchedule);
            Assert.IsTrue(paySchedule.Payments.Count > 0);
            Assert.IsNotNull(paySchedule.StudentName);
        }

        [TestMethod]
        public void PaymentService_TestPaymentRepository_Retruns_Payment_Schedule_Data_For_TestStudent()
        {
            IPaymentService paymentService = new PaymentService(new TestPaymentRepository());
            PaymentSchedule paySchedule = paymentService.GetPaymentSchedule(1);

            Assert.IsNotNull(paySchedule);
            Assert.IsTrue(paySchedule.Payments.Count > 0);
            Assert.IsNotNull(paySchedule.StudentName);
        }

        [TestMethod]
        public void SqlPaymentRepository_Returns_Total_Amount_of_Payment_Schedule_For_DbStudent()
        {
            IPaymentRepository paymentRepository = new SqlPaymentRepository();
            PaymentSchedule paymentSchedule = paymentRepository.GetPaymentSchedule(TestConstants.DbStudentUserId);

            Assert.IsNotNull(paymentSchedule);
            Assert.IsTrue(paymentSchedule.Payments.Count > 0);
            Assert.IsNotNull(paymentSchedule.StudentName);

            double sumAmount = paymentSchedule.PaymentScheduleTotal;
            Assert.IsNotNull(sumAmount);
        }

        [TestMethod]
        public void TestPaymentRepository_Returns_Total_Amount_of_Payment_Schedule_For_TestStudent()
        {
            IPaymentRepository paymentRepository = new TestPaymentRepository();
            PaymentSchedule paymentSchedule = paymentRepository.GetPaymentSchedule(1);

            Assert.IsNotNull(paymentSchedule);
            Assert.IsTrue(paymentSchedule.Payments.Count > 0);
            Assert.IsNotNull(paymentSchedule.StudentName);

            double sumAmount = paymentSchedule.PaymentScheduleTotal;
            Assert.IsNotNull(sumAmount);
        }

        [TestMethod]
        public void PaymentService_Returns_Total_Amount_of_Payment_Schedule_For_DbStudent()
        {
            IPaymentService paymentService = new PaymentService();
            PaymentSchedule paymentSchedule = paymentService.GetPaymentSchedule(TestConstants.DbStudentUserId);

            Assert.IsNotNull(paymentSchedule);
            Assert.IsTrue(paymentSchedule.Payments.Count > 0);
            Assert.IsNotNull(paymentSchedule.StudentName);

            double sumAmount = paymentSchedule.PaymentScheduleTotal;
            Assert.IsNotNull(sumAmount);
        }

        [TestMethod]
        public void PaymentService_Returns_Total_Amount_of_Payment_Schedule_For_TestStudent()
        {
            IPaymentService paymentService = new PaymentService(new TestPaymentRepository());
            PaymentSchedule paymentSchedule = paymentService.GetPaymentSchedule(1);

            Assert.IsNotNull(paymentSchedule);
            Assert.IsTrue(paymentSchedule.Payments.Count > 0);
            Assert.IsNotNull(paymentSchedule.StudentName);

            double sumAmount = paymentSchedule.PaymentScheduleTotal;
            Assert.IsNotNull(sumAmount);
        }
    }
}
