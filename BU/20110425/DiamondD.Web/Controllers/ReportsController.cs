using System;
using System.Collections.Generic;
using System.Web.Mvc;
using DiamondD.Data.DataAccess.ScheduleOfCourses;
using DiamondD.Services;
using DiamondD.Services.PaymentScheduleService;
using DiamondD.Services.Attendance;
using DiamondD.Services.SchedulesOfCourses;
using DiamondD.Web.Controllers.Filters;
using DiamondD.Services.StudentReportStatua;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Ledger;
using DiamondD.Services.CosmetologyGradeBook;
using DiamondD.Services.ProgramCourseStatus;

namespace DiamondD.Web.Controllers
{
    [RequiresRole]
    [RequiresAuthentication]
    public class ReportsController : Controller
    {
        //
        // GET: /Reports/
        public bool report_Status;

        private int StudentNo
        {
            get
            {
                var studentNo = Session[UserController.SessionKeyStudentNo].ToString();
                return int.Parse(studentNo);
            }
        }

        public ActionResult Transcript()      
        {
            try
            {
                ITranscriptService transcriptService = new TranscriptService();
                var transcript = transcriptService.GetTranscript(StudentNo);

                return View(transcript);
            }
            catch (Exception ex)
            {
                //ViewData["ErrorMessage"] = ex.Message;
                View("Result\\error").ExecuteResult(this.ControllerContext);

                return null;
            }
        }

        public ActionResult ScheduleOfCourses()
        {
            try
            {
                IScheduleOfCoursesService scheduleOfCoursesService = new ScheduleOfCoursesOfCoursesService();
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
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

                return null;
            }
        }
        public ActionResult ScheduleOfCoursesByTerm(string listTermDate)
        {
            try
            {
                DateTime result;
                var scheduleOfCourses = new StudentScheduleOfCourses();
                bool isValidDate = DateTime.TryParse(listTermDate, out result);

                if (isValidDate)
                {
                    IScheduleOfCoursesService scheduleOfCoursesService = new ScheduleOfCoursesOfCoursesService();
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
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

                return null;
            }
            //    IScheduleOfCoursesService scheduleOfCoursesService = new ScheduleOfCoursesOfCoursesService();
            //    var termList = scheduleOfCoursesService.GetStudentScheduleOfTerm(StudentNo);

            //    IEnumerable<string> list = termList;

            //    ViewData["TermsDateList"] = new SelectList(list, listTermDate);

            //    var scheduleOfCourses = scheduleOfCoursesService.GetStudentClassSchedule(StudentNo, listTermDate);

            //    return View("ScheduleOfCourses", scheduleOfCourses);
            //}
            //catch (Exception ex)
            //{
            //    //ViewData["ErrorMessage"] = ex.Message;
            //    Response.Redirect("../User/Result/error");

            //    return null;
            //}
        }

        public ActionResult StudentDetail()   
        {
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

                return null;
            }
        }

        public ActionResult GradeHistory()    
        {
            try
            {
                ITranscriptService transcriptService = new TranscriptService();                                
                var transcript = transcriptService.GetTranscript(StudentNo);
                
                return View(transcript);
            }
            catch (Exception ex)
            {
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

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
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

                return null;
            }
        }

        public ActionResult AttendanceReview()
        {
            try
            {
                //IAttendanceService attendanceReviewService = new AttendanceReviewService();
                //var studentAttendance = attendanceReviewService.GetAttendanceReview(StudentNo);

                //return View(studentAttendance); 
                IAttendanceService attendanceReviewService = new AttendanceReviewService();

                DateTime dateFrom = DateTime.Now.AddDays(-35);
                DateTime dateTo = DateTime.Now;

                var studentAttendance = attendanceReviewService.GetAttendanceReview(StudentNo, dateFrom, dateTo);

                return View(studentAttendance);
            }
            catch (Exception ex)
            {
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

                return null;
            }
            
        }

        public ActionResult AttendanceSummary()
        {
            try
            {
                IAttendanceService attendanceSummayService = new AttendanceReviewService();
                var studentAttendanceSummary = attendanceSummayService.GetAttendanceSummary(StudentNo);

                return View(studentAttendanceSummary);
            }
            catch (Exception ex)
            {
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

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
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");
                

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
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

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
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

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
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

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
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");
                
                return null;
            }

        }

        public ActionResult StudentReportStatus()
        {

            GetStudentStatusReport();
            return View(); 
        }

        public void GetStudentStatusReport()
        {
            IStudentReportStatusService reportStatus = new StudentReportStatusService();
            bool studentReporStatus = reportStatus.GetStudentStatusReport();

            if (studentReporStatus)
            {
                ViewData["studentReportStatus"] = "Currently student report status is enable.";
                report_Status = true;
            }
            else
            {
                ViewData["studentReportStatus"] = "Currently student report status is disable.";
                report_Status = false;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ChangeStudentReportStatus(FormCollection formValues)
        {
            GetStudentStatusReport();
            
            string changedStatus = formValues["Status"];
            bool changedReportStatus;
            
            if (changedStatus == "false")
            {
                changedReportStatus = false;
            }
            else
            { changedReportStatus = true; }

            if (changedReportStatus == report_Status)
            {
                ViewData["result"] = "Student report current status is Already " + changedReportStatus.ToString() + ".";
            }
            else
            {
                IStudentReportStatusService reportStatus = new StudentReportStatusService();
                reportStatus.UpdateStudentStatusReport(changedReportStatus);
                ViewData["result"] = "Successfully change report status for all student.";
            }
            
            GetStudentStatusReport();

            return View("StudentReportStatus");
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AttendanceReview(string dateFrom, string dateTo, string returnUrl)
        {
            try
            {
                IAttendanceService attendanceReviewService = new AttendanceReviewService();
                
                DateTime dtDateFrom = Convert.ToDateTime(dateFrom);
                DateTime dtDateTo = Convert.ToDateTime(dateTo);

                var studentAttendance = attendanceReviewService.GetAttendanceReview(StudentNo, dtDateFrom, dtDateTo);

                return View(studentAttendance);
            }
            catch (Exception ex)
            {
                //ViewData["ErrorMessage"] = ex.Message;
                Response.Redirect("../User/Result/error");

                return null;
            }
        }
    }
}
