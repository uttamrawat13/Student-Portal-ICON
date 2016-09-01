using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Survey
{
    public class SurveyStudent
    {

        public int StudentNo { get; set; }        
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public DateTime TermStartDate { get; set; }
        public string StudentStatus { get; set; }
        public string ProgramCode { get; set; }
        public int EnrollmentId { get; set; }
    }
}
