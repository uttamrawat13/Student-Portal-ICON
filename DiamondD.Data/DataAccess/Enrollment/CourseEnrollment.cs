using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Enrollment
{
    public class CourseEnrollment
    {
        public int CourseOfferingNo { get; set; }
        public int StudentId { get; set; }
        public int GradeNo { get; set; }
        public int StatusId { get; set; }
        public DateTime ImportDate { get; set; }
        public string ImportConversion { get; set; }

        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.AppendFormat("CourseOfferingNo:{0}, StudentId:{1}, GradeNo:{2}, StatusId:{3}, ImportedDate:{4}, ImportConversion:{5}",
                CourseOfferingNo, StudentId, GradeNo, StatusId, ImportDate, ImportConversion);

            return sb.ToString();
        }
    }
}
