using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Survey
{
    public class Answer
    {
        public int AnswerID { get; set; }
        public int SurveyID { get; set; }
        public int QuestionID { get; set; }
        public int StudentNo { get; set; }
        public int EnrollmentID { get; set; }
        public string CommentAnswer { get; set; }
        public double NumericAnswer { get; set; }
    }
}
