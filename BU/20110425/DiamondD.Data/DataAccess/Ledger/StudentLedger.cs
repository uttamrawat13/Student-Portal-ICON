using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Ledger
{
   public class StudentLedger
    {
       public IList<LedgerInfo> ledgerList { get; private set; }


       public string StudentName
       {
           get
           {
               foreach (var item in ledgerList)
               {
                   return item.Student;
               }
               return null;
           }

       }

       /// <summary>
       /// Calculates total Credit.
       /// <para>
       /// Note: This field is computed each time the property is accessed. 
       /// You should store it in a local variable instead of calling it again and again.
       /// </para>
       /// </summary>
       /// <returns>Sum of all Credit.</returns>
       public double TotalCredit
       {
           get
           {
               double totalCredit = 0.0;
               foreach (var item in ledgerList)
               {
                   totalCredit = totalCredit + Convert.ToDouble(item.Credit);
               }
               return totalCredit;
           }
       }

       /// <summary>
       /// Calculates total Debit.
       /// <para>
       /// Note: This field is computed each time the property is accessed. 
       /// You should store it in a local variable instead of calling it again and again.
       /// </para>
       /// </summary>
       /// <returns>Sum of all Debit.</returns>
       public double TotalDebit
       {
           get
           {
               double totalDebit = 0.0;
               foreach (var item in ledgerList)
               {
                   totalDebit = totalDebit + Convert.ToDouble(item.Debit);
               }
               return totalDebit;
           }
       }

       public StudentLedger() : this(null)
        { 
        }

       public StudentLedger(IList<LedgerInfo> ledgerList)
        {
            this.ledgerList = ledgerList;
        }
    }
}
