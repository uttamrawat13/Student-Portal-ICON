using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.FinancialAid;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface IFinancialAidRepository : IBaseRepository
    {

        FinancialAidList GetAidDetails(int p);
    }
}
