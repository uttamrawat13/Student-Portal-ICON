using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Payment;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface IPaymentRepository : IBaseRepository
    {
        /// <summary>
        /// Get Paymant Schedule for a student whose number is provided.
        /// </summary>
        /// <param name="studentNo">The student number.</param>
        /// <returns>Schedule of paymants made by the student</returns>
        PaymentSchedule GetPaymentSchedule(int studentNo);
    }
}
