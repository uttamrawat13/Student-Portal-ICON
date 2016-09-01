using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.StudentTranscript
{
    public class GradeHistory
    {
        public IList<Transcript> Trancript { get; private set; }
        public double TotalGpa { get; private set; }
        public double TotalUnitsAttempted { get; private set; }
        public double TotalUnitsCompleted { get; private set; }

        public GradeHistory() : this(null, 0.0, 0.0, 0.0)
        {
 
        }
        public GradeHistory(IList<Transcript> trancript, double totalGpa, double totalUnitsAttempted, double totalUnitsCompleted)
        {
            this.Trancript = trancript;
            this.TotalGpa = totalGpa;
            this.TotalUnitsAttempted = totalUnitsAttempted;
            this.TotalUnitsCompleted = totalUnitsCompleted;
        }        
    }
}
