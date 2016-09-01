using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Survey;
using DiamondD.Data.DataAccess;

namespace DiamondD.Services.Survey
{
    public interface ISurveyService
    {
        #region Survey Methods

        IList<DiamondD.Data.DataAccess.Survey.Survey> GetAllSurveys(bool fetchActiveOnly = true);
        bool CreateCourseSurveySchedule(SurveyCourseSchedule schedule);
        bool CreateSurvey(DiamondD.Data.DataAccess.Survey.Survey survey, int? StudentStatusId, int? ProgramId, int? TermId, int? groupId, string sessionsId);
        DiamondD.Data.DataAccess.Survey.Survey getSurvey(int id);
        bool UpdateSurvey(Data.DataAccess.Survey.Survey survey, int? StudentStatusId, int? ProgramId, int? TermId, int? groupId, string sessionsId);
        #endregion

       #region Survey Questions Group Methods
       int CreateNewQuestionGroup(QuestionGroup group);
       IList<QuestionGroup> GetAllQuestionGroups(bool fetchActiveQuestionGroupsOnly = true, bool fetchQuestions = false, bool fetchActiveQuestionsOnly = true);
       QuestionGroup getQuestionsGroup(int id);
       bool UpdateQuestionGroup(QuestionGroup group);
       bool UpdateQuestionGroupwithQuestions(QuestionGroup group);
       #endregion

        #region Survey Questions Methods
       IList<Question> getAllQuestionsOf(int QuestionGroupId, bool fetchActiveQuestionsOnly);
        #endregion

       IList<SurveyStudent> getFilteredStudents(int surveyId,int statusId, int programNo, int termId, int groupId, string session);
       IList<SurveyStudent> getStudentsBySurveyId(int SurveyId);
       
    }
}
