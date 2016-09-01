using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Common;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DiamondD.Services.Report
{
    public class ReportsService:IReportsService
    {
        private IReportsRepository _repository = null;

        public ReportsService()
        {
            _repository = new SqlReportsRepository();        
        }

        public IList<Data.DataAccess.Report.WebReport> GetAllWebReports(bool IsActiveOnly)
        {
            try
            {
                return _repository.GetAllReports(IsActiveOnly);
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


        public Data.DataAccess.Report.WebReport GetWebReport(string reportName)
        {
            try
            {
                return _repository.GetWebReport(reportName);
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
