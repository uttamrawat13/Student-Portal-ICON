using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.ProgramCourseStatus
{
    public class ProgramCourseProgress
    {

        public int? StudentNo { get; set; }
        public string Student { get; set; }

        public string ReportGroup { get; set; }

        public int? CourseNo { get; set; }

        public string CourseCode { get; set; }
        public string CourseDescription { get; set; }

        public double? Units { get; set; }
    }
}
