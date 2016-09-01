using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Enrollment
{
    public class CourseOffering
    {
        public int CourseOfferingNo { get; set; }
        public DateTime Term { get; set; }
        public string Course { get; set; }
        public string CourseInfo { get; set; }
        public int EnrollmentStatus { get; set; }
        public DateTime? CourseEnrolledDateTime { get; set; }
        public string RegistrationMessage { get; set; }
        public int RegistrationAllowed { get; set; }

        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.AppendFormat("CourseOfferingNo:{0}, Term:{1}, Course:{2}, CourseInfo:{3}, EnrollmentStatus:{4}, CourseEnrolledDateTime:{5}, RegistrationMessage:{6}, RegistrationAllowed{7}.",
                CourseOfferingNo, Term, Course, CourseInfo, EnrollmentStatus, CourseEnrolledDateTime, RegistrationMessage, RegistrationAllowed);

            return sb.ToString();
        }
    }
}
