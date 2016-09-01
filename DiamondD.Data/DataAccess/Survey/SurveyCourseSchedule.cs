using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.StudentTranscript;
using DiamondD.Data.DataAccess.Common;

namespace DiamondD.Data.DataAccess.Survey
{
    public class SurveyCourseSchedule
    {
        public int? CourseSurveyScheduleId { get; set; }

        /// <summary>
        /// Days to start the survey after the course offering start date.
        /// </summary>
        public int DaysToOpen { get; set; }

        /// <summary>
        /// Set/Get number of days for which a survey will remain open 
        /// (after <see cref="SurveyCourseSchedule.DaysToOpen" /> ).
        /// </summary>
        public int DaysOpen { get; set; }

        public bool Active { get; set; }

        public Course CourseInfo { get; set; }
        public Session SessionInfo { get; set; }
        public StudentStatus StudentStatusInfo { get; set; }
        public QuestionGroup QuestionGroupInfo { get; set; }
        public string StudentStatusesString { get; set; }        
    }
}
