using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Survey
{
    public class Survey
    {
        public int SurveyId { get; set; }
        public string Name { get; set; }
        public int QuestionGroupId { get; set; }
        public DateTime? OpenDate { get; set; }
        public int? DaysOpen { get; set; }
        public bool Active { get; set; }
        public int CourseOfferingNo { get; set; }
        public bool Submitted { get; set; }
        public List<SurveyStudent> Students { get; set; }
    }
}
