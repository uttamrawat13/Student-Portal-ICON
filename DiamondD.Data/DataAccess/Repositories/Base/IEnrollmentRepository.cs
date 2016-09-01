using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Enrollment;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface IEnrollmentRepository : IBaseRepository
    {
        int EnrollStudent(CourseEnrollment courseOffering);
        IList<CourseOffering> FetchCourseOfferings(int studentId, int termId, out int totalRows, int pageNumber, int pageSize);
        Dictionary<int, DateTime> FetchTermsForOnlineEnrollment();
        bool UnEnrollStudent(int studentId, int courseOfferingNo);
    }
}
