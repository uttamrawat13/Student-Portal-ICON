using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.FinancialAid;

namespace DiamondD.Services
{
    public interface IFinancialAidService
    {
        FinancialAidList GetAidDetails(int studentNo);
    }
}
