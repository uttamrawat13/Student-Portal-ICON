using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Payment;
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
        public void PaymentService_Retruns_Payment_Schedule_Data_For_StudentNo_12()
        {
            IPaymentService paymentService = new PaymentService();
            PaymentSchedule paySchedule = paymentService.GetPaymentSchedule(12);

            Assert.IsNotNull(paySchedule);
        }

        [TestMethod]
        public void PaymentService_Returns_Total_Amount_of_Payment_Schedule_For_StudentNo_12()
        {
            IPaymentService paymentService = new PaymentService();
            PaymentSchedule paymentSchedule = paymentService.GetPaymentSchedule(12);

            double sumAmount = paymentSchedule.PaymentScheduleTotal;

            Assert.IsNotNull(sumAmount);
        }
    }
}
