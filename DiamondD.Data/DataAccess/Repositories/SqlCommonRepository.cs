using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Common;
using System.Data;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlCommonRepository : ICommonRepository
    {

        public IList<Common.Course> GetCourses(bool fetchActiveOnly = true)
        {
            var courseList = new List<Course>();

            var sql = new StringBuilder();
            sql.Append("SELECT CourseNo,CourseCode From Course ");
			if (fetchActiveOnly)
				sql.Append(" WHERE ActiveStatus = 'Y'");

            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {   
                while (reader.Read())
                {
                    int colIndex = -1;
                    var newCourse = new Course
					{
                        CourseNo=reader.GetInt32(++colIndex),
						Code = reader.GetString(++colIndex)
					};
                    courseList.Add(newCourse);                
                }
            }

            return courseList;
        }

        public IList<Session> GetSessions(bool fetchActiveOnly = true)
        {
            var sessionList = new List<Session>();

            var sql = new StringBuilder();
            sql.Append("Select Session,Description,Active from Session ");
			if (fetchActiveOnly)
				sql.Append(" WHERE Active = 'Y'");


            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {   
                while (reader.Read())
                {
                    int colIndex = -1;
                    var newSession = new Session
					{
						SessionInfo = reader.GetString(++colIndex),
						Description = reader.GetString(++colIndex),
						Active = reader.GetString(++colIndex).ToUpper() == "Y" ? true : false
					};
                    sessionList.Add(newSession);
                }
            }

            return sessionList;            
        }

        public IList<StudentStatus> GetStudentStatusList(bool fetchActiveOnly = true)
        {
            var studentStatusList = new List<StudentStatus>();

            var sql = new StringBuilder();
            sql.Append("SELECT StudentStatusID, StudentStatus from StudentStatus ");
			if (fetchActiveOnly)
				sql.Append(" WHERE Active = 'Y' ");

            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var newStudentStatus = new StudentStatus
					{
						StudentStatusId   = reader.GetInt32(++colIndex),
						StudentStatusInfo = reader.GetString(++colIndex)
                    };
                    studentStatusList.Add(newStudentStatus);
                }
            }

            return studentStatusList;
        }

        public IList<Program> GetPrograms(bool fetchActiveOnly = true)
        {
            var Programs = new List<Program>();

            var sql = new StringBuilder();
            sql.Append("SELECT ProgramNo, ProgramCode from Program ");
			if (fetchActiveOnly)
				sql.Append("WHERE ActiveStatus = 'Y' ");


            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {
                
                while (reader.Read())
                {
                    int colIndex = -1;
                    var newProgram = new Program
					{
						ProgramNo   = reader.GetInt32(++colIndex),
						ProgramCode = reader.GetString(++colIndex)
					};
                    Programs.Add(newProgram);
                }
            }

            return Programs;
        }

        public IList<Term> GetTerms()
        {
            var Terms = new List<Term>();

            var sql = new StringBuilder();
            sql.AppendFormat("SELECT TermID, TermBeginDate from Term ");


            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {

                while (reader.Read())
                {
                    int colIndex = -1;
                    var newTerm = new Term
                    {
                        TermId = reader.GetInt32(++colIndex),
                        TermBeginDate = reader.GetDateTime(++colIndex)
                    };
                    Terms.Add(newTerm);
                }
            }

            return Terms;                    
        }

        public IList<StudentGroup> GetStudentGroups(bool fetchActiveOnly = true)
        {
            var groups = new List<StudentGroup>();

            var sql = new StringBuilder();
            sql.Append("SELECT GroupID, GroupCode, ActiveStatus from StudentGroup ");
			if (fetchActiveOnly)
				sql.Append(" WHERE ActiveStatus = 'Y' ");

            using (IDataReader reader = this.ExecuteReader(CommandType.Text, sql.ToString()))
            {

                while (reader.Read())
                {
                    int colIndex = -1;
                    var newGroup = new StudentGroup
                    {
                        GroupId = reader.GetInt32(++colIndex),
                        GroupCode = reader.GetString(++colIndex),
                        ActiveStatus = reader.GetString(++colIndex).ToUpper() == "Y" ? true : false
                    };
                    groups.Add(newGroup);
                }
            }

            return groups;                    
        }
    }
}
