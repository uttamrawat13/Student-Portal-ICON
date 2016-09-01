using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Transcript
{
    public class TrancriptViewModel
    {
        public IList<Term> Terms { get; private set; }
        public double CumulativeTotalUnitsAttempted { get; private set; }
        public double CumulativeTotalUnitsCompleted { get; private set; }
        public double CumulativeTotalGpa { get; private set; }

        public TrancriptViewModel() : this(null)
        { 
        }
        public TrancriptViewModel(IList<Term> termData)
        {
            //this.Terms = termData;
            //foreach (var data in termData)
            //{
            //    this.CumulativeTotalUnitsAttempted = Convert.ToDouble(data.CumulativeTotalUnitsAttempted);
            //    this.CumulativeTotalUnitsCompleted = Convert.ToDouble(data.CumulativeTotalUnitsCompleted);
            //    this.CumulativeTotalGpa = Convert.ToDouble(data.CumulativeTotalGpa);
            //}
        }
        
    }
}
