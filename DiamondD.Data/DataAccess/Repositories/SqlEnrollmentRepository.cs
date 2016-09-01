using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Enrollment;
using System.Data;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlEnrollmentRepository : IEnrollmentRepository
    {
        public int EnrollStudent(CourseEnrollment enrollment)
        {
            var query = new StringBuilder();
            query.AppendFormat(" INSERT INTO CourseOfferingStudent (CourseOfferingNo,StudentNo,GradeNo,StatusID,ImportedDate,ImportConversion) ");
            query.AppendFormat(" VALUES({0},{1},{2},{3},'{4}','{5}')", enrollment.CourseOfferingNo, 
                enrollment.StudentId, enrollment.GradeNo, enrollment.StatusId, 
                enrollment.ImportDate, enrollment.ImportConversion);

            return this.ExecuteNonQuery(CommandType.Text, query.ToString());
        }


        public IList<CourseOffering> FetchCourseOfferings(int studentId, int termId, out int totalRows, int pageNumber, int pageSize)
        {
            totalRows = -1;
            var courseOfferingList = new List<CourseOffering>();

            if (pageSize <= 0)
                return courseOfferingList;

            var query = new StringBuilder();
            query.AppendFormat("EXEC CourseOfferingStudentEnrollment {0}, {1}, {2}, {3}", studentId, termId, pageNumber, pageSize);
            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    var courseOffering = new CourseOffering
                    {
                        CourseOfferingNo = (int)reader[1],
                        Term = (DateTime)reader[2],
                        Course = reader[3] as string,
                        CourseInfo = reader[4] as string,
                        EnrollmentStatus = (int)reader[5],
                        CourseEnrolledDateTime = reader[6] as DateTime?,
                        RegistrationMessage = reader[7] as string,
                        RegistrationAllowed = (int)reader[8],
                    };
                    courseOfferingList.Add(courseOffering);

                    totalRows = (int)reader[10];
                }
            }

            return courseOfferingList;
        }

        public Dictionary<int, DateTime> FetchTermsForOnlineEnrollment()
        {
            var terms = new Dictionary<int, DateTime>();

            var query = new StringBuilder();
            query.AppendFormat("SELECT TermID, TermBeginDate FROM [vWebOnlineEnrollmentTerms] ORDER BY TermBeginDate DESC");

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    var key = reader[0];
                    var value = reader[1];

                    // Exclude if TermID is null or TermBeginDate is null.
                    if (key != null && value != null)
                    {
                        terms.Add((int)key, DateTime.Parse(value.ToString()));
                    }
                }
            }

            return terms;
        }


        public bool UnEnrollStudent(int studentId, int courseOfferingNo)
        {
            var query1 = new StringBuilder();
            query1.Append(" DELETE CourseOfferingAttendanceScheduled ")
                  .Append(" FROM CourseOfferingAttendanceScheduled INNER JOIN CourseOfferingSchedule ")
                  .Append("    ON CourseOfferingAttendanceScheduled.ScheduleID = CourseOfferingSchedule.ScheduleID ")
                  .AppendFormat(" WHERE CourseOfferingAttendanceScheduled.StudentNo = {0} ", studentId)
                  .AppendFormat("    AND CourseOfferingSchedule.CourseOfferingNo = {0} ", courseOfferingNo);

            var query2 = new StringBuilder();
            query2.AppendFormat(" DELETE FROM CourseOfferingStudent  WHERE StudentNo = {0} AND CourseOfferingNo = {1} ", studentId, courseOfferingNo);

            var db = this.CreateDatabase();
            IDbConnection connection = db.CreateConnection();

            connection.Open();
            IDbTransaction transaction = connection.BeginTransaction();

            try
            {
                db.ExecuteNonQuery(CommandType.Text, query1.ToString());
                db.ExecuteNonQuery(CommandType.Text, query2.ToString());

                transaction.Commit();
            }
            catch
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open) 
                    connection.Close();
            }

            return true;
        }
    }
}
