using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Survey;
namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface ISurveyRepository:IBaseRepository
    {
        #region Question Groups
        int CreateQuestionGroup(QuestionGroup group);
        IList<QuestionGroup> GetAllQuestionGroups(bool fetchActiveQuestionGroupsOnly = true, bool fetchQuestions = false, bool fetchActiveQuestionsOnly = true);
        Survey.QuestionGroup getQuestionsGroup(int id);
        bool UpdateQuestionGroup(Survey.QuestionGroup group);
        bool UpdateQuestionGroupwithQuestions(Survey.QuestionGroup group);
        #endregion

        #region Questions
        IList<Question> getAllQuestionsOf(int QuestionGroupId, bool fetchActiveQuestionsOnly);
        #endregion

        #region Survey

        bool CreateSurvey(Survey.Survey survey);
        bool UpdateSurvey(Survey.Survey survey);
        IList<Survey.Survey> GetAllSurveys(bool fetchActiveOnly = true);
        bool CreateCourseSurveySchedule(SurveyCourseSchedule schedule);
        Survey.Survey getSurvey(int id);
        #endregion
        IList<SurveyStudent> getFilteredStudents(int surveyId,int statusId, int programNo, int termId, int groupId, string session);
        IList<SurveyStudent> getStudentsBySurveyId(int SurveyId);
    }
}
