using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Payment;
using DiamondD.Data.DataAccess.Repositories.Base;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DiamondD.Web.Tests.ReportsTest
{
    public class TestPaymentRepository : IPaymentRepository
    {
        private Dictionary<int, PaymentSchedule> paymentSchedule { get; set; }
        
        public TestPaymentRepository()
        {
            init();
        }

        private void init()
        {
            #region Insert Test Data of Payment Schedule

            paymentSchedule = new Dictionary<int, PaymentSchedule>();

            // StudentNo 1.
            var payments = new List<PaymentInfo>();

            //Enter Valid Data
            var payment1 = new PaymentInfo
            {
                StudentNo = 1,
                Student = "Alex",
                Amount = new decimal(52.20),
                Description = "Payment Due Test 1",
                AmountUnpaid = "59.20",
                Scheduled = new DateTime(10, 05, 02, 11, 05, 00, 000),
                DepositDate = new DateTime(10, 06, 02, 11, 05, 00, 000)
            };
            payments.Add(payment1);

            //Enter Valid Data
            var payment2 = new PaymentInfo
            {
                StudentNo = 1,
                Student = "Alex",
                Amount = new decimal(60.00),
                Description = "Payment Due Test 2",
                AmountUnpaid = "60.00",
                Scheduled = new DateTime(10, 06, 02, 11, 05, 00, 000),
                DepositDate = new DateTime(10, 07, 02, 11, 05, 00, 000)
            };
            payments.Add(payment2);

            //Enter Valid Data
            var payment3 = new PaymentInfo
            {
                StudentNo = 1,
                Student = "Alex",
                Amount = new decimal(88.00),
                Description = "Payment Due Test 3",
                AmountUnpaid = "88.00",
                Scheduled = new DateTime(10, 07, 02, 11, 05, 00, 000),
                DepositDate = new DateTime(10, 08, 02, 11, 05, 00, 000)
            };
            payments.Add(payment3);

            //Enter Valid Data
            var payment4 = new PaymentInfo
            {
                StudentNo = 1,
                Student = "Alex",
                Amount = new decimal(52.00),
                Description = "Payment Due Test 4",
                AmountUnpaid = "59.20",
                Scheduled = new DateTime(10, 08, 02, 11, 05, 00, 000),
                DepositDate = new DateTime(10, 09, 02, 11, 05, 00, 000)
            };
            payments.Add(payment4);

            //Enter Valid Data
            var payment5 = new PaymentInfo
            {
                StudentNo = 1,
                Student = "Alex",
                Amount = new decimal(53.25),
                Description = "Payment Due Test 5",
                AmountUnpaid = "53.25",
                Scheduled = new DateTime(10, 09, 02, 11, 05, 00, 000),
                DepositDate = new DateTime(10, 10, 02, 11, 05, 00, 000)
            };
            payments.Add(payment5);

            //Enter Valid Data
            var payment6 = new PaymentInfo
            {
                StudentNo = 1,
                Student = "Alex",
                Amount = new decimal(52.00),
                Description = "Payment Due Test 6",
                AmountUnpaid = "59.20",
                Scheduled = new DateTime(10, 10, 02, 11, 05, 00, 000),
                DepositDate = new DateTime(10, 11, 02, 11, 05, 00, 000)
            };
            payments.Add(payment6);

            //Enter Valid Data
            var payment7 = new PaymentInfo
            {
                StudentNo = 1,
                Student = "Alex",
                Amount = new decimal(150.00),
                Description = "Payment Due Test 7",
                AmountUnpaid = "150.00",
                Scheduled = new DateTime(10, 11, 02, 11, 05, 00, 000),
                DepositDate = new DateTime(10, 12, 02, 11, 05, 00, 000)
            };
            payments.Add(payment7);

            var programCourseDetail = new PaymentSchedule(payments);
            paymentSchedule.Add(1, programCourseDetail);


            // StudentNo 2.
            payments = new List<PaymentInfo>();
            for (int i = 0; i < 4; i++)
            {
                //Enter Valid Data
                payment1 = new PaymentInfo
                {
                    StudentNo = 2,
                    Student = "Ben",
                    Amount = new decimal(52.20),
                    Description = "Payment Due Test " +i,
                    AmountUnpaid = "59.20",
                    Scheduled = new DateTime(10, 05, 02, 11, 05, 00, 000),
                    DepositDate = new DateTime(10, 06, 02, 11, 05, 00, 000)
                };
            payments.Add(payment1);
            }

            programCourseDetail = new PaymentSchedule(payments);
            paymentSchedule.Add(2, programCourseDetail);

            #endregion
        }

        public PaymentSchedule GetPaymentSchedule(int studentNo)
        {
            return paymentSchedule[studentNo];
        }
    }
}
