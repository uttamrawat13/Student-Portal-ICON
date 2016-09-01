using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Ledger;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface ILedgerRepository : IBaseRepository
    {
        StudentLedger GetLedgerReport(int? studentNo);
    }
}
