using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.GradeBook
{
    public class GradeBookInfo
    {
        public int? StudentNo { get; set; }
        public string Student { get; set; }
        public string CourseOfferingDescription { get; set; }

        public DateTime TermBeginDate { get; set; }
        public int? GradeBookColumn { get; set; }

        public string GradeItem { get; set; }

        public double StudentPoints { get; set; }
        public double Totalpoints { get; set; }
        public double CurrentWeightedStudentPoints { get; set; }
        public double CurrentWeightedTotalPoints { get; set; }
    }
}
