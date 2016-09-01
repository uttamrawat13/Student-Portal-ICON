using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Common;

namespace DiamondD.Data.DataAccess.StudentTranscript
{
    public class RegisteredCourse : Course
    {
        public double UnitsAttempted { get; set; }
        public double UnitsInProgress { get; set; }
        public double UnitsCompleted { get; set; }
        public double GpaValue { get; set; }
        public double GpaWeight { get; set; }
        public string Grade { get; set; }
        public double NumberGrade { get; set; }
    }
}
