using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Payment;
namespace DiamondD.Services.PaymentScheduleService
{
    public interface IPaymentService
    {
        /// <summary>
        /// Get Payment Schedule
        /// </summary>
        /// <param name="studentNo">Provide student no.</param>
        /// <returns>list of Payment Schedule</returns>
        PaymentSchedule GetPaymentSchedule(int studentNo);
    }
}
