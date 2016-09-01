using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Ledger;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Repositories;
using System.Data.SqlClient;
using DiamondD.Services.Common;

namespace DiamondD.Services.Ledger
{
   public class LedgerService : ILedgerService
    {
       private readonly ILedgerRepository _repository;

       #region Constructors ...

        public LedgerService()
        {
            _repository = new SqlLedgerRepository();
        }

        public LedgerService(ILedgerRepository repository)
        {
            this._repository = repository;
        }

        #endregion

       public StudentLedger GetLedgerReport(int? studentNo)
       {
           try
           {
               var attendanceSummary = _repository.GetLedgerReport(studentNo);

               return attendanceSummary;
           }
           catch (SqlException sqlEx)
           {
               throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
           }
           catch (Exception ex)
           {
               throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
           }
       }
    }
}
