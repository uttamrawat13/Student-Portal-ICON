using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.StudentTranscript
{
    public class Course
    {
        public string Code { get; set; }
        public string Description { get; set; }
        public double Units { get; set; }
        public double ClassHours { get; set; }
    }
}
