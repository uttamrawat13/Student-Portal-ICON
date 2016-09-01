using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Ledger
{
   public class LedgerInfo
    {
        public int? StudentNo { get; set; }
        public string Student { get; set; }

        public DateTime? TransDate { get; set; }

        public string Transaction { get; set; }

        public double Debit { get; set; }
        public double Credit { get; set; }
    }
}
