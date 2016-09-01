using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.CosmetologyGradeBook
{
   public class CosmetologyGradeBookSummary
    {
        public int? StudentNo { get; set; }

        public string Student { get; set; }

        public double? GradeBookGPA { get; set; }
        public double? TotalScheduled { get; set; }
        public double? TotalAttended { get; set; }
        public double? AttendancePercentage { get; set; }
        public double? TotalRequiredHours { get; set; }
        public double? TotalTransferHours { get; set; }
        public double? TotalHoursRemaining { get; set; }
    }
}
