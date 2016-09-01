using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Survey
{
    public class QuestionGroup
    {
        public int QuestionGroupID { get; set; }
        public string QuestionGroupCode { get; set; }
        public bool Admissions { get; set; }
        public bool Registrar { get; set; }
        public bool FinancialAid { get; set; }
        public bool Placement { get; set; }
        public bool Active { get; set; }
        public List<Question> Questions { get; set; }
    }
}
