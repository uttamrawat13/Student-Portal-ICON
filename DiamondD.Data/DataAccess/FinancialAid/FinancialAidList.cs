using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.FinancialAid
{
    public class FinancialAidList
    {
        public  Dictionary<string, List<FinancialAidItem>> AidDetails;
        public string StudentName { get; set; }
        
        
        public FinancialAidList()
        {
            AidDetails = new Dictionary<string, List<FinancialAidItem>>();
            StudentName = null;
        }
    }
}
