using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.StudentTranscript
{
    public class Term
    {
        public DateTime? StartDate { get; set; }
        public string Description { get; set; }
        public string StudentName { get; set; }

        public double UnitsAttempted 
        {
            get
            {
                return Courses.Sum(course => course.UnitsAttempted);
            }
        }

        public double UnitsCompleted 
        {
            get
            {
                return Courses.Sum(course => course.UnitsCompleted);
            }
        }

        public double UnitsInProgress 
        {
            get
            {
                return Courses.Sum(course => course.UnitsInProgress);
            }
        }
        
        public double Gpa 
        {
            get
            {
                double gpaValue = 0.0;
                double gpaWeight = 0.0;

                foreach (var course in Courses)
                {
                    if (course.GpaWeight != 0)
                    {
                        gpaValue += course.GpaValue;
                        gpaWeight += course.GpaWeight;
                    }
                }

                double gpa = gpaValue / gpaWeight;
                return gpa;
            }            
        }

        public string Session { get; set; }
        public int SessionNo { get; set; }
        public IList<RegisteredCourse> Courses { get; set; }

        public Term()
        {
            Courses = new List<RegisteredCourse>();
        }

    }
}
