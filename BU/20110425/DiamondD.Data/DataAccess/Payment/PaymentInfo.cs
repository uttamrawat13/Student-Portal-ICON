using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Payment
{
    public class PaymentInfo
    {
        public int? StudentNo { get; set; }
        public string Student { get; set; }
        public string Description { get; set; }
        public string AmountUnpaid { get; set; }
        public decimal? Amount { get; set; }
        public DateTime? Scheduled { get; set; }
        public DateTime? DepositDate { get; set; }
    }
}
