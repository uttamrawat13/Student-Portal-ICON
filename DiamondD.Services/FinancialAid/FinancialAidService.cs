using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.FinancialAid;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Common;

namespace DiamondD.Services.FinancialAid
{
    public class FinancialAidService : IFinancialAidService
    {
       private readonly IFinancialAidRepository _repository;

       #region Constructors ...

        public FinancialAidService()
        {
            _repository = new SqlFinancialAidRepository();
        }

        public FinancialAidService(IFinancialAidRepository repository)
        {
            this._repository = repository;
        }

        #endregion

        public FinancialAidList GetAidDetails(int studentNo)
        {
            FinancialAidList financialAidList = null;

            try
            {
                financialAidList = _repository.GetAidDetails(studentNo);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);                
            }
            return financialAidList;
        }
    }
}
