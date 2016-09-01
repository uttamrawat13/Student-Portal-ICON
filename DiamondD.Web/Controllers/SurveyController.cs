using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DiamondD.Web.Controllers.Filters;
using DiamondD.Services.Survey;
using DiamondD.Web.Helpers;
using DiamondD.Data.DataAccess.Survey;
using DiamondD.Services.Common;
using Lib.Web.Mvc.JQuery.JqGrid;
using DiamondD.Web.ViewModels;
using DiamondD.Web.Common;
using System.Web.Script.Serialization;
using DiamondD.Data.DataAccess.Common;

namespace DiamondD.Web.Controllers
{
    [RequiresRole]
    [RequiresAuthentication]
    public class SurveyController : Controller
    {
        //
        // GET: /Survey/

        private ISurveyService service = new SurveyService();
        private ICommonService commonService = new CommonService();
        public ActionResult Index()
        {
            return View();
        }

        //public ActionResult ListFilteredStudents()
        //{

        //}

        #region QuestionGroup

        public ActionResult MasterQuestionsGroup()
        {
            return View();
        }

        public ActionResult DetailQuestionsGroup()
        {
            return PartialView();
        }

        public ActionResult ListQuestionsGroup(JqGridRequest request)
        {
            IList<QuestionGroup> questionsGrouplist = service.GetAllQuestionGroups();
            var viewModelList = (from questionsGroup in questionsGrouplist
                                 select new QuestionGroupsGridViewModel()
                                 {
                                     GroupId = questionsGroup.QuestionGroupID,
                                     Code = questionsGroup.QuestionGroupCode,
                                     Active = questionsGroup.Active == true ? 'Y' : 'N',
                                 }).ToList();

            IList<QuestionGroupsGridViewModel> sortedList = PagingSorting<QuestionGroupsGridViewModel>.getSortedList(viewModelList, request.SortingName, request.SortingOrder.ToString());
            IList<QuestionGroupsGridViewModel> sortedPagedList = PagingSorting<QuestionGroupsGridViewModel>.getPagedRecords(sortedList, request.PageIndex, request.RecordsCount);

            int totalRecordsCount = viewModelList.Count;

            JqGridResponse response = new JqGridResponse()
            {
                TotalPagesCount = (int)Math.Ceiling((float)totalRecordsCount / (float)request.RecordsCount),
                PageIndex = request.PageIndex,
                TotalRecordsCount = totalRecordsCount
            };

            response.Records.AddRange(from questionsgroup in sortedPagedList
                                      select new JqGridRecord<QuestionGroupsGridViewModel>(Convert.ToString(questionsgroup.GroupId), questionsgroup));

            return new JqGridJsonResult() { Data = response };
        }

        [HttpGet]
        public ActionResult CreateQuestionsGroup(int id = 0)
        {
            QuestionGroup qg;
            if (id == 0)
            {
                prepareCreateQuestionGroupViewData();
            }
            else
            {
                qg = service.getQuestionsGroup(id);
                prepareCreateQuestionGroupViewData(
                id: qg.QuestionGroupID,
                code: qg.QuestionGroupCode,
                admissions: qg.Admissions,
                register: qg.Registrar,
                financialAid: qg.FinancialAid,
                placement: qg.Placement);
            }
            return View();
        }

