using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Attendance
{
    public class AttendanceEntry
    {
        public int? StudentNo { get; set; }
        public string Student { get; set; }

        public string Course { get; set; }

        public string AttendanceType { get; set; }
        public double? AttendanceHours { get; set; }
        public string AttendanceCode { get; set; }

        public double? AttendedAdj { get; set; }
        public double? ScheduledAdj { get; set; }

        public DateTime? TermBeginDate { get; set; }
        public DateTime? ClassDate { get; set; }
        public DateTime? ClassStartTime { get; set; }
        public DateTime? ClassEndTime { get; set; }
       
        public string ClassHours { get; set; }
        public string Complete { get; set; }

        public string ScheduledComplete { get; set; }
        public string CourseDescription { get; set; }


    }
}
