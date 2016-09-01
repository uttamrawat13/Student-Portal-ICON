using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.Attendance
{
    public class StudentAttendance
    {
        public IList<AttendanceEntry> AttendanceEntries { get; private set; }

        private string _dateRange;
        private double _TotalScheduledComplete;
        private double _TotalScheduledAttended;

        public string StudentName
        {
            get
            {
                foreach (var item in AttendanceEntries)
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
        /// <returns>Sum of all the scheduled hours.</returns>
        public double TotalScheduledHours
        {
            get
            {
                double totalScheduledHours = 0.0;
                foreach (var item in AttendanceEntries)
                {
                    totalScheduledHours = totalScheduledHours + Convert.ToDouble(item.ScheduledAdj);
                }
                return totalScheduledHours;
            }
        }

        /// <summary>
        /// Calculates total completed hours.
        /// <para>
        /// Note: This field is computed each time the property is accessed. 
        /// You should store it in a local variable instead of calling it again and again.
        /// </para>
        /// </summary>
        /// <returns>Sum of all the completed hours.</returns>
        public double TotalCompletedHours
        {
            get
            {
                double totalCompletedHours = 0.0;
                foreach (var item in AttendanceEntries)
                {
                    totalCompletedHours = totalCompletedHours + Convert.ToDouble(item.AttendedAdj);
                }
                return totalCompletedHours;
            }
        }

        public string DateRange
        {
            get { return _dateRange; }
            set { _dateRange = value; }
        }

        public double TotalScheduledComplete
        {
            get { return _TotalScheduledComplete; }
            set { _TotalScheduledComplete = value; }
        }

        public double TotalScheduledAttended
        {
            get { return _TotalScheduledAttended; }
            set { _TotalScheduledAttended = value; }
        }

        public StudentAttendance()
        { 
            AttendanceEntries = new List<AttendanceEntry>();
        }

        public StudentAttendance(IList<AttendanceEntry> attendanceEntries)
        {
            AttendanceEntries = attendanceEntries;
            
            var dateFrom = DateTime.Now.AddDays(-35);
            var dateTo = DateTime.Now;

            DateRange = dateFrom.Date.ToString("MM/dd/yyyy") + " - "
            + dateTo.Date.ToString("MM/dd/yyyy");
        }

        public StudentAttendance(IList<AttendanceEntry> attendanceEntries, DateTime dateFrom, DateTime dateTo, double TotalScheduledComplete, double TotalScheduledAttended)
        {
            AttendanceEntries = attendanceEntries;
            DateRange = dateFrom.Date.ToString("MM/dd/yyyy") + " - "
                        + dateTo.Date.ToString("MM/dd/yyyy");

            this.TotalScheduledComplete = TotalScheduledComplete;
            this.TotalScheduledAttended = TotalScheduledAttended;
        }
    }
}
