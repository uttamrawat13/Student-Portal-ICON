using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Survey
{
    public class Question
    {
        public int QuestionID { get; set; }       
        public string QuestionText { get; set; }
        public int Order { get; set; }
        public bool Numeric { get; set; }
        public bool Active { get; set; }
    }
}