        [HttpPost]
        public ActionResult CreateQuestionsGroup(FormCollection controls)
        {
            bool success = false;
            //TODO: Take from Resourse File...
            string GroupEmptyMessage = "Group Code can't be empty";
            string UnKnownExceptionMessage = "Unknown exception occured consult with your Administrator...";
            string responseMessage = "";

            int id = Convert.ToInt32(controls["questionsGroupId"]);
            string code = controls["txtQuestionGroupCode"];
            bool Admission;
            bool Register;
            bool FinancialAid;
            bool Placement;
            bool Active = true;

            if (string.IsNullOrEmpty(code))
            {
                responseMessage = GroupEmptyMessage;
                prepareCreateQuestionGroupViewData(responseMessage: responseMessage);
                return View();
            }

            if (string.IsNullOrEmpty(controls.Get("cbxAdmission")))
            {
                Admission = false;
            }
            else
            {
                Admission = Convert.ToBoolean(controls.Get("cbxAdmission").Contains("true"));
            }

            if (string.IsNullOrEmpty(controls.Get("cbxRegister")))
            {
                Register = false;
            }
            else
            {
                Register = Convert.ToBoolean(controls.Get("cbxRegister").Contains("true"));
            }

            if (string.IsNullOrEmpty(controls.Get("cbxFinancialAid")))
            {
                FinancialAid = false;
            }
            else
            {
                FinancialAid = Convert.ToBoolean(controls.Get("cbxFinancialAid").Contains("true"));
            }

            if (string.IsNullOrEmpty(controls.Get("cbxPlacement")))
            {
                Placement = false;
            }
            else
            {
                Placement = Convert.ToBoolean(controls.Get("cbxPlacement").Contains("true"));
            }

            try
            {
                if (id != 0)
                {
                    success = service.UpdateQuestionGroup(new Data.DataAccess.Survey.QuestionGroup()
                    {
                        QuestionGroupID = id,
                        QuestionGroupCode = code,
                        Admissions = Admission,
                        Registrar = Register,
                        FinancialAid = FinancialAid,
                        Placement = Placement,
                        Active = Active
                    });
                }
                else
                {
                    id = service.CreateNewQuestionGroup(new Data.DataAccess.Survey.QuestionGroup()
                    {
                        QuestionGroupCode = code,
                        Admissions = Admission,
                        Registrar = Register,
                        FinancialAid = FinancialAid,
                        Placement = Placement,
                        Active = Active
                    });
                    return Redirect(AppHelper.SurveysUrl("Questions/Master?questionsGroupId="+id));
                }

            }
            catch (Exception error)
            {
                if (null != error.InnerException)
                {
                    responseMessage = error.InnerException.Message;
                }
                else
                {
                    responseMessage = error.Message;
                }

                prepareCreateQuestionGroupViewData(responseMessage: responseMessage);
                return View();
            }


            if (success)
            {
                return Redirect(AppHelper.SurveysUrl("Questions/Master?questionsGroupId=5"));
            }
            else
            {
                responseMessage = UnKnownExceptionMessage;
                prepareCreateQuestionGroupViewData(responseMessage: responseMessage);
                return View();
            }
        }

        [HttpGet]
        public ActionResult UpdateQuestionsGroup()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UpdateQuestionsGroup(FormCollection controls)
        {
            return View();
        }
        #endregion



        #region Questions

        [HttpGet]
        public ActionResult MasterQuestions(int questionsGroupId = 0)
        {
            if (questionsGroupId != 0)
            {
                QuestionGroup qg = service.getQuestionsGroup(questionsGroupId);
                if (qg != null)
                {
                    prepareCreateQuestionGroupViewData(questionsGroupId, qg.QuestionGroupCode, qg.Admissions, qg.Registrar, qg.FinancialAid, qg.Placement);
                }
                else
                {
                    prepareCreateQuestionGroupViewData();
                }
            }
            else
            {
                prepareCreateQuestionGroupViewData();
            }
            return View();
        }


