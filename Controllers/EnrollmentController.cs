using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using DiamondD.Data.DataAccess.Enrollment;
using DiamondD.Services.Enrollment;
using DiamondD.Web.Common.Logging;
using DiamondD.Web.Controllers.Filters;
using DiamondD.Web.Helpers;

namespace DiamondD.Web.Controllers
{
    [RequiresAuthentication]
    public class EnrollmentController : Controller
    {
        //private int PageNumber { get; set; }
        private int PageSize { get; set; }
        private readonly ILogger _logger;
        
        public EnrollmentController()
        {
            //PageNumber = 1;
            PageSize = 40;

            _logger = new Logger(this.GetType());
        }
        public ActionResult Enroll()
        {
            try
            {
                // Fetch the first page.
                var courseOffering = FetchTerms(1, true);
                return View("Enroll", courseOffering);
            }
            catch (Exception ex)
            {
                var sb = new StringBuilder();
                sb.AppendFormat("Exception Occurred while fetching terms for enrollment.");

                _logger.Error(sb.ToString(), ex);

                var studentNo = Session[UserController.SessionKeyStudentNo].ToString();
                _logger.Error("StudentNo: " + studentNo, ex);


                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Enroll(int courseOfferingNo, int pageNumber)
        {
            var studentNo = Session[UserController.SessionKeyStudentNo].ToString();
            var courseEnrollment = new CourseEnrollment
            {
                CourseOfferingNo = courseOfferingNo,
                StudentId = int.Parse(studentNo),
                ImportDate = DateTime.Now,
                StatusId = 1,
                GradeNo = 1,
                ImportConversion = "Student Portal"
            };

            try
            {
                IEnrollmentService service = new EnrollmentService();
                int result = service.EnrollStudent(courseEnrollment);
                int selectedTerm = Convert.ToInt32(Session[UserController.SessionKeyCourseOfferingTermId]);
                // Load Terms
                Dictionary<int, DateTime> terms = null;
                terms = service.FetchTermsForOnlineEnrollment();
                ViewData["enrollmentTerms"] = terms;

                // Load Course
                var courseOffering = GetCourseOffering(service, studentNo, selectedTerm, pageNumber);
                //int totalRows = 0;
                //var courseOffering = service.FetchCourseOfferings(Convert.ToInt32(studentNo), selectedTerm, out totalRows, pageNumber, PageSize);
                //int totalPages = totalRows / PageSize;
                //ViewData["pageNumberLast"] = totalPages;
                ////int pageNumber = 1;
                //// Decrement page number only if it doesn't pass the minimum page number.
                //ViewData["pageNumberPrev"] = (pageNumber <= 1) ? 1 : pageNumber - 1;

                //ViewData["pageNumberCurrent"] = pageNumber;

                //// Increment page number only if it doesn't pass the maximum page number.
                //ViewData["pageNumberNext"] = (pageNumber >= totalPages) ? totalPages : pageNumber + 1;

                if(result > 0)
                {

                    ViewData["successMsgEnroll"] = "1";
                }
                else
                {
                    var sb = new StringBuilder();
                    sb.AppendFormat("Unable to enroll student. EnrollStudent returned: {0}, EnrollmentData:{1}", result,
                        courseEnrollment.ToString());

                    _logger.Warn(sb.ToString());

                    Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                }
                return View("Enroll", courseOffering);
            }
            catch (Exception ex)
            {
                var sb = new StringBuilder();
                sb.AppendFormat("Exception Occurred. StudentNo: {0}, EnrollmentData:{1}", studentNo,
                    courseEnrollment);

                _logger.Error(sb.ToString(), ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
            
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UnEnroll(string CourseOfferingNo, int pageNumber)
        {
            CourseEnrollment CourseEnrollment = new CourseEnrollment();
            var studentNo = Session[UserController.SessionKeyStudentNo].ToString();

            try
            {
                IEnrollmentService service = new EnrollmentService();
                bool isUnEnroll = service.UnEnrollStudent(int.Parse(studentNo), int.Parse(CourseOfferingNo));
                int selectedTerm = Convert.ToInt32(Session[UserController.SessionKeyCourseOfferingTermId]);
                // Load Terms
                Dictionary<int, DateTime> terms = null;
                terms = service.FetchTermsForOnlineEnrollment();
                ViewData["enrollmentTerms"] = terms;

                // Load Course
                var courseOffering = GetCourseOffering(service, studentNo, selectedTerm, pageNumber);
                //int totalRows = 0;
                //var courseOffering = service.FetchCourseOfferings(Convert.ToInt32(studentNo), selectedTerm, out totalRows, pageNumber, PageSize);
                //int totalPages = totalRows / PageSize;
                //ViewData["pageNumberLast"] = totalPages;
                ////int pageNumber = 1;
                //// Decrement page number only if it doesn't pass the minimum page number.
                //ViewData["pageNumberPrev"] = (pageNumber <= 1) ? 1 : pageNumber - 1;

                //ViewData["pageNumberCurrent"] = pageNumber;

                //// Increment page number only if it doesn't pass the maximum page number.
                //ViewData["pageNumberNext"] = (pageNumber >= totalPages) ? totalPages : pageNumber + 1;

                if (isUnEnroll)
                {
                    ViewData["successMsgUnEnroll"] = "1";
                }
                else
                {
                    var sb = new StringBuilder();
                    sb.AppendFormat("Unable to enroll student. EnrollStudent returned: {0}, EnrollmentData:{1}", isUnEnroll,
                        CourseEnrollment);

                    _logger.Warn(sb.ToString());

                    Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                }
                return View("Enroll", courseOffering);
            }
            catch (Exception ex)
            {
                var sb = new StringBuilder();
                sb.AppendFormat("Exception Occurred. StudentNo: {0}, EnrollmentData:{1}", studentNo,
                    CourseEnrollment);

                _logger.Error(sb.ToString(), ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
            
        }
        public ActionResult EnrollmentCourseByTerm(int enrollmentTerms)
        {

            var studentNo = Session[UserController.SessionKeyStudentNo].ToString();
            Session[UserController.SessionKeyCourseOfferingTermId] = enrollmentTerms;
            try
            {
                int selectedTerm = Convert.ToInt32(Session[UserController.SessionKeyCourseOfferingTermId]);
                IEnrollmentService service = new EnrollmentService();
                // Fill Term List
                Dictionary<int, DateTime> terms = null;
                terms = service.FetchTermsForOnlineEnrollment();
                ViewData["enrollmentTerms"] = terms;

                var courseOffering = GetCourseOffering(service, studentNo, selectedTerm, 1);
                return View("Enroll", courseOffering);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + studentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }

        }

        public ActionResult Page(int pageNumber)
        {
            try
            {
                var courseOffering = FetchTerms(pageNumber);

                return View("Enroll", courseOffering);
            }
            catch (Exception ex)
            {
                var sb = new StringBuilder();
                sb.AppendFormat("Exception Occurred while fetching terms for enrollment.");

                _logger.Error(sb.ToString(), ex);

                var studentNo = Session[UserController.SessionKeyStudentNo].ToString();
                _logger.Error("StudentNo: " + studentNo, ex);


                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
        }

        private IList<CourseOffering> FetchTerms(int pageNumber, bool showFirstTerm = false)
        {
            Dictionary<int, DateTime> terms = null;
            IEnrollmentService service = new EnrollmentService();
            terms = service.FetchTermsForOnlineEnrollment();
            int selectedTerm = 0;
            
            if (showFirstTerm)
            {
                selectedTerm = terms.First().Key;
                Session[UserController.SessionKeyCourseOfferingTermId] = selectedTerm;
            }
            else
            {
                selectedTerm = Convert.ToInt32(Session[UserController.SessionKeyCourseOfferingTermId]);                
            }
                
            var studentNo = Session[UserController.SessionKeyStudentNo].ToString();

            ViewData["enrollmentTerms"] = terms;
            
            // Load Terms
            var courseOffering = GetCourseOffering(service, studentNo, selectedTerm, pageNumber);
            return courseOffering;
        }

        private IList<CourseOffering> GetCourseOffering(IEnrollmentService service, string studentNo, int selectedTerm, int pageNumber)
        {
            int totalRows = 0;
            var courseOffering = service.FetchCourseOfferings(Convert.ToInt32(studentNo), selectedTerm, out totalRows, pageNumber, PageSize);
            int totalPages = totalRows / PageSize;
            if (totalPages <= 0)
                totalPages = 1;

            ViewData["pageNumberLast"] = totalPages;

            // Decrement page number only if it doesn't pass the minimum page number.
            ViewData["pageNumberPrev"] = (pageNumber <= 1) ? 1 : pageNumber - 1;
            
            ViewData["pageNumberCurrent"] = pageNumber;

            // Increment page number only if it doesn't pass the maximum page number.
            ViewData["pageNumberNext"] = (pageNumber >= totalPages) ? totalPages : pageNumber + 1;
            return courseOffering;
        }
    }
}
