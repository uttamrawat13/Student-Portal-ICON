using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Attendance
{
    public class AttendanceSummary
    {
        public int? StudentNo { get; set; }

        public string Student  { get; set; }
        public string Course { get; set; }
        public string CourseDescription { get; set; }

        public DateTime? TermBeginDate { get; set; }

        public double? ScheduledTotal { get; set; }
        public double? ScheduledToDate { get; set; }
        public double? AttendedToDate { get; set; }
        public double? AttendedPercentage { get; set; }
    }
}
