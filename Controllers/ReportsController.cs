using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Mvc;
using DiamondD.Data.DataAccess.FinancialAid;
using DiamondD.Data.DataAccess.GradeBook;
using DiamondD.Data.DataAccess.Report;
using DiamondD.Data.DataAccess.ScheduleOfCourses;
using DiamondD.Services;
using DiamondD.Services.FinancialAid;
using DiamondD.Services.GradeBook;
using DiamondD.Services.PaymentScheduleService;
using DiamondD.Services.Attendance;
using DiamondD.Services.Report;
using DiamondD.Services.SchedulesOfCourses;
using DiamondD.Web.Common.Logging;
using DiamondD.Web.Controllers.Filters;
using DiamondD.Services.Ledger;
using DiamondD.Services.CosmetologyGradeBook;
using DiamondD.Services.ProgramCourseStatus;
using DiamondD.Web.Helpers;
using DiamondD.Services.Enrollment;
using DiamondD.Data.DataAccess.Enrollment;

namespace DiamondD.Web.Controllers
{
    [RequiresRole]
    [RequiresAuthentication]
    public class ReportsController : Controller
    {
        private readonly ILogger _logger;

        public ReportsController()
        {
            _logger = new Logger(this.GetType());                
        }

        //
        // GET: /Reports/
        private int StudentNo
        {
            get
            {
                var studentNo = Session[UserController.SessionKeyStudentNo].ToString();
                return int.Parse(studentNo);
            }
        }

