using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.GradeBook;
using DiamondD.Data.DataAccess.Repositories.Base;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlGradeBookRepository : ISqlGradeBookRepository
    {
        public bool IsGradeBookWeighted()
        {
            bool isGradeBookWeighted = false;

            var query = new StringBuilder();
            query.AppendFormat("SELECT YesNoInfo ")
                 .AppendFormat(" FROM DatabaseInfo d ")
                 .AppendFormat(" WHERE d.DatabaseInfo = 'GradeBook Weighted' ");

            var studentGradeBook = new List<GradeBookInfo>();

            string result = this.ExecuteScalar(CommandType.Text, query.ToString()) as string;
            if (result == "Y")
            {
                isGradeBookWeighted = true;
            }

            return isGradeBookWeighted;
        }

        public StudentGradeBook GetStudentGradeBookDetail(int? studentNo, string term)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT StudentNo, Student, TermBeginDate, GradeBookColumn, CourseOfferingDescription, GradeItem, StudentPoints, TotalPoints, CurrentWeightedStudentPoints, CurrentWeightedTotalPoints")
            .AppendFormat(" FROM vWebGradeBook ")
            .AppendFormat(" WHERE StudentNo = {0} AND TermBeginDate = '{1}' ORDER BY CourseOfferingDescription,GradeBookColumn  ASC", studentNo, term);


            var studentGradeBook = new List<GradeBookInfo>();

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    int colIndex = -1;
                    var gradeBook = new GradeBookInfo
                                        {

                                            StudentNo = reader[++colIndex] as int?,
                                            Student = reader[++colIndex] as string,
                                            TermBeginDate = (DateTime) reader[++colIndex],
                                            GradeBookColumn = reader[++colIndex] as int?,
                                            CourseOfferingDescription = reader[++colIndex] as string,
                                            GradeItem = reader[++colIndex] as string,

                                            StudentPoints = (double)reader[++colIndex],
                                            Totalpoints = (double) reader[++colIndex],
                                            CurrentWeightedStudentPoints = (double) reader[++colIndex],
                                            CurrentWeightedTotalPoints = (double) reader[++colIndex]
                                        };

                    studentGradeBook.Add(gradeBook);
                }
            }
            return new StudentGradeBook(studentGradeBook);
        }

        public IList<string> GetStudentGradeBokkOfTerm(int studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT DISTINCT TermBeginDate")
                .AppendFormat(" FROM vWebGradeBook")
                .AppendFormat(" WHERE StudentNo = {0}", studentNo)
                .AppendFormat(" ORDER BY TermBeginDate DESC");

            var termList = new List<string>();
            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    DateTime termDateTime = reader.GetDateTime(0);
                    string termDate = termDateTime.Date.ToString("MM/dd/yyyy");
                    termList.Add(termDate);
                }
            }

            return termList;
        }
    }
}
