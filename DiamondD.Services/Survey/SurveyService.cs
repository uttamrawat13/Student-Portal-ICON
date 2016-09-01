using DiamondD.Data.DataAccess.Survey;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Repositories;
using System.Data.SqlClient;
using DiamondD.Services.Common;
namespace DiamondD.Services.Survey
{
    public class SurveyService : ISurveyService
    {

        private ISurveyRepository _repository = null;

        public SurveyService()
        {
            _repository = new SqlSurveyRepository();        
        }

        #region Question Groups

        //bool ISurveyService.CreateNewQuestionGroup(QuestionGroup group)
        //{
        //    throw new NotImplementedException();
        //}

        int ISurveyService.CreateNewQuestionGroup(QuestionGroup group)
        {
            try
            {
                return _repository.CreateQuestionGroup(group);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
        bool ISurveyService.UpdateQuestionGroup(QuestionGroup group)
        {
            try
            {
                return _repository.UpdateQuestionGroup(group);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
        public IList<QuestionGroup> GetAllQuestionGroups(bool fetchActiveQuestionGroupsOnly = true, bool fetchQuestions = false, bool fetchActiveQuestionsOnly = true)
        {
            try
            {
                return _repository.GetAllQuestionGroups(fetchActiveQuestionGroupsOnly,fetchQuestions,fetchActiveQuestionsOnly);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
        public QuestionGroup getQuestionsGroup(int id)
        {
            try
            {
                return _repository.getQuestionsGroup(id);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }                    
        }
        #endregion

        #region Questions
        public IList<Question> getAllQuestionsOf(int QuestionGroupId, bool fetchActiveQuestionsOnly)
        {
            try
            {
                return _repository.getAllQuestionsOf(QuestionGroupId,fetchActiveQuestionsOnly);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }       
        }
        #endregion

        #region Survey
        public bool CreateCourseSurveySchedule(SurveyCourseSchedule schedule)
        {
            try
            {
                return _repository.CreateCourseSurveySchedule(schedule);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public DiamondD.Data.DataAccess.Survey.Survey getSurvey(int id)
        {
            try
            {
                return _repository.getSurvey(id);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }         
        }

        public IList<DiamondD.Data.DataAccess.Survey.Survey> GetAllSurveys(bool fetchActiveOnly = true)
        {
            try
            {
                return _repository.GetAllSurveys(fetchActiveOnly);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public bool CreateSurvey(Data.DataAccess.Survey.Survey survey, int? StudentStatusId, int? ProgramId, int? TermId, int? groupId, string sessionsId)
        {
            try
            {
                return _repository.CreateSurvey(survey);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public bool UpdateSurvey(Data.DataAccess.Survey.Survey survey, int? StudentStatusId, int? ProgramId, int? TermId, int? groupId, string sessionsId)
        {
            try
            {
                return _repository.UpdateSurvey(survey);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
        #endregion

        IList<SurveyStudent> ISurveyService.getFilteredStudents(int surveyId,int statusId, int programNo, int termId, int groupId, string session)
        {
            try
            {
                return _repository.getFilteredStudents(surveyId,statusId,programNo,termId,groupId,session);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        IList<SurveyStudent> ISurveyService.getStudentsBySurveyId(int SurveyId)
        {
            try
            {
                return _repository.getStudentsBySurveyId(SurveyId);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }


        public bool UpdateQuestionGroupwithQuestions(QuestionGroup group)
        {
            try
            {
                return _repository.UpdateQuestionGroupwithQuestions(group);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
    }
}
