using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Payment;
using DiamondD.Data.DataAccess.Repositories.Base;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlPaymentRepository : IPaymentRepository
    {
        public PaymentSchedule GetPaymentSchedule(int studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT [StudentNo], [Student],[Amount],[Description],[AmountUnpaid],[Scheduled],[DepositDate] ")
                .AppendFormat(" FROM vWebPaymentSchedule ")
                .AppendFormat(" WHERE StudentNo={0} ", studentNo)
                .AppendFormat(" ORDER BY [DepositDate] ASC");

            var payments = new List<Payment.PaymentInfo>();
            
            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;

                    var payment = new Payment.PaymentInfo
                    {
                        StudentNo = reader[++colIndex] as int?,
                        Student   = reader[++colIndex] as string,
                        Amount    = reader[++colIndex] as decimal?,
                        Description = reader[++colIndex] as string,
                        AmountUnpaid   = reader[++colIndex] as string,
                        Scheduled =  reader[++colIndex] as DateTime?,
                        DepositDate = reader[++colIndex] as DateTime?
                    };

                    payments.Add(payment);
                }
            }

            return new PaymentSchedule(payments);
        }
    }
}
