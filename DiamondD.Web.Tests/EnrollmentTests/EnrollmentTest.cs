using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DiamondD.Services.Enrollment;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Enrollment;

namespace DiamondD.Web.Tests.EnrollmentTests
{
    [TestClass]
    public class EnrollmentTest
    {
        [TestMethod]
        public void EnrollmentService_TestEnrollmentRepository_Enrolls_Student_in_a_Class_Offered_in_a_Term()
        {
            IEnrollmentService service = new EnrollmentService(new TestEnrollmentRepository());

            var courseEnrollment = new CourseEnrollment
            {
                CourseOfferingNo = 0,
                StudentId = 0,
                GradeNo = 1,
                StatusId = 1,
                ImportDate = DateTime.Now,
                ImportConversion = "Student Portal"
            };
            int isEnrolled = service.EnrollStudent(courseEnrollment);

            Assert.AreEqual(1, isEnrolled);
        }

        [TestMethod]
        public void EnrollmentService_SqlEnrollmentRepository_Enrolls_Student_in_a_Class_Offered_in_a_Term()
        {
            IEnrollmentService service = new EnrollmentService(new SqlEnrollmentRepository());

            var courseEnrollment = new CourseEnrollment
            {
                CourseOfferingNo = 0,
                StudentId = 0,
                GradeNo = 1,
                StatusId = 1,
                ImportDate = DateTime.Now,
                ImportConversion = "Student Portal"
            };

            int isEnrolled = service.EnrollStudent(courseEnrollment);

            Assert.AreEqual(1, isEnrolled);
        }

        [TestMethod]
        public void EnrollmentService_TestEnrollmentRepository_Rejects_Duplicate_Enrollments_in_a_Class_Offered_in_a_Term()
        {
            IEnrollmentService service = new EnrollmentService(new TestEnrollmentRepository());

            var courseEnrollment = new CourseEnrollment
            {
                CourseOfferingNo = 0,
                StudentId = 0,
                GradeNo = 1,
                StatusId = 1,
                ImportDate = DateTime.Now,
                ImportConversion = "Student Portal"
            };

            int isEnrolled = service.EnrollStudent(courseEnrollment);
            Assert.AreEqual(1, isEnrolled);

            isEnrolled = service.EnrollStudent(courseEnrollment);
            Assert.AreEqual(0, isEnrolled);
        }

    
        /// <summary>
        /// This test inserts a dummy entry into the database in order to check whether
        /// system rejects dulpicate enrollments.
        /// <para>
        /// One must manually delete the dummy entry inserted into the database after each
        /// execution of this test.
        /// </para> 
        /// </summary>
        [TestMethod]        
        public void EnrollmentService_SqlEnrollmentRepository_Rejects_Duplicate_Enrollments_in_a_Class_Offered_in_a_Term()
        {
            IEnrollmentService service = new EnrollmentService(new SqlEnrollmentRepository());

            var courseEnrollment = new CourseEnrollment
            {
                CourseOfferingNo = 0,
                StudentId = 1,
                GradeNo = 1,
                StatusId = 1,
                ImportDate = DateTime.Now,
                ImportConversion = "Test Data"
            };


            /**
             * Manually delete the entry from the database.
             */
            int isEnrolled = service.EnrollStudent(courseEnrollment);
            Assert.AreEqual(1, isEnrolled);

            try
            {
                // This line should throw an exception
                isEnrolled = service.EnrollStudent(courseEnrollment);

                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }
        }


        [TestMethod]
        public void TestEnrollmentRepository_Enrolls_Student_in_a_Class_Offered_in_a_Term()
        {
            IEnrollmentRepository repository = new TestEnrollmentRepository();

            var courseEnrollment = new CourseEnrollment
            {
                CourseOfferingNo = 0,
                StudentId = 0,
                GradeNo = 1,
                StatusId = 1,
                ImportDate = DateTime.Now,
                ImportConversion = "Student Portal"
            };
            int isEnrolled = repository.EnrollStudent(courseEnrollment);

            Assert.AreEqual(1, isEnrolled);
        }

        [TestMethod]
        public void SqlEnrollmentRepository_Enrolls_Student_in_a_Class_Offered_in_a_Term()
        {
            IEnrollmentRepository repository = new SqlEnrollmentRepository();

            var courseEnrollment = new CourseEnrollment
            {
                CourseOfferingNo = 0,
                StudentId = -1,
                GradeNo = 1,
                StatusId = 1,
                ImportDate = DateTime.Now,
                ImportConversion = "Student Portal"
            };
            int isEnrolled = repository.EnrollStudent(courseEnrollment);

            Assert.AreEqual(1, isEnrolled);
        }


