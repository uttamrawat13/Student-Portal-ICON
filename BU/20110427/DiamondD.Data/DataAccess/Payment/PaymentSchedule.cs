using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Payment
{
    public class PaymentSchedule
    {
        public IList<PaymentInfo> Payments{ get; private set; }

        /// <summary>
        /// Calculates Sum of all payments made by a Student.
        /// <para>
        /// Note: This field is computed each time the property is accessed. 
        /// You should store it in a local variable instead of calling it again and again.
        /// </para>
        /// </summary>
        /// <returns>Sum of all the payments.</returns>
        public double PaymentScheduleTotal
        {
            get
            {
                double total = 0.00;
                foreach (var item in Payments)
                {
                    if(item.DepositDate == null)
                    total = total + Convert.ToDouble(item.Amount);
                }

                return total;
            }
        }

        public PaymentSchedule() : this(null)
        {
        }

        public PaymentSchedule(IList<PaymentInfo> payments)
        {
            this.Payments = payments;
        }
        
        public string StudentName
        {
            get
            {
                foreach (var item in Payments)
                {
                    return item.Student;
                }
                return null;
            }

        }
    }
}
