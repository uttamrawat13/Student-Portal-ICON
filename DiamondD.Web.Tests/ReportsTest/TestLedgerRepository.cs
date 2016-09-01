using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Ledger;
using DiamondD.Data.DataAccess.Repositories.Base;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DiamondD.Web.Tests.ReportsTest
{
    public class TestLedgerRepository : ILedgerRepository
    {
        private Dictionary<int, StudentLedger> studentLedger { get; set; }
        public TestLedgerRepository()
        {
            init();
        }

        private void init()
        {
            #region Insert Test Data of Ledger

            studentLedger = new Dictionary<int, StudentLedger>();

            //StudentNo 1.
            var Ledger = new List<LedgerInfo>();
            // Enter Valid Data
            var ledger1 = new LedgerInfo
            {

                StudentNo = 1,
                Student = "Alex",
                TransDate = new DateTime(10, 02, 05, 09, 15, 00, 000),
                Transaction = "Payment Test 1",
                Debit = 150.00,
                Credit = 00.00
            };
            Ledger.Add(ledger1);
            // Enter Valid Data
            var ledger2 = new LedgerInfo
            {

                StudentNo = 1,
                Student = "Alex",
                TransDate = new DateTime(10, 03, 05, 09, 15, 00, 000),
                Transaction = "Payment Test 2",
                Debit = 350.00,
                Credit = 00.00
            };
            Ledger.Add(ledger2);
            // Enter Valid Data
            var ledger3 = new LedgerInfo
            {

                StudentNo = 1,
                Student = "Alex",
                TransDate = new DateTime(10, 04, 05, 11, 15, 00, 000),
                Transaction = "Payment Test 3",
                Debit = 0.00,
                Credit = 400.00
            };
            Ledger.Add(ledger3);
            // Enter Valid Data
            var ledger4 = new LedgerInfo
            {

                StudentNo = 1,
                Student = "Alex",
                TransDate = new DateTime(10, 06, 03, 09, 35, 00, 000),
                Transaction = "Payment Test 4",
                Debit = 510.00,
                Credit = 00.00
            };
            Ledger.Add(ledger4);
            // Enter Valid Data
            var ledger5 = new LedgerInfo
            {

                StudentNo = 1,
                Student = "Alex",
                TransDate = new DateTime(10, 07, 05, 09, 15, 00, 000),
                Transaction = "Payment Test 5",
                Debit = 0.00,
                Credit = 200.00
            };
            Ledger.Add(ledger5);
            // Enter Valid Data
            var ledger6 = new LedgerInfo
            {

                StudentNo = 1,
                Student = "Alex",
                TransDate = new DateTime(10, 02, 20, 09, 15, 00, 000),
                Transaction = "Payment Test 6",
                Debit = 0.00,
                Credit = 325.00
            };
            Ledger.Add(ledger6);

            var LedgerDetail = new StudentLedger(Ledger);
            studentLedger.Add(1, LedgerDetail);

            //StudentNo 2.
            Ledger = new List<LedgerInfo>();
            for (int i = 0; i < 4; i++)
            {
                    // Enter Valid Data
                    ledger1 = new LedgerInfo
                    {

                        StudentNo = 2,
                        Student = "Ben",
                        TransDate = new DateTime(10, 02, 05, 09, 15, 00, 000),
                        Transaction = "Payment Test " + i,
                        Debit = 150.00,
                        Credit = 00.00
                    };
                Ledger.Add(ledger1);
            }
            LedgerDetail = new StudentLedger(Ledger);
            studentLedger.Add(2, LedgerDetail);
            #endregion
        }

        public StudentLedger GetLedgerReport(int? studentNo)
        {
            return studentLedger[Convert.ToInt32(studentNo)];
        }
    }
}