        [HttpPost]
        public JsonResult MasterQuestions(FormCollection fc, int groupId, string groupCode, bool groupAdmissions, bool groupRegister, bool groupFinancialAid, bool groupPlacement, List<QuestionsGridViewModel> questions)
        {
            JsonResult result = new JsonResult();
            if (groupId != 0)
            {
                List<Question> questionsList = (from q in questions
                                                select new Question()
                                                {
                                                    QuestionID = q.QuestionId,
                                                    QuestionText = q.Quetion,
                                                    Order = q.Order,
                                                    Numeric = q.Numeric,
                                                    Active = q.Active
                                                }).ToList<Question>();

                QuestionGroup group = new QuestionGroup()
                {
                    QuestionGroupID = groupId,
                    QuestionGroupCode = groupCode,
                    Admissions = groupAdmissions,
                    Registrar = groupRegister,
                    FinancialAid = groupFinancialAid,
                    Placement = groupPlacement,
                    Questions = questionsList
                };



                try
                {
                    service.UpdateQuestionGroupwithQuestions(group);
                    result.Data = new { message = "Saved Successfully" };
                }
                catch (Exception error)
                {
                    result.Data = new { message = error.Message };
                }
            }
            else
            {
                result.Data = new { message = "Group Creation not permitted here" };
            }
            return result;
        }
        public ActionResult ListQuestions(JqGridRequest request, int questionsGroupId=0)
        {
            IList<Question> questionslist = service.getAllQuestionsOf(questionsGroupId,false);
            var viewModelList = (from question in questionslist
                                 select new QuestionsGridViewModel()
                                 {   
                                   QuestionId=question.QuestionID,
                                   Quetion=question.QuestionText,
                                   Order=question.Order,
                                   Numeric=question.Numeric,// ? 'Y':'N',
                                   Active = question.Active,// ? 'Y' : 'N',                                     
                                 }).ToList();

            IList<QuestionsGridViewModel> sortedList = PagingSorting<QuestionsGridViewModel>.getSortedList(viewModelList, request.SortingName, request.SortingOrder.ToString());
            IList<QuestionsGridViewModel> sortedPagedList = PagingSorting<QuestionsGridViewModel>.getPagedRecords(sortedList, request.PageIndex, request.RecordsCount);

            int totalRecordsCount = viewModelList.Count;

            JqGridResponse response = new JqGridResponse()
            {
                TotalPagesCount = (int)Math.Ceiling((float)totalRecordsCount / (float)request.RecordsCount),
                PageIndex = request.PageIndex,
                TotalRecordsCount = totalRecordsCount
            };

            response.Records.AddRange(from question in sortedPagedList
                                      select new JqGridRecord<QuestionsGridViewModel>(Convert.ToString(question.QuestionId), question));

            return new JqGridJsonResult() { Data = response };
        }

        [HttpPost]
        public ActionResult CreateQuestions()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UpdateQuestions()
        {
            return View();
        }

        #endregion

