using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Attendance
{
    public class StudentAttendanceSummary
    {
        public IList<AttendanceSummary> AttendanceSummaries { get; private set; }

        public string StudentName
        {
            get
            {
                foreach (var item in AttendanceSummaries)
                {
                    return item.Student;
                }
                return null;
            }

        }

        /// <summary>
        /// Calculates total scheduled hours.
        /// <para>
        /// Note: This field is computed each time the property is accessed. 
        /// You should store it in a local variable instead of calling it again and again.
        /// </para>
        /// </summary>
        /// <returns>Sum of all the scheduled total.</returns>
        public double CalculateTotalScheduled
        {
            get
            {
                double scheduledTotal = 0.0;
                foreach (var item in AttendanceSummaries)
                {
                    scheduledTotal = scheduledTotal + Convert.ToDouble(item.ScheduledTotal);
                }
                return scheduledTotal;
            }
        }

        /// <summary>
        /// Calculates total scheduled ToDate.
        /// <para>
        /// Note: This field is computed each time the property is accessed. 
        /// You should store it in a local variable instead of calling it again and again.
        /// </para>
        /// </summary>
        /// <returns>Sum of all the scheduled to date.</returns>
        public double CalculateTotalScheduledToDate
        {
            get
            {
                double scheduledToDate = 0.0;
                foreach (var item in AttendanceSummaries)
                {
                    scheduledToDate = scheduledToDate + Convert.ToDouble(item.ScheduledToDate);
                }
                return scheduledToDate;
            }
        }

        /// <summary>
        /// Calculates total attendent ToDate.
        /// <para>
        /// Note: This field is computed each time the property is accessed. 
        /// You should store it in a local variable instead of calling it again and again.
        /// </para>
        /// </summary>
        /// <returns>Sum of all the attendent to date.</returns>
        public double CalculateTotalattendentToDate
        {
            get
            {
                double attendedToDate = 0.0;
                foreach (var item in AttendanceSummaries)
                {
                    attendedToDate = attendedToDate + Convert.ToDouble(item.AttendedToDate);
                }
                return attendedToDate;
            }
        }

        public StudentAttendanceSummary() : this(null)
        { 
        }

        public StudentAttendanceSummary(IList<AttendanceSummary> attendanceSummaries)
        {
            AttendanceSummaries = attendanceSummaries;
        }
    }
}
