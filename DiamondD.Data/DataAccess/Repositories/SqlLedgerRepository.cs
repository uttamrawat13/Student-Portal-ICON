using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Ledger;
using System.Data;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlLedgerRepository : ILedgerRepository
    {
        public StudentLedger GetLedgerReport(int? studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT  TOP (100) PERCENT StudentNo, Student, TransDate, [Transaction], Debit, Credit")
            .AppendFormat(" FROM vWebLedger")
            .AppendFormat(" WHERE StudentNo = {0} ORDER BY Student, TransDate, [Transaction]", studentNo);

            var studentLedger = new List<Ledger.LedgerInfo>();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var ledger = new LedgerInfo
                                     {

                                         StudentNo = reader[++colIndex] as int?,
                                         Student = reader[++colIndex] as string,
                                         TransDate = reader[++colIndex] as DateTime?,
                                         Transaction = reader[++colIndex] as string,
                                         Debit = Convert.ToDouble(reader[++colIndex]),
                                         Credit = Convert.ToDouble(reader[++colIndex])
                                     };
                    studentLedger.Add(ledger);
                }
            }
            return new StudentLedger(studentLedger);
        }
    }
}
