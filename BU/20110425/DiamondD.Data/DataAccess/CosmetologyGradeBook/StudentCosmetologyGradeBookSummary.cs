using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.CosmetologyGradeBook
{
   public class StudentCosmetologyGradeBookSummary
    {
       public IList<CosmetologyGradeBookSummary> cosmetologyGradeBookSummaries { get; private set; }

       public string StudentName
       {
           get
           {
               foreach (var item in cosmetologyGradeBookSummaries)
               {
                   return item.Student;
               }
               return null;
           }

       }

        public StudentCosmetologyGradeBookSummary() : this(null)
        { 
        }

        public StudentCosmetologyGradeBookSummary(IList<CosmetologyGradeBookSummary> cosmetologyGradeBookSummary)
        {
            this.cosmetologyGradeBookSummaries = cosmetologyGradeBookSummary;
        }
    }
}
