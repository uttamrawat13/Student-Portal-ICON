using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Payment;
using DiamondD.Data.DataAccess.Repositories.Base;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlPaymentRepository : IPaymentRepository
    {
        private const string ConnectionStringId = "DD_StudentPortal_ConnectionString";
        public PaymentSchedule GetPaymentSchedule(int studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT AwardDisbursementNo, [StudentNo], [Student],[Amount],[Description],[AmountUnpaid],[Scheduled],[DepositDate],dbo.GetStudentCurrentBalanceDue('" + studentNo + "') as paymentdue, dbo.GetStudentPendingPaymentForApproval('" + studentNo + "') as paymentPending ,ARPaymentStatus")
                .AppendFormat(" FROM vWebPaymentSchedule ")
                .AppendFormat(" WHERE StudentNo={0} ", studentNo)
                .AppendFormat(" ORDER BY [Scheduled] ASC");

            var payments = new List<Payment.PaymentInfo>();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;

                    var payment = new Payment.PaymentInfo
                    {
                        AwardDisbursementNo = reader[++colIndex] as int?,
                        StudentNo = reader[++colIndex] as int?,
                        Student = reader[++colIndex] as string,
                        Amount = reader[++colIndex] as decimal?,
                        Description = reader[++colIndex] as string,
                        AmountUnpaid = reader[++colIndex] as string,
                        Scheduled = reader[++colIndex] as DateTime?,
                        DepositDate = reader[++colIndex] as DateTime?,
                        PaymentDue = reader[++colIndex] as decimal?,
                        PendingPaymentForApproval = reader[++colIndex] as decimal?,
                        ARPaymentStatus = reader[++colIndex] as string
                        
                    };

                    payments.Add(payment);
                }
            }

            return new PaymentSchedule(payments);
        }



        public int InsertPaymentTransactionWithError(PaymentProcess objpp)
        {

            string connectionString = ConfigurationManager.ConnectionStrings[ConnectionStringId].ToString();
            SqlConnection CN = new SqlConnection(connectionString);
            int status;
            try
            {
                using (SqlCommand CMD = new SqlCommand())
                {
                    CN.Open();
                    CMD.Connection = CN;

                    CMD.CommandType = System.Data.CommandType.StoredProcedure;
                    CMD.CommandText = "sptPaymentProcess";
                    CMD.Parameters.Add(new SqlParameter("@StudentNo", objpp.StudentNo));
                    CMD.Parameters.Add(new SqlParameter("@ssl_txn_id", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@ssl_txn_time", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@ssl_token", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@ssl_token_response", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@ssl_result", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@ssl_result_message", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@ssl_approval_code", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@ssl_amount", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@errorCode", objpp.errorCode));
                    CMD.Parameters.Add(new SqlParameter("@errorName", objpp.errorName));
                    CMD.Parameters.Add(new SqlParameter("@errorMsg", objpp.errorMsg));
                    CMD.Parameters.Add(new SqlParameter("@PaymentSource", objpp.PaymentSource));
                    CMD.Parameters.Add(new SqlParameter("@MiscID", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@LeadsID", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@PaymentType", DBNull.Value));
                    status = CMD.ExecuteNonQuery();
                    CN.Close();

                    return status;
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }

        }

        public int InsertPaymentTransactionWithSuccess(PaymentProcess objpp)
        {

            string connectionString = ConfigurationManager.ConnectionStrings[ConnectionStringId].ToString();
            SqlConnection CN = new SqlConnection(connectionString);
            int status;
            try
            {
                using (SqlCommand CMD = new SqlCommand())
                {
                    CN.Open();
                    CMD.Connection = CN;

                    CMD.CommandType = System.Data.CommandType.StoredProcedure;
                    CMD.CommandText = "sptPaymentProcess";
                    CMD.Parameters.Add(new SqlParameter("@StudentNo", objpp.StudentNo));
                    CMD.Parameters.Add(new SqlParameter("@ssl_txn_id", objpp.ssl_txn_id));
                    CMD.Parameters.Add(new SqlParameter("@ssl_txn_time", objpp.ssl_txn_time));
                    CMD.Parameters.Add(new SqlParameter("@ssl_token", objpp.ssl_token));
                    CMD.Parameters.Add(new SqlParameter("@ssl_token_response", objpp.ssl_token_response));
                    CMD.Parameters.Add(new SqlParameter("@ssl_result", objpp.ssl_result));
                    CMD.Parameters.Add(new SqlParameter("@ssl_result_message", objpp.ssl_result_message));
                    CMD.Parameters.Add(new SqlParameter("@ssl_approval_code", objpp.ssl_approval_code));
                    CMD.Parameters.Add(new SqlParameter("@ssl_amount", objpp.ssl_amount));
                    CMD.Parameters.Add(new SqlParameter("@errorCode", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@errorName", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@errorMsg", DBNull.Value));
                    CMD.Parameters.Add(new SqlParameter("@PaymentSource", objpp.PaymentSource));
                    CMD.Parameters.Add(new SqlParameter("@MiscID",objpp.MiscID));
                    CMD.Parameters.Add(new SqlParameter("@LeadsID",objpp.LeadsID));
                    CMD.Parameters.Add(new SqlParameter("@PaymentType",objpp.PaymentType));
                    status = CMD.ExecuteNonQuery();
                    CN.Close();

                    return status;
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }

        }

        public class SI
        {
            public string Fname { get; set; }
            public string Lname { get; set; }
            public string email { get; set; }
            public string email2 { get; set; }
            public string EmailSent { get; set; }
        }

        public IList<SI> getStudentName(int StudentNo)
        {
            var MyList = new List<SI>();
            StringBuilder query = new StringBuilder();
            query.AppendFormat("select FirstName,LastName, Email,Email2,EmailSent ")
                .AppendFormat(" FROM Students ")
                .AppendFormat(" WHERE StudentNo = '{0}'", StudentNo);

            using (IDataReader reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {

                while (reader.Read())
                {
                    int colIndex = -1;

                    var newArm = new SI
                    {
                        Fname = reader.GetValue(++colIndex).ToString(),
                        Lname = reader.GetValue(++colIndex).ToString(),
                        email = reader.GetValue(++colIndex).ToString(),
                        email2 = reader.GetValue(++colIndex).ToString(),
                        EmailSent = reader.GetValue(++colIndex).ToString()

                    };
                    MyList.Add(newArm);
                }
            }

            return MyList;


        }
      
        public IList<SI> getStudentNameLeadandStudent(int MiscID)
        {
            var MyList = new List<SI>();
            StringBuilder query = new StringBuilder();
            query.AppendFormat("EXEC sptGetinformationForPayment {0}", MiscID);
            using (IDataReader reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                
                while (reader.Read())
                {
                    int colIndex = -1;

                    var newArm = new SI
                    {

                        Fname = reader.GetValue(++colIndex).ToString(),
                        Lname = reader.GetValue(++colIndex).ToString(),
                        email = reader.GetValue(++colIndex).ToString(),
                        email2 = reader.GetValue(++colIndex).ToString(),
                        EmailSent = reader.GetValue(++colIndex).ToString()
                    };
                    MyList.Add(newArm);
                }
            }

            return MyList;

        }

        public class ARMisc
        {
            public decimal Debit { get; set; }
            public int LeadsId { get; set; }
            public int StudentNo { get; set; }
        }

        public IList<ARMisc> getInformation(int MiscID)
        {
            var MyList = new List<ARMisc>();
            var sql = new StringBuilder();
            sql.AppendFormat("select [Debit],LeadsId,StudentNo from [dbo].[ARMiscNotPosted] where ID= " + MiscID + "");
            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {

                while (reader.Read())
                {
                    int colIndex = -1;

                    var newArm = new ARMisc
                    {
                        Debit = reader.GetDecimal(++colIndex),
                        LeadsId = reader.GetInt32(++colIndex),
                        StudentNo = reader.GetInt32(++colIndex)
                    };
                    MyList.Add(newArm);
                }
            }

            return MyList;
        }

    }
}
