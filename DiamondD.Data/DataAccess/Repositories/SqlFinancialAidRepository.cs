using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.FinancialAid;
using DiamondD.Data.DataAccess.Repositories.Base;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlFinancialAidRepository : IFinancialAidRepository
    {
        public FinancialAidList GetAidDetails(int studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT  Student, LedgerDescription, StudentAwardAmount, AcademicYearBegin, AcademicYearEnd, AcademicYear ")
                 .AppendFormat(" FROM vWebAwards ")
                 .AppendFormat(" WHERE StudentNo = {0} ORDER BY AcademicYear ", studentNo);

            var financialAidList = new FinancialAidList();

            var aidDetails = financialAidList.AidDetails;
            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;

                    financialAidList.StudentName = reader[++colIndex] as string;
                     
                    var financialAidItem = new FinancialAidItem
                                               {
                                                   AidTitle = reader[++colIndex] as string,
                                                   Amount = double.Parse(reader[++colIndex].ToString())
                                               };                                        
                    var academicYearBegin  = reader[++colIndex] as DateTime?;
                    var academicYearEnd    = reader[++colIndex] as DateTime?;
                    var academicYearNumber = reader[++colIndex] as string;

                    string strAcademicYear = "";
                    if (academicYearBegin.HasValue && academicYearEnd.HasValue)
                    {
                        // Formatting appropriately, e.g. 1 (9/3/2011 - 4/27/2012)
                        var cultureInfo = DateTimeFormatInfo.CurrentInfo;
                        strAcademicYear += " (" + academicYearBegin.Value.ToString("d", cultureInfo);
                        strAcademicYear += " - " + academicYearEnd.Value.ToString("d", cultureInfo) + ")";
                    }

                    strAcademicYear = academicYearNumber + strAcademicYear;

                    if (!aidDetails.ContainsKey(strAcademicYear))
                        aidDetails.Add(strAcademicYear, new List<FinancialAidItem>());
                    
                    aidDetails[strAcademicYear].Add(financialAidItem);
                    //financialAidList.TotalAwards += financialAidItem.Amount;
                }
            }
            return financialAidList;
        }
    }
}
