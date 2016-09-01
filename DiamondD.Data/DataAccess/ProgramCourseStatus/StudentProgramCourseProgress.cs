using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.ProgramCourseStatus
{
    public class StudentProgramCourseProgress
    {
        public IList<ProgramCourseProgress> programCoursePrograss { get; private set; }

        public string StudentName
        {
            get
            {
                foreach (var item in programCoursePrograss)
                {
                    return item.Student;
                }
                return null;
            }
        }

        public StudentProgramCourseProgress() : this(null)
        { 
        }

        public StudentProgramCourseProgress(IList<ProgramCourseProgress> programCoursePrograss)
        {
            this.programCoursePrograss = programCoursePrograss;
        }
    }
}
