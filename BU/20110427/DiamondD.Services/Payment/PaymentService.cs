using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Payment;
using System.Data.SqlClient;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Common;
namespace DiamondD.Services.PaymentScheduleService
{
    public class PaymentService : IPaymentService
    {
        private readonly IPaymentRepository _repository;

        #region Constructors ...
        
        public PaymentService()
        {
            _repository = new SqlPaymentRepository();
        }
        public PaymentService(IPaymentRepository repository)
        {
            _repository = repository;
        }

        #endregion

        /// <summary>
        /// Get Payment Schedule
        /// </summary>
        /// <param name="studentNo">Provide student no.</param>
        /// <returns>list of Payment Schedule</returns>
        public PaymentSchedule GetPaymentSchedule(int studentNo)
        {
            PaymentSchedule paymentSchedule = null;
            try
            {
                paymentSchedule = _repository.GetPaymentSchedule(studentNo);                
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx );
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }

            return paymentSchedule;
        }
    }
}
