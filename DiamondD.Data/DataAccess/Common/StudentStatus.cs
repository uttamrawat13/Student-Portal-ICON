using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Common
{
    public class StudentStatus
    {
        public int StudentStatusId { get; set; }
        public string StudentStatusInfo { get; set; }
        public bool Active { get; set; }
    }
}
