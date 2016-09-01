using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.CosmetologyGradeBook
{
   public class StudentCosmetologyGradeBookTest
    {
       public IList<CosmetologyGradeBookTest> CosmetologyGradeBookTests { get; private set; }
       
       public string StudentName
       {
           get
           {
               foreach (var item in CosmetologyGradeBookTests)
               {
                   return item.Student;
               }
               return null;
           }

       }

        public StudentCosmetologyGradeBookTest() : this(null)
        { 
        }

        public StudentCosmetologyGradeBookTest(IList<CosmetologyGradeBookTest> cosmetologyGradeBookTest)
        {
            this.CosmetologyGradeBookTests = cosmetologyGradeBookTest;
        }

    }
}
