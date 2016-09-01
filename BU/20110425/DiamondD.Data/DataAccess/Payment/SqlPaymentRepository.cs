using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DbContext;
using DiamondD.Data.Filters;

namespace DiamondD.Data.DataAccess.Payment
{
    public class SqlPaymentRepository : IPaymentRepository
    {
        public IEnumerable<Payment> GetPaymants(int studentNo)
        {
            var ctx = new LinqDbModelDataContext();
            var payments = from t in ctx.vPaymentSchedules
                           where t.StudentNo == studentNo
                           orderby t.DisbursementDate ascending
                           select new Payment
                                      {
                                          StudentNo = t.StudentNo,
                                          AcademicYear = t.AcademicYear,
                                          Amount = Convert.ToDouble(t.Amount),
                                          DisbursementDate = t.DisbursementDate,
                                          LegderCode = t.LedgerCode,
                                          Student = t.Student
                                      };
            return payments;
        }
    }
}
