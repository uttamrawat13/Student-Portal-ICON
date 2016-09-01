using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.CosmetologyGradeBook
{
   public class StudentCosmetologyGradeBookSummary
    {
       public IList<CosmetologyGradeBookSummary> CosmetologyGradeBookSummaries { get; private set; }

       public string StudentName
       {
           get
           {
               foreach (var item in CosmetologyGradeBookSummaries)
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
            this.CosmetologyGradeBookSummaries = cosmetologyGradeBookSummary;
        }
    }
}