        public ActionResult AcademicReviewByTerm()      
        {
            try
            {
                ITranscriptService transcriptService = new TranscriptService();
                var transcript = transcriptService.GetTranscript(StudentNo);
                
                return View(transcript);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
        }

        public ActionResult GradeBook()
        {
            try
            {
                IStudentGradeBookService gradeBookService = new StudentGradeBookService();
                var termList = gradeBookService.GetStudentGradeBokkOfTerm(StudentNo);

                IEnumerable<string> list = termList;

                var gradeBook = new StudentGradeBook();
                if (termList.Count != 0)
                {
                    ViewData["TermsDateList"] = new SelectList(list, termList[0]);
                    ViewData["IsGradeBookWeighted"] = gradeBookService.IsGradeBookWeighted();
                    gradeBook = gradeBookService.GetStudentGradeBookDetail(StudentNo, termList[0]);
                }

                return View(gradeBook);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
        }

        [HttpPost]
        public ActionResult GradeBook(string listTermDate)
        {
            try
            {
                DateTime result;
                var gradeBook = new StudentGradeBook();
                bool isValidDate = DateTime.TryParse(listTermDate, out result);

                if (isValidDate)
                {
                    IStudentGradeBookService gradeBookService = new StudentGradeBookService();
                    var termList = gradeBookService.GetStudentGradeBokkOfTerm(StudentNo);

                    IEnumerable<string> list = termList;

                    if (termList.Count != 0)
                    {
                        ViewData["TermsDateList"] = new SelectList(list, listTermDate);
                        ViewData["IsGradeBookWeighted"] = gradeBookService.IsGradeBookWeighted();
                        gradeBook = gradeBookService.GetStudentGradeBookDetail(StudentNo, listTermDate);
                    }
                }

                return View("GradeBook", gradeBook);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo + " listTermDate: " + listTermDate, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
        }

        [HttpPost]
        public ActionResult StudentGradeBook(string listTermDate)
        {
            try
            {
                DateTime result;
                var gradeBook = new StudentGradeBook();
                bool isValidDate = DateTime.TryParse(listTermDate, out result);

                if (isValidDate)
                {
                    IStudentGradeBookService gradeBookService = new StudentGradeBookService();
                    var termList = gradeBookService.GetStudentGradeBokkOfTerm(StudentNo);

                    IEnumerable<string> list = termList;

                    if (termList.Count != 0)
                    {
                        ViewData["TermsDateList"] = new SelectList(list, listTermDate);
                        gradeBook = gradeBookService.GetStudentGradeBookDetail(StudentNo, listTermDate);
                    }
                }

                return View("GradeBook", gradeBook);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo + " listTermDate: " + listTermDate, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
        }

        public ActionResult ScheduleOfCourses()
        {
            try
            {
                IScheduleOfCoursesService scheduleOfCoursesService = new ScheduleOfCoursesService();
                var termList = scheduleOfCoursesService.GetStudentScheduleOfTerm(StudentNo);

                IEnumerable<string> list = termList;

                var scheduleOfCourses = new StudentScheduleOfCourses();
                if (termList.Count != 0)
                {
                    ViewData["TermsDateList"] = new SelectList(list, termList[0]);
                    scheduleOfCourses = scheduleOfCoursesService.GetStudentClassSchedule(StudentNo, termList[0]);
                }

                return View(scheduleOfCourses);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
        }

        [HttpPost]
        public ActionResult ScheduleOfCourses(string listTermDate)
        {
            try
            {
                DateTime result;
                var scheduleOfCourses = new StudentScheduleOfCourses();
                bool isValidDate = DateTime.TryParse(listTermDate, out result);

                if (isValidDate)
                {
                    IScheduleOfCoursesService scheduleOfCoursesService = new ScheduleOfCoursesService();
                    var termList = scheduleOfCoursesService.GetStudentScheduleOfTerm(StudentNo);

                    IEnumerable<string> list = termList;

                    if (termList.Count != 0)
                    {
                        ViewData["TermsDateList"] = new SelectList(list, listTermDate);
                        scheduleOfCourses = scheduleOfCoursesService.GetStudentClassSchedule(StudentNo, listTermDate);
                    }
                }

                return View("ScheduleOfCourses", scheduleOfCourses);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo + " listTermDate: " + listTermDate, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
            
        }

        public ActionResult StudentDetail()   
        {
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred in ReportsController", ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
        }

        public ActionResult AcademicReview()    
        {
            try
            {
                ITranscriptService transcriptService = new TranscriptService();                                
                var transcript = transcriptService.GetTranscript(StudentNo);
                
                return View(transcript);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
        }

        public ActionResult FinancialAidAwards()
        {
            try
            {
                IFinancialAidService financialAidService = new FinancialAidService();
                var aidList = financialAidService.GetAidDetails(StudentNo);

                return View(aidList);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
        }

        public ActionResult PaymentSchedule() 
        {
            try
            {
                IPaymentService paymentService = new PaymentService();
                var paymentSchedule = paymentService.GetPaymentSchedule(StudentNo);

                return View(paymentSchedule);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
        }

        public ActionResult AttendanceReview()
        {
            DateTime dateFrom = DateTime.Now.AddDays(-35);
            DateTime dateTo = DateTime.Now;
            
            try
            {
                IAttendanceService attendanceService = new AttendanceService();
                var studentAttendance = attendanceService.GetAttendanceReview(StudentNo, dateFrom, dateTo);

                return View("AttendanceReview", studentAttendance);
            }
            catch (Exception ex)
            {
                var sb = new StringBuilder();
                sb.AppendFormat("Exception Occurred. StudentNo: {0}, dateFrom:{1}, dateTo:{2}" + StudentNo, dateFrom, dateTo);
                _logger.Error(sb.ToString(), ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
            
        }

        public ActionResult AttendanceSummary()
        {
            try
            {
                IAttendanceService attendanceService = new AttendanceService();
                var studentAttendanceSummary = attendanceService.GetAttendanceSummary(StudentNo);

                return View(studentAttendanceSummary);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error")); 

                return null;
            }

        }

        public ActionResult StudentLedger()
        {
            try
            {
                ILedgerService studentLedgerService = new LedgerService();
                var studentLedger = studentLedgerService.GetLedgerReport(StudentNo);

                return View(studentLedger);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                

                return null;
            }

        }
        public ActionResult CosmetologyGradeBookLabs()
        {
            try
            {
                ICosmetologyGradeBookService cosmetologyGradeBookLabService = new CosmetologyGradeBookService();
                var cosmetologyGradeBookLab = cosmetologyGradeBookLabService.GetStudentCosmetologyGradeBookLabReport(StudentNo);

                return View(cosmetologyGradeBookLab);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error")); ;

                return null;
            }

        }
        public ActionResult CosmetologyGradeBookSummary()
        {
            try
            {
                ICosmetologyGradeBookService cosmetologyGradeBookSummaryService = new CosmetologyGradeBookService();
                var cosmetologyGradeBookSummary = cosmetologyGradeBookSummaryService.GetStudentCosmetologyGradeBookSummaryReport(StudentNo);

                return View(cosmetologyGradeBookSummary);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }

        }
        public ActionResult Student1098TPDF()
        {
            try
            {
                IGetStudent1098TReportService reportService = new GetStudent1098TReportService();
                var student1098TPdf = reportService.GetStudent1098TPDF(StudentNo);
                byte[] pdf = student1098TPdf.PdfData;
                if (pdf != null)
                    return File(pdf, "application/pdf", "1098-T.pdf");
                else
                    return View("Student1098TPdf");
            }
            catch (Exception ex)
            {

                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
            
        }

        public ActionResult CosmetologyGradeBookTests()
        {
            try
            {
                ICosmetologyGradeBookService cosmetologyGradeBookTestService = new CosmetologyGradeBookService();
                var cosmetologyGradeGradeBookTest = cosmetologyGradeBookTestService.GetStudentCosmetologyGradeBookTestReport(StudentNo);

                return View(cosmetologyGradeGradeBookTest);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }

        }
        public ActionResult ProgramCourseProgress()
        {
            try
            {
                IProgramCourseProgressService programCourseProgressService = new ProgramCourseProgressService();
                var programCourseProgress = programCourseProgressService.GetStudentProgramCoursePrograssDetail(StudentNo);

                return View(programCourseProgress);
            }
            catch (Exception ex)
            {
                _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                
                return null;
            }

        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AttendanceReview(string dateFrom, string dateTo, string returnUrl)
        {
            try
            {
                if (string.IsNullOrEmpty(dateFrom) || string.IsNullOrEmpty(dateTo))
                {
                    dateFrom = DateTime.Now.AddDays(-35).ToString();
                    //if (string.IsNullOrEmpty(dateTo))
                    dateTo = DateTime.Now.ToString();
                }
                
                IAttendanceService attendanceService = new AttendanceService();
                
                DateTime dtDateFrom = Convert.ToDateTime(dateFrom);
                DateTime dtDateTo = Convert.ToDateTime(dateTo);

                var studentAttendance = attendanceService.GetAttendanceReview(StudentNo, dtDateFrom, dtDateTo);

                return View("AttendanceReview", studentAttendance);
            }
            catch (Exception ex)
            {
                var sb = new StringBuilder();
                sb.AppendFormat("Exception Occurred. StudentNo: {0}, dateFrom:{1}, dateTo:{2}", StudentNo, dateFrom, dateTo);
                _logger.Error(sb.ToString(), ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }
        }

        #region "Payment Receipt: Microware"
        public ActionResult PaymentReceipt()
        {
            try
            {
               // IPaymentService paymentService = new PaymentService();
                //var paymentSchedule = paymentService.GetPaymentSchedule(StudentNo);

                return View();
            }
            catch (Exception ex)
            {
               // _logger.Error("Exception Occurred. StudentNo: " + StudentNo, ex);

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }

        }

        #endregion 
    }
}
