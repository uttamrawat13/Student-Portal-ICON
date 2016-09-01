using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.FinancialAid;
using DiamondD.Data.DataAccess.Repositories.Base;

namespace DiamondD.Web.Tests.ReportsTest
{
    public class TestFinancialAidRepository : IFinancialAidRepository
    {
        private readonly Dictionary<int, FinancialAidList> _aidDetail = new Dictionary<int, FinancialAidList>();

        public TestFinancialAidRepository()
        {
            Init();
        }

        private void Init()
        {
            #region Data for Test Student 1
            var financialAidList = new FinancialAidList();
            financialAidList.StudentName = "Alex";
            
            string[] yearBeginList = {"10/22/2007", "10/22/2007", "5/5/2010", "5/5/2010", "5/5/2010", "12/10/2010"};
            string[] yearEndList   = {"5/29/2009", "5/29/2009", "12/1/2010", "12/1/2010", "12/1/2010", "5/20/2011"};
            
            for (int i = 0; i < yearBeginList.Length; ++i)
            {

                var financialAidItem = new FinancialAidItem {AidTitle = "Aid " + i, Amount = i*100};

                string key = (i+1) + " (" + yearBeginList[i] + " - " + yearEndList[i] + ")";
                
                if (!financialAidList.AidDetails.ContainsKey(key))
                    financialAidList.AidDetails.Add(key, new List<FinancialAidItem>());
                
                financialAidList.AidDetails[key].Add(financialAidItem);
            }
            _aidDetail.Add(1, financialAidList);
            #endregion

            #region Data for Test Student 2
            financialAidList = new FinancialAidList();
            financialAidList.StudentName = "Ben";

            yearBeginList = new[] { "5/5/2010", "1/12/2011", "1/12/2011" };
            yearEndList = new[] { "12/1/2010", "8/10/2011", "8/10/2011" };

            for (int i = 0; i < yearBeginList.Length; ++i)
            {

                var financialAidItem = new FinancialAidItem { AidTitle = "Aid " + i, Amount = i * 125 };

                string key = (i+1) + " (" + yearBeginList[i] + " - " + yearEndList[i] + ")";

                if (!financialAidList.AidDetails.ContainsKey(key))
                    financialAidList.AidDetails.Add(key, new List<FinancialAidItem>());

                financialAidList.AidDetails[key].Add(financialAidItem);
            }
            _aidDetail.Add(2, financialAidList);
            #endregion
        }

        public FinancialAidList GetAidDetails(int studentNo)
        {
            if (_aidDetail.ContainsKey(studentNo))
                return _aidDetail[studentNo];
            else
                return new FinancialAidList();
        }
    }
}
