using System;
using System.Collections.Generic;

namespace DiamondD.Data.DataAccess.ScheduleOfCourses
{
   public class StudentScheduleOfCourses
    {
       public IList<ScheduleOfCourse> scheduleOfCourses { get; private set; }

       public string StudentName
       {
           get
           {
               foreach (var item in scheduleOfCourses)
               {
                   return item.Student;
               }
               return null;
           }
       }

       /// <summary>
       /// Calculates Sum of all units.
       /// <para>
       /// Note: This field is computed each time the property is accessed. 
       /// You should store it in a local variable instead of calling it again and again.
       /// </para>
       /// </summary>
       /// <returns>Sum of all the units.</returns>
       public double PaymentScheduleTotal
       {
           get
           {
               double total = 0.00;
               foreach (var item in scheduleOfCourses)
               {
                   total = total + Convert.ToDouble(item.Units);
               }

               return total;
           }
       }
       
        public StudentScheduleOfCourses() : this(new List<ScheduleOfCourse>())
        {
        }

        public StudentScheduleOfCourses(IList<ScheduleOfCourse> classSchedule)
        {
            this.scheduleOfCourses = classSchedule;
        }

    }
}
