using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Enrollment;

namespace DiamondD.Web.Tests.EnrollmentTests
{
    class TestEnrollmentRepository : IEnrollmentRepository
    {
        private List<CourseOffering> _courseOfferings;
        private Dictionary<int, Dictionary<int, CourseEnrollment>> _studentEnrollments;
        private Dictionary<int, DateTime> _terms;
        public TestEnrollmentRepository()
        {
            _courseOfferings = new List<CourseOffering>();
            _studentEnrollments = new Dictionary<int, Dictionary<int, CourseEnrollment>>();
            _terms = new Dictionary<int, DateTime>();

            #region Preparing Test Data

            // Course offerings
            for (int i = 0; i < 5; ++i)
            {
                int id = i + 1;
                var co = new CourseOffering
                {
                    Course = "Course " + id,
                    CourseInfo = "Course info " + id,
                    RegistrationMessage = "Available",                    
                };
                _courseOfferings.Add(co);
            }

            _courseOfferings[0].Term = DateTime.Parse("2006-07-27 00:00:00.000");
            
            _courseOfferings[1].Course = "Course 1";
            _courseOfferings[1].Term = DateTime.Parse("2007-02-26 00:00:00.000");

            _courseOfferings[2].Term = DateTime.Parse("2009-01-02 00:00:00.000");
            _courseOfferings[3].Term = DateTime.Parse("2007-01-02 00:00:00.000");
            _courseOfferings[4].Term = DateTime.Parse("2006-01-03 00:00:00.000");

            // Student enrollments
            var entry = new CourseEnrollment 
            {
                CourseOfferingNo = 439,
                ImportDate = DateTime.Now,
                GradeNo = 109,
                ImportConversion = "Student Portal",
                StatusId = 1,
                StudentId = 1                
            };

            var courseEnrollment = new Dictionary<int, CourseEnrollment>();
            courseEnrollment.Add(entry.CourseOfferingNo, entry);
            _studentEnrollments.Add(entry.StudentId, courseEnrollment);

            _terms.Add(1, DateTime.Parse("2006-01-03 00:00:00.000"));
            _terms.Add(2, DateTime.Parse("2006-07-27 00:00:00.000"));
            _terms.Add(3, DateTime.Parse("2007-01-02 00:00:00.000"));
            _terms.Add(4, DateTime.Parse("2007-02-26 00:00:00.000"));
            _terms.Add(5, DateTime.Parse("2009-01-02 00:00:00.000"));

            #endregion
        }

        public int EnrollStudent(CourseEnrollment courseOffering)
        {
            int studentId = courseOffering.StudentId;

            bool isFirstEnrollment = _studentEnrollments.ContainsKey(studentId) == false;

            if (isFirstEnrollment)
            {
                var courseEnrollments = new Dictionary<int, CourseEnrollment>();
                _studentEnrollments[studentId] = courseEnrollments;
            }
            else
            {
                // Can enroll a course only once!
                if (_studentEnrollments[studentId].ContainsKey(courseOffering.CourseOfferingNo))
                    return 0;
            }

            // If everything goes well, enroll the student
            _studentEnrollments[studentId].Add(courseOffering.CourseOfferingNo, courseOffering);
            return 1;
        }


        public IList<CourseOffering> FetchCourseOfferings(int studentId, int termId, out int totalRows, int pageNumber, int pageSize)
        {
            totalRows = _courseOfferings.Count;
            return _courseOfferings;
        }


        public Dictionary<int, DateTime> FetchTermsForOnlineEnrollment()
        {
            return _terms;
        }


        public bool UnEnrollStudent(int studentId, int courseOfferingNo)
        {
            bool isUnEnrolled = false;

            bool isCurrentlyEnrolled = _studentEnrollments.ContainsKey(studentId);

            if (isCurrentlyEnrolled)
            {
                var courseEnrollments = _studentEnrollments[studentId];

                if (_studentEnrollments[studentId].ContainsKey(courseOfferingNo))
                {
                    _studentEnrollments[studentId].Remove(courseOfferingNo);
                    isUnEnrolled = true;
                }
                else
                {
                    // Not enrolled in this course
                    isUnEnrolled = false;
                }
            }
            else
            {
                // Not enrolled in any course
                isUnEnrolled = false;
            }
            return isUnEnrolled;
        }
    }
}