        [TestMethod]
        public void EnrollmentService_TestEnrollmentRepository_Fetches_CourseOfferings_for_a_Student_to_Enroll_against_Term()
        {
            IEnrollmentService service = new EnrollmentService(new TestEnrollmentRepository());

            int studentId = 0;
            int termId = 0;
            int pageNumber = 1;
            int pageSize = 5;
            int totalRows = 0;
            IList<CourseOffering> courseOfferings = service.FetchCourseOfferings(studentId, termId, out totalRows, pageNumber, pageSize);

            Assert.IsNotNull(courseOfferings);
        }


        [TestMethod]
        public void EnrollmentService_SqlEnrollmentRepository_Fetches_CourseOfferings_for_a_Student_to_Enroll_against_Term()
        {
            IEnrollmentService service = new EnrollmentService(new SqlEnrollmentRepository());

            int studentId = 1;
            int termId = 1;
            int pageNumber = 1;
            int pageSize = 5;
            int totalRows = 0;
            IList<CourseOffering> courseOfferings = service.FetchCourseOfferings(studentId, termId, out totalRows, pageNumber, pageSize);

            Assert.IsNotNull(courseOfferings);
        }

        [TestMethod]
        public void EnrollmentService_TestEnrollmentRepository_Fetches_List_of_Terms()
        {
            IEnrollmentService service = new EnrollmentService(new TestEnrollmentRepository());
            Dictionary<int, DateTime> terms = service.FetchTermsForOnlineEnrollment();

            Assert.IsNotNull(terms);
        }

        [TestMethod]
        public void EnrollmentService_SqlEnrollmentRepository_Fetches_List_of_Terms()
        {
            IEnrollmentService service = new EnrollmentService(new SqlEnrollmentRepository());
            Dictionary<int, DateTime> terms = service.FetchTermsForOnlineEnrollment();

            Assert.IsNotNull(terms);
        }


        [TestMethod]
        public void TestEnrollmentRepository_Fetches_List_of_Terms()
        {
            IEnrollmentRepository repository = new TestEnrollmentRepository();
            Dictionary<int, DateTime> terms = repository.FetchTermsForOnlineEnrollment();

            Assert.IsNotNull(terms);
        }

        [TestMethod]
        public void SqlEnrollmentRepository_Fetches_List_of_Terms()
        {
            IEnrollmentRepository repository = new SqlEnrollmentRepository();
            Dictionary<int, DateTime> terms = repository.FetchTermsForOnlineEnrollment();

            Assert.IsNotNull(terms);
        }

        [TestMethod]
        public void TestEnrollmentRepository_UnEnroll_a_Enrolled_Student()
        {
            IEnrollmentRepository repository = new TestEnrollmentRepository();
            int studentId = 1;
            int courseOfferingNo = 1;
            bool isEnrolled = repository.UnEnrollStudent(studentId, courseOfferingNo);

            Assert.IsNotNull(isEnrolled);            
        }

        [TestMethod]
        public void TestEnrollmentRepository_UnEnrollStudent_Throws_Exception_if_Student_is_Not_Enrolled()
        {
            // Case 1: course offering exists but student is not enrolled
            //
            IEnrollmentRepository repository = new TestEnrollmentRepository();
            int studentId = 0;
            int courseOfferingNo = 1;

            try
            {
                // This line should throw an exception
                repository.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }


            // Case 2: course offering does not exists but student exists
            //
            studentId = 1;
            courseOfferingNo = 0;

            try
            {
                // This line should throw an exception
                repository.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }



            // Case 3: both course offering and student do not exist
            //
            studentId = 0;
            courseOfferingNo = 0;
            try
            {
                // This line should throw an exception
                repository.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }
        }

        [TestMethod]
        public void EnrollmentService_TestEnrollmentRepository_UnEnroll_a_Enrolled_Student()
        {
            IEnrollmentService service = new EnrollmentService(new TestEnrollmentRepository());
            int studentId = 1;
            int courseOfferingNo = 1;
            bool isEnrolled = service.UnEnrollStudent(studentId, courseOfferingNo);

            Assert.IsNotNull(isEnrolled);
        }

