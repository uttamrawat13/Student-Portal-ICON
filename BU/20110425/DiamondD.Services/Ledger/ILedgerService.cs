using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Ledger;

namespace DiamondD.Services.Ledger
{
    public interface ILedgerService
    {
        StudentLedger GetLedgerReport(int? studentNo);
    }
}