        #region Survey
        public ActionResult MasterSurvey()
        {
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ListSurvey(JqGridRequest request)
        {
            IList<Survey> surveyslist = service.GetAllSurveys(false);
            var viewModelList = (from survey in surveyslist
                                 select new SurveyGridViewModel()
                                 {
                                     Id = survey.SurveyId,
                                     Name = survey.Name,
                                     Active = survey.Active == true ? 'Y' : 'N',
                                     OpenDate = survey.OpenDate == null ? new DateTime() : survey.OpenDate.Value
                                 }).ToList();

            IList<SurveyGridViewModel> sortedList = PagingSorting<SurveyGridViewModel>.getSortedList(viewModelList, request.SortingName, request.SortingOrder.ToString());
            IList<SurveyGridViewModel> sortedPagedList = PagingSorting<SurveyGridViewModel>.getPagedRecords(sortedList, request.PageIndex, request.RecordsCount);

            int totalRecordsCount = viewModelList.Count;

            JqGridResponse response = new JqGridResponse()
            {
                TotalPagesCount = (int)Math.Ceiling((float)totalRecordsCount / (float)request.RecordsCount),
                PageIndex = request.PageIndex,
                TotalRecordsCount = totalRecordsCount
            };

            response.Records.AddRange(from survey in sortedPagedList
                                      select new JqGridRecord<SurveyGridViewModel>(Convert.ToString(survey.Id), survey));

            return new JqGridJsonResult() { Data = response };
        }

        [HttpGet]
        public ActionResult CreateSurvey(int id = 0)
        {   
            //if (
            //    Session["name"] != null &
            //    Session["groupId"] != null &
            //    Session["startDate"] != null &
            //    Session["daysToOpen"] != null &
            //    Session["Active"] != null)
            //{   
            //    prepareCreateSurveyViewData(
            //    name: Session["name"] as string,
            //    questionGroupId: Convert.ToInt32(Session["groupId"]),
            //    openDate: DateTime.Parse(Session["startDate"] as string),
            //    daysOpen: Convert.ToInt32(Session["daysToOpen"]),
            //    active: Convert.ToBoolean(Session["Active"]));
            //    return View("CreateSurvey");
            //}
            
            //if (id != 0)
            //{
            //    Survey s = service.getSurvey(id);
            //    prepareCreateSurveyViewData(
            //    name: s.Name,
            //    questionGroupId: s.QuestionGroupId,
            //    openDate: s.OpenDate,
            //    daysOpen: s.DaysOpen,
            //    active: s.Active);
            //}
            //else
            //{
            //    prepareCreateSurveyViewData();
            //}

            FillCreateSurveyData(id);
            return View("CreateSurvey");
        }

        [HttpPost]
        public ActionResult CreateSurvey(FormCollection fc, int id = 0)
        {
            string responseMessage = "";

            
            int? DaysOpen;
            bool? Active;
            string Name = "";
            int QuestionGroupId;
            DateTime? OpenDate;

            int? StudentStatusId = null, programId = null, termId = null, StudentgroupId = null;
            string sessionId="";
            
            string[][] selectedStudents=null;
            if (fc["id"] != null)
            {
                id = Convert.ToInt32(fc["id"]);
            }
            else
            {
                id = 0;            
            }
            
            // Populating Survey Table Parameters
            #region Survey Table Params
            Name = fc["txtSurveyName"];
            QuestionGroupId = Convert.ToInt32(fc["ddlSurveyQuestionGroup"]);
            if (string.IsNullOrEmpty(fc["txtSurveyStartDate"]))
            {
                OpenDate = null;
            }
            else
            {
                OpenDate = DateTime.Parse(fc["txtSurveyStartDate"]).Date;
            }

            if (string.IsNullOrEmpty(fc["DaysToOpen"]))
            {
                DaysOpen = null;
            }
            else
            {
                DaysOpen = Convert.ToInt32(fc["DaysToOpen"]);
            }

            if (string.IsNullOrEmpty(fc.Get("chkBoxActive")))
            {
                Active = false;
            }
            else
            {
                Active = Convert.ToBoolean(fc.Get("chkBoxActive").Contains("true"));
            }
            #endregion

            //Populating Survey Student Selection Params
            #region Survey Students
            //will come from Student Selection Survey Page
            //Checking whether come back from Student Selection Survey or not
            if (
            Session["StudentStatusId"] != null &
            Session["ProgramsId"] != null &
            Session["TermsId"] != null &
            Session["StudentGroupsId"] != null &
            Session["SessionsId"] != null)
            {
                StudentStatusId = Convert.ToInt32(Session["StudentStatusId"]);
                programId = Convert.ToInt32(Session["ProgramsId"]);
                termId = Convert.ToInt32(Session["TermsId"]);
                StudentgroupId = Convert.ToInt32(Session["StudentGroupsId"]);
                sessionId = Session["SessionsId"] as string;
                selectedStudents = (string[][])Session["selectedStudents"];
            }
            #endregion

            try
            {

                if (!string.IsNullOrEmpty(Name))
                {
                    if (id != 0)
                    {
                        Survey newSurvey = new Survey()
                        {
                            SurveyId = id,
                            Name = Name,
                            QuestionGroupId = QuestionGroupId,
                            OpenDate = OpenDate,
                            DaysOpen = DaysOpen,
                            Active = Active.HasValue ? Active.Value : false
                        };
                        if (selectedStudents != null)
                        {
                            newSurvey.Students = new List<SurveyStudent>() { new SurveyStudent() };
                            foreach (string[] student in selectedStudents)
                            {
                                newSurvey.Students.Add(new SurveyStudent() { 
                                    StudentNo = Convert.ToInt32(student[0]),
                                    EnrollmentId=Convert.ToInt32(student[3])
                                });
                            }
                        }
                        service.UpdateSurvey(newSurvey, StudentStatusId, programId, termId, StudentgroupId, sessionId);
                    }
                    else
                    {
                        Survey newSurvey = new Survey()
                        {
                            Name = Name,
                            QuestionGroupId = QuestionGroupId,
                            OpenDate = OpenDate,
                            DaysOpen = DaysOpen,
                            Active = Active.HasValue ? Active.Value : false,
                            Students=new List<SurveyStudent>() { new SurveyStudent() }
                        };
                        if (selectedStudents!=null)
                        {
                            newSurvey.Students = new List<SurveyStudent>() { new SurveyStudent() };
                            foreach (string[] student in selectedStudents)
                            {
                                newSurvey.Students.Add(new SurveyStudent() 
                                {
                                    StudentNo = Convert.ToInt32(student[0]) ,
                                    EnrollmentId=Convert.ToInt32(student[3])

                                });
                            }                            
                        }
                        
                        service.CreateSurvey(newSurvey, StudentStatusId, programId, termId, StudentgroupId, sessionId);
                    }


                    return RedirectToAction("MasterSurvey");

                }
                else
                {
                    responseMessage = "Survey Name should not be Empty";
                    prepareCreateSurveyViewData(name: Name, questionGroupId: QuestionGroupId, openDate: OpenDate, daysOpen: DaysOpen, active: Active, responseMessage: responseMessage);
                    return View();
                }
            }
            catch (Exception error)
            {
                if (null != error.InnerException)
                {
                    responseMessage = error.InnerException.Message;
                }
                else
                {
                    responseMessage = error.Message;
                }

                prepareCreateSurveyViewData(name: Name, questionGroupId: QuestionGroupId, openDate: OpenDate, daysOpen: DaysOpen, active: Active, responseMessage: responseMessage);
                return View();
            }
            finally 
            {
                Session.Remove("StudentStatusId");
                Session.Remove("ProgramsId");
                Session.Remove("TermsId");
                Session.Remove("StudentGroupsId");
                Session.Remove("SessionsId");
                Session.Remove("selectedStudents");
                Session.Remove("name");
                Session.Remove("groupId");
                Session.Remove("startDate");
                Session.Remove("daysToOpen");
                Session.Remove("Active");
                Session.Remove("id");
            }
        }

        private void FillCreateSurveyData(int id=0)
        {
            string name=null;
            int? questionGroupId = null;
            DateTime? OpenDate = null;
            int? daysOpen=null;
            bool active = false;
            string[][] selectedStudents = null;

            if (Session["id"] != null && Convert.ToInt32(Session["id"]) == id)
            {
                name = Session["name"] as string;
                if (Session["groupId"] != null)
                {
                    questionGroupId = Convert.ToInt32(Session["groupId"]);
                }

                if (Session["startDate"] != null)
                {
                    DateTime tempDate;
                    
                    if (DateTime.TryParse(Session["startDate"] as string,out tempDate))
                    {
                        OpenDate = tempDate;
                    }
                }

                if (Session["daysToOpen"] != null)
                {
                    daysOpen = Convert.ToInt32(Session["daysToOpen"]);
                }

                if (Session["selectedStudents"] != null)
                {
                    selectedStudents = (string[][])Session["selectedStudents"];
                }

                if (Session["Active"] != null)
                {
                    active = Convert.ToBoolean(Session["Active"]);
                }

                prepareCreateSurveyViewData(
                id:id,
                name: name,
                questionGroupId: questionGroupId,
                openDate: OpenDate,
                daysOpen: daysOpen,
                selectedStudents: selectedStudents,
                active: active);

            }
            else if (id != 0)
            {
                Survey s = service.getSurvey(id);
                IList<SurveyStudent> studentslist = service.getStudentsBySurveyId(id);
                
                selectedStudents = new string[studentslist.Count][];
                for (int i = 0; i < studentslist.Count; ++i)
                {
                    selectedStudents[i] = new string[4];
                }

                for (int i = 0; i < studentslist.Count; i++)
                {
                    selectedStudents[i][0] = studentslist[i].StudentNo.ToString();
                    selectedStudents[i][1] = studentslist[i].LastName.ToString();
                    selectedStudents[i][2] = studentslist[i].FirstName.ToString();
                    selectedStudents[i][3] = studentslist[i].EnrollmentId.ToString();
                }

                Session["selectedStudents"] = selectedStudents;
                
                prepareCreateSurveyViewData(
                id: s.SurveyId,
                name: s.Name,
                questionGroupId: s.QuestionGroupId,
                openDate: s.OpenDate,
                daysOpen: s.DaysOpen,
                selectedStudents: selectedStudents,
                active: active);
            }
            else
            {
                prepareCreateSurveyViewData();
            }
            
        }

        private void prepareCreateSurveyViewData(int id=0,string name = "", int? questionGroupId = null, DateTime? openDate = null, int? daysOpen = null, bool? active = null, string responseMessage = "",string[][] selectedStudents=null)
        {
            ViewData["id"] = id;
            ViewData["Name"] = name;
            ViewData["QuestionGroupsList"] = new SelectList(service.GetAllQuestionGroups(false), "QuestionGroupID", "QuestionGroupCode", questionGroupId);
            ViewData["OpenDate"] = openDate != null ? openDate.ToString() : string.Empty;
            ViewData["DaysOpen"] = daysOpen != null ? daysOpen.ToString() : string.Empty;

            if (selectedStudents != null)
            {
                ViewData["No_of_Selected_Students"] = selectedStudents.Count();
            }
            else
            {
                ViewData["No_of_Selected_Students"] = 0;
            }

            ViewData["Active"] = active.HasValue ? active.Value : false;
            ViewData["ResponseMessage"] = responseMessage;
            //ViewData["Active"] = active != null ? (active==true?"checked": string.Empty):string.Empty;
        }

        private void prepareCreateQuestionGroupViewData(int id = 0, string code = "", bool? admissions = null, bool? register = null, bool? financialAid = null, bool? placement = null, string responseMessage = "")
        {
            ViewData["id"] = id;
            ViewData["Code"] = code;
            ViewData["Admimssion"] = admissions.HasValue ? admissions.Value : false;
            ViewData["Register"] = register.HasValue ? admissions.Value : false;
            ViewData["FinancialAid"] = financialAid.HasValue ? financialAid.Value : false;
            ViewData["Placement"] = placement.HasValue ? placement.Value : false;
            ViewData["ResponseMessage"] = responseMessage;
            //ViewData["Active"] = active != null ? (active==true?"checked": string.Empty):string.Empty;
        }

        public ActionResult UpdateSurvey()
        {
            return View();
        }

        public ActionResult InActiveSurvey()
        {
            return View();
        }

        private void prepareStudentSelectionSurveyViewData()
        {
            #region Populate ViewData
            ViewData["StatusList"] = commonService.GetStudentStatusList(false);
            ViewData["ProgramsList"] = commonService.GetPrograms(false);
            ViewData["TermsList"] = commonService.GetTerms();
            ViewData["StudentGroupsList"] = commonService.GetStudentGroups(false);
            ViewData["SessionsList"] = commonService.GetSessions(false);
            #endregion
        }

        [HttpGet]
        public ActionResult StudentSelectionSurvey(string name, string startDate, int? groupId = null, int? daysToOpen = null, bool active = false,int id=0)
        {
            prepareStudentSelectionSurveyViewData();
            return View();
        }

        public ActionResult ListSelectedStudents(JqGridRequest request,int id=0)
        {
            IList<SurveyStudent> selectedStudents = new List<SurveyStudent>();

            if (Session["selectedStudents"]!=null)
            {
                string[][] studentsarray = (string[][])Session["selectedStudents"];

                for (int i = 0; i < studentsarray.Count(); i++)
                {
                    selectedStudents.Add(new SurveyStudent() 
                    {
                         StudentNo=Convert.ToInt32(studentsarray[i][0]),
                         LastName = studentsarray[i][1],
                         FirstName=studentsarray[i][2],
                         EnrollmentId=Convert.ToInt32(studentsarray[i][3])
                    });
                }

            }

            if (id!=0)
            {
                 selectedStudents=service.getStudentsBySurveyId(id);                
            }

            var viewModelList = from student in selectedStudents
                                select new SelectedStudentsGridViewModel{ 
                                 EnrollmentId=student.EnrollmentId,
                                 StudentId=student.StudentNo,
                                 LastName=student.LastName,
                                 FirstName=student.FirstName
                                };

            IList<SelectedStudentsGridViewModel> sortedList = PagingSorting<SelectedStudentsGridViewModel>.getSortedList(viewModelList.ToList(), request.SortingName, request.SortingOrder.ToString());
            IList<SelectedStudentsGridViewModel> sortedPagedList = PagingSorting<SelectedStudentsGridViewModel>.getPagedRecords(sortedList, request.PageIndex, request.RecordsCount);

            int totalRecordsCount = viewModelList.Count();

            JqGridResponse response = new JqGridResponse()
            {
                TotalPagesCount = (int)Math.Ceiling((float)totalRecordsCount / (float)request.RecordsCount),
                PageIndex = request.PageIndex,
                TotalRecordsCount = totalRecordsCount
            };

            response.Records.AddRange(from studentRecord in sortedPagedList
                                      select new JqGridRecord<SelectedStudentsGridViewModel>(Convert.ToString(studentRecord.StudentId), studentRecord));

            return new JqGridJsonResult() { Data = response };

        }

        public ActionResult ListFilteredStudents(JqGridRequest request, int surveyId = 0, string StudentStatusId = "", string ProgramsId = "", string TermsId = "", string StudentGroupId = "", string SessionsId = "")
        {
            StudentStatusId = string.IsNullOrEmpty(StudentStatusId) ? "1" : StudentStatusId;
            ProgramsId = string.IsNullOrEmpty(ProgramsId) ? "24" : ProgramsId;
            TermsId = string.IsNullOrEmpty(TermsId) ? "336" : TermsId;
            StudentGroupId = string.IsNullOrEmpty(StudentGroupId) ? "40" : StudentGroupId;
            SessionsId = string.IsNullOrEmpty(SessionsId) ? "A" : SessionsId;

            IList<SurveyStudent> surveysStudentlist = service.getFilteredStudents(surveyId,Convert.ToInt32(StudentStatusId), Convert.ToInt32(ProgramsId), Convert.ToInt32(TermsId), Convert.ToInt32(StudentGroupId), SessionsId);

            var viewModelList = (from surveyStudent in surveysStudentlist
                                 select new SurveyStudentGridViewModel()
                                 {
                                     SurveyStudentId = surveyStudent.StudentNo,
                                     FirstName = surveyStudent.FirstName,
                                     LastName = surveyStudent.LastName,
                                     StartDate = surveyStudent.TermStartDate,
                                     Program = surveyStudent.ProgramCode,
                                     Status = surveyStudent.StudentStatus,
                                     EnrollmentId=surveyStudent.EnrollmentId
                                 }).ToList();

            IList<SurveyStudentGridViewModel> sortedList = PagingSorting<SurveyStudentGridViewModel>.getSortedList(viewModelList, request.SortingName, request.SortingOrder.ToString());
            IList<SurveyStudentGridViewModel> sortedPagedList = PagingSorting<SurveyStudentGridViewModel>.getPagedRecords(sortedList, request.PageIndex, request.RecordsCount);

            int totalRecordsCount = viewModelList.Count;

            JqGridResponse response = new JqGridResponse()
            {
                TotalPagesCount = (int)Math.Ceiling((float)totalRecordsCount / (float)request.RecordsCount),
                PageIndex = request.PageIndex,
                TotalRecordsCount = totalRecordsCount
            };

            response.Records.AddRange(from survey in sortedPagedList
                                      select new JqGridRecord<SurveyStudentGridViewModel>(Convert.ToString(survey.SurveyStudentId), survey));

            return new JqGridJsonResult() { Data = response };
        }

        [HttpPost]
        public ActionResult StudentSelectionSurvey(FormCollection collection, [FromJson]string[][] studentsArray, string name, string startDate,int? groupId=null, int? daysToOpen=null, bool active=false, int id = 0)
        {
            Session["StudentStatusId"] = collection["StudentStatusList"];
            Session["ProgramsId"] = collection["Programs"];
            Session["TermsId"] = collection["Terms"];
            Session["StudentGroupsId"] = collection["StudentGroups"];
            Session["SessionsId"] = collection["Sessions"];
            Session["selectedStudents"] = studentsArray;
            Session["startDate"] = startDate;
            Session["id"] = id;
            Session["name"] = name;
            Session["groupId"] = groupId;
            Session["startDate"] = startDate;
            Session["daysToOpen"] = daysToOpen;
            Session["Active"] = active;            
            return Json(new { redirectToUrl = Url.Action("CreateSurvey", new {id = id }) });
        }

        public void prepareCourseSurveySchedualViewData(string message="")
        {
             IList<Course> coursesList= commonService.GetCourses(false);
             IList<Session> sessionsList = commonService.GetSessions(false);
             IList<StudentStatus> studentStatusesList = commonService.GetStudentStatusList(false);
             IList<QuestionGroup> groupsList = service.GetAllQuestionGroups(false, false, false);

             if (coursesList==null)
             {
                 coursesList = new List<Course>() {};
             }
             if (sessionsList==null)
             {
                 sessionsList = new List<Session>();                 
             }
             if (studentStatusesList==null)
             {
                 studentStatusesList = new List<StudentStatus>();
             }
             if (groupsList==null)
             {
                 groupsList = new List<QuestionGroup>() {                 
                 };                 
             }
             ViewData["CoursesList"] = coursesList;
             ViewData["SessionsList"] = sessionsList;
             ViewData["StatusList"] = studentStatusesList;
             ViewData["GroupsList"] = groupsList;
             ViewData["ResponseMessage"] = message;
        }

        [HttpGet]
        public ActionResult CourseSurveySchedule()
        {
            prepareCourseSurveySchedualViewData();
            return View();
        }

        [HttpPost]
        public ActionResult CourseSurveySchedule(FormCollection collection)
        {
            int DaysToOpen=0,DaysOpen=0;
            int? CourseId = null, QuestionGroupId=null;
            char? Session=null;
            string StatusIdsString;
            bool Active = false;

            if (collection["Course"] != null)
            {
                CourseId = Convert.ToInt32(collection["Course"].ToString());
            }
            else
            { 
                prepareCourseSurveySchedualViewData("Course could not be empty");
                return View();
            }

            if (collection["Session"] != null)
            {
                Session = Convert.ToChar(collection["Session"]);
            }
            else
            {
                prepareCourseSurveySchedualViewData("Session could not be empty");
                return View();            
            }

            int.TryParse(collection["DaysToOpen"],out DaysToOpen);
            int.TryParse(collection["DaysOpen"], out DaysOpen);
            StatusIdsString = collection["inputSelectStudentStatuses"] as string;
            if (collection["Question Group"] != null)
            {
                QuestionGroupId = Convert.ToInt32(collection["Question Group"]);
            }

            if (collection["chkBoxActive"]!=null&&collection["chkBoxActive"].ToString().Contains("true"))
            {
                Active = true;                
            }

            SurveyCourseSchedule scs=new SurveyCourseSchedule()
            {
                 CourseInfo=new Course(){ CourseNo=CourseId},
                 SessionInfo=new Session(){ SessionInfo=Session+""},
                 DaysToOpen=DaysToOpen,
                 DaysOpen=DaysOpen,
                 StudentStatusesString=StatusIdsString,
                 QuestionGroupInfo=new QuestionGroup(){ QuestionGroupID=QuestionGroupId.Value},
                 Active=Active
            };
            try
            {
                service.CreateCourseSurveySchedule(scs);
                prepareCourseSurveySchedualViewData("Saved Successfully");
                return View();
            }
            catch (Exception error)
            {
                prepareCourseSurveySchedualViewData(error.Message);
                return View();
            }
        }

        #endregion

    }
}