        [TestMethod]
        public void EnrollmentService_TestEnrollmentRepository_UnEnrollStudent_Throws_Exception_if_Student_is_Not_Enrolled()
        {
            // Case 1: course offering exists but student is not enrolled
            //
            IEnrollmentService service = new EnrollmentService(new TestEnrollmentRepository());
            int studentId = 0;
            int courseOfferingNo = 1;

            try
            {
                // This line should throw an exception
                service.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }


            // Case 2: course offering does not exists but student exists
            //
            studentId = 1;
            courseOfferingNo = 0;

            try
            {
                // This line should throw an exception
                service.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }



            // Case 3: both course offering and student do not exist
            //
            studentId = 0;
            courseOfferingNo = 0;
            try
            {
                // This line should throw an exception
                service.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }
        }

        
        [TestMethod]
        public void SqlEnrollmentRepository_UnEnroll_a_Enrolled_Student()
        {
            IEnrollmentRepository repository = new SqlEnrollmentRepository();

            
            // First enroll a student
            //
            var courseEnrollment = new CourseEnrollment
            {
                CourseOfferingNo = 0,
                StudentId = -121,
                GradeNo = 1,
                StatusId = 1,
                ImportDate = DateTime.Now,
                ImportConversion = "Student Portal"
            };
            int isEnrolled = repository.EnrollStudent(courseEnrollment);

            Assert.AreEqual(1, isEnrolled);

            // Then Un-Enroll that student
            //
            var isUnEnrolled = repository.UnEnrollStudent(courseEnrollment.StudentId, courseEnrollment.CourseOfferingNo);
            Assert.IsTrue(isUnEnrolled);            
        }

        [TestMethod]
        public void SqlEnrollmentRepository_UnEnrollStudent_Throws_Exception_if_Student_is_Not_Enrolled()
        {
            // Case 1: course offering exists but student is not enrolled
            //
            IEnrollmentRepository repository = new SqlEnrollmentRepository();
            int studentId = -123;
            int courseOfferingNo = 604;

            try
            {
                // This line should throw an exception
                repository.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }


            // Case 2: course offering does not exists but student exists
            //
            studentId = 2593;
            courseOfferingNo = -123;

            try
            {
                // This line should throw an exception
                repository.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }



            // Case 3: both course offering and student do not exist
            //
            studentId = 2593;
            courseOfferingNo = 604;
            try
            {
                // This line should throw an exception
                repository.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }
        }

        [TestMethod]
        public void EnrollmentService_SqlEnrollmentRepository_UnEnroll_a_Enrolled_Student()
        {
            IEnrollmentService service = new EnrollmentService(new SqlEnrollmentRepository());

            // First enroll a student
            //
            var courseEnrollment = new CourseEnrollment
            {
                CourseOfferingNo = 0,
                StudentId = -98,
                GradeNo = 1,
                StatusId = 1,
                ImportDate = DateTime.Now,
                ImportConversion = "Student Portal"
            };
            int isEnrolled = service.EnrollStudent(courseEnrollment);

            Assert.AreEqual(1, isEnrolled);

            // Then Un-Enroll that student
            //
            var isUnEnrolled = service.UnEnrollStudent(courseEnrollment.StudentId, courseEnrollment.CourseOfferingNo);
            Assert.IsTrue(isUnEnrolled);    
        }

        [TestMethod]
        public void EnrollmentService_SqlEnrollmentRepository_UnEnrollStudent_returns_false_if_Student_is_Not_Enrolled()
        {
            // Case 1: course offering exists but student is not enrolled
            //
            IEnrollmentService service = new EnrollmentService(new TestEnrollmentRepository());
            int studentId = -123;
            int courseOfferingNo = 604;

            try
            {
                // This line should throw an exception
                service.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }


            // Case 2: course offering does not exists but student exists
            //
            studentId = 2593;
            courseOfferingNo = -123;

            try
            {
                // This line should throw an exception
                service.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }



            // Case 3: both course offering and student do not exist
            //
            studentId = 2593;
            courseOfferingNo = 604;
            try
            {
                // This line should throw an exception
                service.UnEnrollStudent(studentId, courseOfferingNo);
                // This should not be executed. In case of a duplicate entry
                // above line must throw an exception.
                Assert.Fail();
            }
            catch (Exception)
            {
                // Nothing to do, since in this scenario exception must be thrown
            }
        }
    }
}
