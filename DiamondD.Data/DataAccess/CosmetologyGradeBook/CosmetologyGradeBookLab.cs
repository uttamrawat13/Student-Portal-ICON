using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.CosmetologyGradeBook
{
   public class CosmetologyGradeBookLab
    {
        public int? StudentNo { get; set; }
       
        public string Student { get; set; }
        public string Description { get; set; }

        public int? CompletedSessions { get; set; }

        public int? RequiredSessions { get; set; }

    }
}
