using System;

namespace DiamondD.Data.DataAccess.ScheduleOfCourses
{
   public class ScheduleOfCourse
    {
        public int? StudentNo { get; set; }
        public string Student { get; set; }

        public DateTime? TermBeginDate { get; set; }

        public string Course { get; set; }
        public string CourseDescription { get; set; }

        public string Room { get; set; }
        public double? Units { get; set; }

        public string Instructor { get; set; }
        public DateTime? FirstClassDate { get; set; }

        public DateTime? LastClassDate { get; set; }
    }
}
