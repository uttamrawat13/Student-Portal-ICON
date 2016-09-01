using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.CosmetologyGradeBook
{
    public class StudentCosmetologyGradeBookLab
    {
        public IList<CosmetologyGradeBookLab> CosmetologyGradeBookLabs { get; private set; }

        public string StudentName
        {
            get
            {
                foreach (var item in CosmetologyGradeBookLabs)
                {
                    return item.Student;
                }
                return null;
            }

        }

        public StudentCosmetologyGradeBookLab() : this(null)
        { 
        }

        public StudentCosmetologyGradeBookLab(IList<CosmetologyGradeBookLab> cosmetologyGradeBookLab)
        {
            this.CosmetologyGradeBookLabs = cosmetologyGradeBookLab;
        }
    }

}
