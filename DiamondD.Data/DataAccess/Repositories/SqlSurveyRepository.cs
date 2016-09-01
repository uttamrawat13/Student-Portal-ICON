using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using System.Data;
using System.Data.SqlClient;
using DiamondD.Data.DataAccess.Survey;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlSurveyRepository : ISurveyRepository
    {
        #region Question Group

        public int CreateQuestionGroup(QuestionGroup group)
        {
            SqlConnection con = (SqlConnection)this.CreateDatabase().CreateConnection();

            StringBuilder queryInsert = new StringBuilder();
            StringBuilder querySelect = new StringBuilder();
            StringBuilder queryIdentity = new StringBuilder();

            querySelect.AppendFormat("SELECT COUNT(*) FROM SurveyQuestionGroupMaster WHERE (QuestionGroupCode = '{0}')", group.QuestionGroupCode);
            queryInsert.AppendFormat(
                    "INSERT INTO SurveyQuestionGroupMaster(QuestionGroupCode, Admissions, Registrar, FinancialAid, Placement, Active) ")
                    .AppendFormat(" VALUES('{0}','{1}','{2}','{3}','{4}', '{5}'); ", group.QuestionGroupCode, group.Admissions == true ? 'Y' : 'N', group.Registrar == true ? 'Y' : 'N', group.FinancialAid == true ? 'Y' : 'N', group.Placement == true ? 'Y' : 'N', group.Active == true ? 'Y' : 'N');
            queryIdentity.AppendFormat("Select CAST( IDENT_CURRENT('SurveyQuestionGroupMaster') AS Int)");

            int? noOfRecords;
            int? identity;

            con.Open();
            SqlTransaction transaction = con.BeginTransaction();

            SqlCommand cmdSelect = new SqlCommand(querySelect.ToString(), con,transaction);
            SqlCommand cmdInsert = new SqlCommand(queryInsert.ToString(), con,transaction);
            SqlCommand cmdIdentity = new SqlCommand(queryIdentity.ToString(), con,transaction);

            try
            {
                noOfRecords = (int?)cmdSelect.ExecuteScalar();
                if (noOfRecords.HasValue && noOfRecords.Value == 0)
                {
                    cmdInsert.ExecuteNonQuery();

                    identity = (int?)cmdIdentity.ExecuteScalar();
                    transaction.Commit();
                    return identity.Value;
                }
                else
                {
                    throw new Exception("The code '" + group.QuestionGroupCode + "' already exists.");
                }
            }
            catch (Exception error)
            {
                transaction.Rollback();

                throw error;
            }
            finally
            {
                con.Close();
            }

            
        }

        public bool UpdateQuestionGroup(QuestionGroup group)
        {
            StringBuilder queryUpdate = new StringBuilder();
            queryUpdate.AppendFormat(
                @"Update SurveyQuestionGroupMaster 
                      set QuestionGroupCode='{0}',
                          Admissions='{1}',
                          Registrar='{2}',
                          FinancialAid='{3}',
                          Placement='{4}',
                          Active='{5}'
                      where QuestionGroupID={6}",
                      group.QuestionGroupCode,
                      group.Admissions == true ? 'Y' : 'N',
                      group.Registrar == true ? 'Y' : 'N',
                      group.FinancialAid == true ? 'Y' : 'N',
                      group.Placement == true ? 'Y' : 'N',
                      group.Active == true ? 'Y' : 'N',
                      group.QuestionGroupID
                      );

            this.ExecuteNonQuery(CommandType.Text, queryUpdate.ToString());
            return true;
        }

        public bool UpdateQuestionGroupwithQuestions(QuestionGroup group) {
            SqlConnection con = (SqlConnection)this.CreateDatabase().CreateConnection();
            con.Open();
            SqlTransaction transaction = (SqlTransaction)con.BeginTransaction();
            try
            {
                //Updating Group
                StringBuilder sbUpdateGroup = new StringBuilder();
                sbUpdateGroup.AppendFormat(@"Update SurveyQuestionGroupMaster
                                        set QuestionGroupCode=@code,
                                        Admissions=@admissions,
                                        Registrar=@registrar,
                                        FinancialAid=@financialAid,
                                        Placement=@placement,
                                        Active=@active
                                        where QuestionGroupID=@groupId");

                SqlCommand cmdUpdateGroup = new SqlCommand(sbUpdateGroup.ToString(),con,transaction);

                cmdUpdateGroup.Parameters.AddWithValue("@code", group.QuestionGroupCode);
                cmdUpdateGroup.Parameters.AddWithValue("@admissions", group.Admissions ? 'Y' : 'N');
                cmdUpdateGroup.Parameters.AddWithValue("@registrar", group.Registrar? 'Y' : 'N');
                cmdUpdateGroup.Parameters.AddWithValue("@financialAid", group.FinancialAid? 'Y' : 'N');
                cmdUpdateGroup.Parameters.AddWithValue("@placement", group.Placement? 'Y' : 'N');
                cmdUpdateGroup.Parameters.AddWithValue("@active", group.Active? 'Y' : 'N');
                cmdUpdateGroup.Parameters.AddWithValue("@groupId", group.QuestionGroupID);

                cmdUpdateGroup.ExecuteNonQuery();
                //this.ExecuteNonQuery(cmdUpdateGroup);

                //Updating Questions

                StringBuilder sbInsertQuestion = new StringBuilder();
                sbInsertQuestion.AppendFormat(@"Insert into SurveyQuestionMaster(QuestionGroupID,Question,[Order],[Numeric],Active)
                                                values(@groupId,@question,@order,@numeric,@active)");
                SqlCommand cmdInsertQuestion = new SqlCommand(sbInsertQuestion.ToString(), con, transaction);

                cmdInsertQuestion.Parameters.Add("@groupId",SqlDbType.Int);
                cmdInsertQuestion.Parameters.Add("@question", SqlDbType.NVarChar);
                cmdInsertQuestion.Parameters.Add("@order", SqlDbType.Int);
                cmdInsertQuestion.Parameters.Add("@numeric", SqlDbType.NChar);
                cmdInsertQuestion.Parameters.Add("@active", SqlDbType.NChar); 




                StringBuilder sbUpdateQuestion = new StringBuilder();
                sbUpdateQuestion.AppendFormat(@"update SurveyQuestionMaster
                                                set Question=@question,
                                                [Order]=@order,
                                                [Numeric]=@numeric,
                                                [Active]=@active
                                                where QuestionID=@questionId

                                                Delete SurveyQuestionMaster
                                                where QuestionID not in (select * from split(@allQuestionIds,','))
                                                ");

                SqlCommand cmdUpdateQuestion = new SqlCommand(sbUpdateQuestion.ToString(), con, transaction);

                cmdUpdateQuestion.Parameters.Add("@questionId",SqlDbType.Int);
                cmdUpdateQuestion.Parameters.Add("@question",SqlDbType.NVarChar);
                cmdUpdateQuestion.Parameters.Add("@order",SqlDbType.Int);
                cmdUpdateQuestion.Parameters.Add("@numeric",SqlDbType.NChar);
                cmdUpdateQuestion.Parameters.Add("@active", SqlDbType.NChar);
                cmdUpdateQuestion.Parameters.Add("@allQuestionIds", SqlDbType.NChar);



                foreach (var question in group.Questions)
                {
                    if (question.QuestionID == 0)
                    {
                        cmdInsertQuestion.Parameters["@groupId"].Value= group.QuestionGroupID;
                        cmdInsertQuestion.Parameters["@question"].Value= question.QuestionText;
                        cmdInsertQuestion.Parameters["@order"].Value= question.Order;
                        cmdInsertQuestion.Parameters["@numeric"].Value= question.Numeric ? 'Y' : 'N';
                        cmdInsertQuestion.Parameters["@active"].Value= question.Active ? 'Y' : 'N';
                        cmdInsertQuestion.ExecuteNonQuery();
                        //this.ExecuteNonQuery(cmdInsertQuestion);
                    }
                    else
                    {                        
                        cmdUpdateQuestion.Parameters["@questionId"].Value= question.QuestionID;
                        cmdUpdateQuestion.Parameters["@question"].Value= question.QuestionText;
                        cmdUpdateQuestion.Parameters["@order"].Value= question.Order;
                        cmdUpdateQuestion.Parameters["@numeric"].Value= question.Numeric ? 'Y' : 'N';
                        cmdUpdateQuestion.Parameters["@active"].Value= question.Active ? 'Y' : 'N';
                        cmdUpdateQuestion.Parameters["@allQuestionIds"].Value = String.Join(",", (from q in @group.Questions select q.QuestionID.ToString()).ToArray());
                        cmdUpdateQuestion.ExecuteNonQuery();
                    }
                }

                transaction.Commit();
                return true;
            }
            catch (Exception error)
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                con.Close();
            }
            
            
        }

        public IList<QuestionGroup> GetAllQuestionGroups(bool fetchActiveQuestionGroupsOnly = true, bool fetchQuestions = false, bool fetchActiveQuestionsOnly = true)
        {
            IList<QuestionGroup> questionGroupList = new List<QuestionGroup>();

            var sql = new StringBuilder();
            sql.Append("SELECT QuestionGroupId, QuestionGroupCode, Admissions, Registrar, FinancialAid, Placement, Active FROM SurveyQuestionGroupMaster ");
            if (fetchActiveQuestionGroupsOnly)
                sql.Append(" WHERE Active = 'Y' ");


            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {
                while (reader.Read())
                {
                    int qgColIndex = -1;
                    var newQuestionGroup = new QuestionGroup()
                    {
                        QuestionGroupID = reader.GetInt32(++qgColIndex),
                        QuestionGroupCode = reader.GetString(++qgColIndex),
                        Admissions = reader.GetString(++qgColIndex) == "Y" ? true : false,
                        Registrar = reader.GetString(++qgColIndex) == "Y" ? true : false,
                        FinancialAid = reader.GetString(++qgColIndex) == "Y" ? true : false,
                        Placement = reader.GetString(++qgColIndex) == "Y" ? true : false,
                        Active = reader.GetString(++qgColIndex) == "Y" ? true : false
                    };

                    if (fetchQuestions)
                    {
                        var questions = new List<Question>();

                        var sqlQuestion = new StringBuilder();
                        sql.Append("SELECT QuestionId, Question, [Order], Numeric, Active FROM SurveyQuestionMaster ");
                        if (fetchActiveQuestionsOnly)
                            sql.Append(" WHERE (Actuve = 'Y') AND QuestionGroupId = {0} ", newQuestionGroup.QuestionGroupID, 1);

                        while (reader.Read())
                        {
                            int qColIndex = -1;
                            var newQuestion = new Question
                            {
                                QuestionID = reader.GetInt32(++qColIndex),
                                QuestionText = reader.GetString(++qColIndex),
                                Order = reader.GetInt32(++qColIndex),
                                Numeric = reader.GetString(++qColIndex).ToUpper() == "Y" ? true : false,
                                Active = reader.GetString(++qColIndex).ToUpper() == "Y" ? true : false
                            };
                            questions.Add(newQuestion);
                        }

                        newQuestionGroup.Questions = questions;
                    }

                    questionGroupList.Add(newQuestionGroup);
                }
            }

            return questionGroupList;
        }

        public Survey.QuestionGroup getQuestionsGroup(int id)
        {
            Survey.QuestionGroup group = null;

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT QuestionGroupId, QuestionGroupCode, Admissions, Registrar, FinancialAid, Placement, Active FROM SurveyQuestionGroupMaster ");
            sql.Append(" WHERE QuestionGroupId=@id");
            SqlCommand cmd = new SqlCommand(sql.ToString());
            cmd.Parameters.Add(new SqlParameter("@id", id));

            using (IDataReader reader = this.ExecuteReader(cmd))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    group = new Survey.QuestionGroup();

                    group.QuestionGroupID = reader.GetInt32(++colIndex);
                    group.QuestionGroupCode = reader.GetString(++colIndex);

                    if (!reader.IsDBNull(reader.GetOrdinal("Admissions")))
                    {
                        group.Admissions = reader.GetString(++colIndex) == "Y" ? true : false;
                    }
                    else
                    {
                        ++colIndex;
                    }

                    if (!reader.IsDBNull(reader.GetOrdinal("Registrar")))
                    {
                        group.Registrar = reader.GetString(++colIndex) == "Y" ? true : false;
                    }
                    else
                    {
                        ++colIndex;
                    }

                    if (!reader.IsDBNull(reader.GetOrdinal("FinancialAid")))
                    {
                        group.FinancialAid = reader.GetString(++colIndex) == "Y" ? true : false;
                    }
                    else
                    {
                        ++colIndex;
                    }

                    if (!reader.IsDBNull(reader.GetOrdinal("Placement")))
                    {
                        group.Placement = reader.GetString(++colIndex) == "Y" ? true : false;
                    }
                    else
                    {
                        ++colIndex;
                    }

                    if (!reader.IsDBNull(reader.GetOrdinal("Active")))
                    {
                        group.Active = reader.GetString(++colIndex) == "Y" ? true : false;
                    }
                    else
                    {
                        ++colIndex;
                    }

                }
            }
            return group;
        }

        #endregion

        #region Survey Methods

        public bool CreateSurvey(Survey.Survey survey)
        {
            string commaSeparatedStudentIdsList = "";
            string commaSeparatedEnrolmentIdsList = "";
            if (survey.Students!=null)
            {
                commaSeparatedStudentIdsList = String.Join(",", (from s in survey.Students
                                                                 where s.EnrollmentId!=0 && s.StudentNo!=0
                                                                        select s.StudentNo.ToString()).ToArray());


                commaSeparatedEnrolmentIdsList = String.Join(",", (from s in survey.Students
                                                                 where s.EnrollmentId != 0 && s.StudentNo != 0
                                                                 select s.EnrollmentId.ToString()).ToArray());

            }
            
            SqlCommand surveyCommand = new SqlCommand("CreateSurvey");
            surveyCommand.CommandType = CommandType.StoredProcedure;
            
                surveyCommand.Parameters.AddWithValue("@StudentIdsList", commaSeparatedStudentIdsList);
                surveyCommand.Parameters.AddWithValue("@EnrolmentIdsList", commaSeparatedEnrolmentIdsList);
            
            
            surveyCommand.Parameters.AddWithValue("@SurveyName", survey.Name);
            surveyCommand.Parameters.AddWithValue("@QuestionGroupId", survey.QuestionGroupId);

            if (survey.OpenDate == null)
            {
                surveyCommand.Parameters.AddWithValue("@OpenDate", DBNull.Value);
            }
            else
            {
                surveyCommand.Parameters.AddWithValue("@OpenDate", survey.OpenDate);
            }

            if (survey.DaysOpen == null)
            {
                surveyCommand.Parameters.AddWithValue("@DaysOpen", DBNull.Value);
            }
            else
            {
                surveyCommand.Parameters.AddWithValue("@DaysOpen", survey.DaysOpen);
            }

            surveyCommand.Parameters.AddWithValue("@Active", survey.Active == true ? 'Y' : 'N');

            if (survey.CourseOfferingNo == null)
            {
                surveyCommand.Parameters.AddWithValue("@CourseOfferingNo", DBNull.Value);
            }
            else
            {
                surveyCommand.Parameters.AddWithValue("@CourseOfferingNo", survey.CourseOfferingNo);
            }

            surveyCommand.Parameters.AddWithValue("@Submitted", survey.Submitted);

            int efectedRows=this.ExecuteNonQuery(surveyCommand);

            return efectedRows>0;
            
        }


        public bool UpdateSurvey(Survey.Survey survey)
        {
            Database db = this.CreateDatabase();
            string commaSeparatedStudentIdsList = "";
            string commaSeparatedEnrolmentIdsList = "";
            if (survey.Students != null)
            {
                commaSeparatedStudentIdsList = String.Join(",", (from s in survey.Students
                                                                 where s.EnrollmentId != 0 && s.StudentNo != 0
                                                                 select s.StudentNo.ToString()).ToArray());


                commaSeparatedEnrolmentIdsList = String.Join(",", (from s in survey.Students
                                                                   where s.EnrollmentId != 0 && s.StudentNo != 0
                                                                   select s.EnrollmentId.ToString()).ToArray());
            }
            #region Survey Update Query
            SqlCommand surveyUpdateCommand = new SqlCommand("UpdateSurvey");
            surveyUpdateCommand.CommandType=CommandType.StoredProcedure;

            surveyUpdateCommand.Parameters.AddWithValue("@StudentIdsList",commaSeparatedStudentIdsList);
            surveyUpdateCommand.Parameters.AddWithValue("@EnrolmentIdsList", commaSeparatedEnrolmentIdsList);

            surveyUpdateCommand.Parameters.AddWithValue("@SurveyId",survey.SurveyId);
            surveyUpdateCommand.Parameters.AddWithValue("@SurveyName",survey.Name);
            surveyUpdateCommand.Parameters.AddWithValue("@QuestionGroupId",survey.QuestionGroupId);

            if (survey.OpenDate == null)
            {
                surveyUpdateCommand.Parameters.AddWithValue("@OpenDate", DBNull.Value);
            }
            else
            {
                surveyUpdateCommand.Parameters.AddWithValue("@OpenDate", survey.OpenDate);
            }

            if (survey.DaysOpen==null)
            {
                surveyUpdateCommand.Parameters.AddWithValue("@DaysOpen", DBNull.Value);
            }
            else
            {
                surveyUpdateCommand.Parameters.AddWithValue("@DaysOpen", survey.DaysOpen);            
            }
            
            surveyUpdateCommand.Parameters.AddWithValue("@Active",survey.Active==true?'Y':'N');
            
            if (survey.CourseOfferingNo == null)
            {
                surveyUpdateCommand.Parameters.AddWithValue("@CourseOfferingNo", DBNull.Value);
            }
            else
            {
                surveyUpdateCommand.Parameters.AddWithValue("@CourseOfferingNo", survey.CourseOfferingNo);
            }
            
            surveyUpdateCommand.Parameters.AddWithValue("@Submitted", survey.Submitted);
            
            #endregion

            this.ExecuteNonQuery(surveyUpdateCommand);
            return true;
        }

        public IList<Survey.Survey> GetAllSurveys(bool fetchActiveOnly = true)
        {
            var surveyList = new List<Survey.Survey>();

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT SurveyID, SurveyName, OpenDate, Active FROM Surveys ");
            if (fetchActiveOnly)
                sql.Append(" WHERE Active='{0}' ");
            sql.Append(" ORDER BY Active DESC, OpenDate DESC ");

            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var survey = new Survey.Survey();
                    survey.SurveyId = reader.GetInt32(++colIndex);
                    survey.Name = reader.GetString(++colIndex);
                    if (!reader.IsDBNull(reader.GetOrdinal("OpenDate")))
                    {
                        survey.OpenDate = reader.GetDateTime(++colIndex);
                    }
                    else
                    {
                        ++colIndex;
                    }

                    if (!reader.IsDBNull(reader.GetOrdinal("Active")))
                    {
                        survey.Active = reader.GetString(++colIndex).ToUpper() == "Y" ? true : false;
                    }
                    else
                    {
                        ++colIndex;
                    }

                    surveyList.Add(survey);
                }
            }
            return surveyList;
        }

        public Survey.Survey getSurvey(int id)
        {
            Survey.Survey survey = null;

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT SurveyID, SurveyName, OpenDate,DaysOpen, Active FROM Surveys ");
            sql.Append(" WHERE SurveyID=@id");
            SqlCommand cmd = new SqlCommand(sql.ToString());
            cmd.Parameters.Add(new SqlParameter("@id", id));

            using (IDataReader reader = this.ExecuteReader(cmd))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    survey = new Survey.Survey();

                    survey.SurveyId = reader.GetInt32(++colIndex);
                    survey.Name = reader.GetString(++colIndex);
                    if (!reader.IsDBNull(reader.GetOrdinal("OpenDate")))
                    {
                        survey.OpenDate = reader.GetDateTime(++colIndex);
                    }
                    else
                    {
                        ++colIndex;
                    }

                    if (!reader.IsDBNull(reader.GetOrdinal("DaysOpen")))
                    {
                        survey.DaysOpen = reader.GetInt32(++colIndex);
                    }
                    else
                    {
                        ++colIndex;
                    }

                    if (!reader.IsDBNull(reader.GetOrdinal("Active")))
                    {
                        survey.Active = reader.GetString(++colIndex).ToUpper() == "Y" ? true : false;
                    }
                    else
                    {
                        ++colIndex;
                    }
                }
            }
            return survey;
        }

        public bool CreateCourseSurveySchedule(SurveyCourseSchedule schedule)
        {
            StringBuilder querySelect = new StringBuilder();
            querySelect.AppendFormat("SELECT COUNT(*) FROM SurveyCourseSchedule WHERE CourseNo = {0} AND [Session] = '{1}' ",
                schedule.CourseInfo.CourseNo, schedule.SessionInfo.SessionInfo);

            int? noOfRecords;
            noOfRecords = (int?)this.ExecuteScalar(CommandType.Text, querySelect.ToString());

            if (noOfRecords.HasValue && noOfRecords.Value == 0)
            {
                StringBuilder queryInsert = new StringBuilder();
                queryInsert.AppendFormat(
                    "INSERT INTO SurveyCourseSchedule(CourseNo, Session, DaysToStart, DaysOpen, StudentStatusIds, QuestionGroupID,Active) ")
                    .AppendFormat(" VALUES({0},'{1}',{2},{3},'{4}', {5},'{6}')",
                        schedule.CourseInfo.CourseNo,
                        schedule.SessionInfo.SessionInfo,
                        schedule.DaysToOpen,
                        schedule.DaysOpen,
                        schedule.StudentStatusesString,
                        schedule.QuestionGroupInfo.QuestionGroupID,schedule.Active?'Y':'N');

                int rowsAffected = this.ExecuteNonQuery(CommandType.Text, queryInsert.ToString());
                if (rowsAffected != 0)
                    return true;
                else
                    return false;
            }
            else
            {
                throw new Exception("There is already a survey against this Course ('" +
                    schedule.CourseInfo.Code + "') and Session ('" + schedule.SessionInfo.SessionInfo + "')");
            }
        }

        public IList<SurveyStudent> getFilteredStudents(int surveyId,int statusId, int programNo, int termId, int groupId, string session)
        {
            StringBuilder sql = new StringBuilder();
            List<SurveyStudent> students = null;

//            sql.AppendFormat(
//                            @"Select  s.StudentNo as StudentID,se.StudentEnrollmentID, s.LastName,s.FirstName,t.TermBeginDate, ss.StudentStatus, p.ProgramCode
//                            from Students as s
//                            inner join StudentEnrollment as se on s.StudentNo =se.StudentNo
//                            inner join StudentStatus as ss on ss.StudentStatusID =s.StudentStatusID
//                            inner join Program as p on p.ProgramNo = s.ProgramNo
//                            inner join Term as t on t.TermID = se.EnrollmentFirstTermID
//                            inner join StudentGroup as sg on s.StudentGroupID=sg.GroupID
//                            inner join Session on Session.Session = s.Session
//                            where ss.StudentStatusID=@studentStatusId and p.ProgramNo=@programNo and t.TermID=@termId and sg.GroupID=@groupId and Session.Session=@session
//                            AND CONCAT(s.StudentNo, '-',se.StudentEnrollmentID) NOT IN (
//                            SELECT CONCAT(StudentID, '-', EnrolmentID)
//	                        FROM SurveyStudents where SurveyID=@surveyId)");

            sql.AppendFormat(
                            @"Select  s.StudentNo as StudentID,se.StudentEnrollmentID, s.LastName,s.FirstName,t.TermBeginDate, ss.StudentStatus, p.ProgramCode
                            from Students as s
                            inner join StudentEnrollment as se on s.StudentNo =se.StudentNo
                            inner join StudentStatus as ss on ss.StudentStatusID =s.StudentStatusID
                            inner join Program as p on p.ProgramNo = s.ProgramNo
                            inner join Term as t on t.TermID = se.EnrollmentFirstTermID
                            inner join StudentGroup as sg on s.StudentGroupID=sg.GroupID
                            inner join Session on Session.Session = s.Session
                            where ss.StudentStatusID=@studentStatusId and p.ProgramNo=@programNo and t.TermID=@termId and sg.GroupID=@groupId and Session.Session=@session");

            SqlCommand cmd = new SqlCommand(sql.ToString());
            cmd.Parameters.Add(new SqlParameter("@studentStatusId", statusId));
            cmd.Parameters.Add(new SqlParameter("@programNo", programNo));
            cmd.Parameters.Add(new SqlParameter("@termId", termId));
            cmd.Parameters.Add(new SqlParameter("@groupId", groupId));
            cmd.Parameters.Add(new SqlParameter("@session", session));
            //cmd.Parameters.Add(new SqlParameter("@surveyId", surveyId));
            using (IDataReader reader = this.ExecuteReader(cmd))
            {
                students = new List<SurveyStudent>();
                while (reader.Read())
                {
                    int colIndex = -1;
                    SurveyStudent ss = new SurveyStudent()
                    {
                        StudentNo = reader.GetInt32(++colIndex),
                        EnrollmentId=reader.GetInt32(++colIndex),
                        LastName = reader.GetString(++colIndex),
                        FirstName = reader.GetString(++colIndex),
                        TermStartDate = reader.GetDateTime(++colIndex),
                        StudentStatus = reader.GetString(++colIndex),
                        ProgramCode = reader.GetString(++colIndex)
                    };
                    students.Add(ss);
                }
            }
            return students;
        }

        public IList<SurveyStudent> getStudentsBySurveyId(int SurveyId)
        {
            StringBuilder sql = new StringBuilder();
            List<SurveyStudent> students = null;
            sql.AppendFormat(
                            @"Select s.StudentNo,s.LastName,s.FirstName,se.StudentEnrollmentID
                              From SurveyStudents as ss
                              inner join Students as s on s.StudentNo=ss.StudentID
                              inner join StudentEnrollment se on se.StudentEnrollmentID=ss.EnrolmentID
                              where ss.SurveyID=@surveyId");

            SqlCommand cmd = new SqlCommand(sql.ToString());
            cmd.Parameters.Add(new SqlParameter("@surveyId", SurveyId));
            using (IDataReader reader = this.ExecuteReader(cmd))
            {
                students = new List<SurveyStudent>();
                while (reader.Read())
                {
                    int colIndex = -1;
                    SurveyStudent ss = new SurveyStudent()
                    {
                        StudentNo = reader.GetInt32(++colIndex),
                        LastName = reader.GetString(++colIndex),
                        FirstName = reader.GetString(++colIndex),                        
                        EnrollmentId=reader.GetInt32(++colIndex)
                    };
                    students.Add(ss);
                }
            }
            return students;        
        }

        #endregion

        #region Questions Methods
        public IList<Question> getAllQuestionsOf(int QuestionGroupId,bool fetchActiveQuestionsOnly)
        {
            IList<Question> questionsList = new List<Question>();

            var sql = new StringBuilder();
            sql.AppendFormat("SELECT QuestionID, Question, [Order], Numeric, Active FROM SurveyQuestionMaster Where QuestionGroupID='{0}'",QuestionGroupId);
            if (fetchActiveQuestionsOnly)
                sql.Append(" WHERE Active = 'Y' ");


            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {
                while (reader.Read())
                {
                    int qgColIndex = -1;
                    var newQuestion = new Question()
                    {
                        QuestionID = reader.GetInt32(++qgColIndex),                        
                        QuestionText = reader.GetString(++qgColIndex),
                        Order = reader.GetInt32(++qgColIndex),
                        Numeric=reader.GetString(++qgColIndex)=="Y"?true:false,
                        Active = reader.GetString(++qgColIndex) == "Y" ? true : false
                    };

                    questionsList.Add(newQuestion);
                }
            }

            return questionsList;
        }
        #endregion

    }
}
