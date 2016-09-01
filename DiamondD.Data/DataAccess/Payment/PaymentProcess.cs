using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Payment
{
    public class PaymentProcess
    {
        public int StudentNo { get; set; }
        public string ssl_txn_id { get; set; }
        public DateTime? ssl_txn_time { get; set; }
        public string ssl_token { get; set; }
        public string ssl_token_response { get; set; }
        public string ssl_result { get; set; }
        public string ssl_result_message { get; set; }
        public string ssl_approval_code { get; set; }
        public decimal? ssl_amount { get; set; }
        public string errorCode { get; set; }
        public string errorName { get; set; }
        public string errorMsg { get; set; }
        public string PaymentSource { get; set; }
        public int? MiscID { get; set; }
        public int? LeadsID { get; set; }
        public string PaymentType { get; set; }
      

    }
}
