using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.StudentTranscript
{
   public class Transcript
   {
       public string Code { get; set; }
       public double? UnitsAttempted 
       {
           get 
           {
               return Terms.Sum(term => term.UnitsAttempted);
           }
       }
       public double? UnitsCompleted
       {
           get
           {
               return Terms.Sum(term => term.UnitsCompleted);
           }
       }

       public double? UnitsInProgress 
       {
           get 
           {
               return Terms.Sum(term => term.UnitsInProgress);
           }
       }

       public IList<Term> Terms { get; set; }

       public double Cgpa
       {
           get
           {
               double gpaValue = 0.0;
               double gpaWeight = 0.0;

               foreach (var term in Terms)
               {
                   foreach (var course in term.Courses)
                   {
                       if (course.GpaWeight != 0)
                       {
                           gpaValue += course.GpaValue;
                           gpaWeight += course.GpaWeight;
                       }
                   }
               }
               double gpa = gpaValue / gpaWeight;
               return gpa;               
           }           
       }

       public string StudentName
       {
           get
           {
               foreach (var item in Terms)
               {
                   return item.StudentName;
               }
               return null;
           }

       }

       public Transcript()
       {
           Terms = new List<Term>();           
       }

       public void GetCummulativeTotals(out double? unitsAttempted, out double? unitsCompleted,
           out double? unitsInProgress, out double? gpa)
       {
           unitsAttempted = 0.0;
           unitsCompleted = 0.0;
           unitsInProgress = 0.0;
           gpa = 0.0;

           double gpaValue = 0.0;
           double gpaWeight = 0.0;

           foreach (var term in Terms)
           {
               foreach (var course in term.Courses)
               {
                   if (course.GpaWeight != 0)
                   {
                       gpaValue += course.GpaValue;
                       gpaWeight += course.GpaWeight;
                   }
                   unitsAttempted += course.UnitsAttempted;
                   unitsCompleted += course.UnitsCompleted;
                   unitsInProgress += course.UnitsInProgress;
               }
           }
           gpa = gpaValue / gpaWeight;           
       }
   }
}
