using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.StudentTranscript;
using DiamondD.Data.DataAccess.User;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlTranscriptRepository : ITranscriptRepository
    {
        public Transcript GetTranscript(int studentNo)
        {
            Transcript transcript = new Transcript();

            var query = new StringBuilder();
            query.AppendFormat("SELECT StudentNo, SortOrder, TermID, TermBeginDate, TranscriptCode, TermDescription ")
                 .AppendFormat(" , CourseCode, CourseDescription, Session, SessionNo, TranCourseCode, ClassHours, Units")
                 .AppendFormat(" , Grade, NumberGrade, StudentGPAValue, StudentGPAWeight, StudentUnitsInProgress ")
                 .AppendFormat(" , StudentUnitsAttempted, StudentUnitsCompleted, Student, CourseNo ")
                .AppendFormat(" FROM vWebAcademics ")
                .AppendFormat(" WHERE StudentNo={0}", studentNo)
                .AppendFormat(" ORDER BY TermBeginDate ASC");

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                string prevTermId = "";
                string termDescription = "";
                DateTime? termStartDate = null;

                var term = new Term();
                while (reader.Read())
                {
                    var course = new RegisteredCourse();
                    //int colIndex = -1;
                    
                    course.Code = reader[6] as string;
                    course.ClassHours = (double)reader[11];
                    course.Description = reader[7] as string;
                    course.GpaValue = (double)reader[15];
                    course.GpaWeight = (double)reader[16];
                    course.Grade = reader[13] as string;
                    course.NumberGrade = (double)reader[14];
                    course.UnitsAttempted = (double)reader[18];
                    course.UnitsInProgress = (double)reader[17];
                    course.UnitsCompleted = (double)reader[19];
                    term.StudentName = reader[20] as string;
                    term.Courses.Add(course);

                    string termId = reader[2].ToString();
                    if (!termId.Equals(prevTermId) && prevTermId != "")
                    {
                        if (termStartDate.HasValue)
                        {
                            term.StartDate = termStartDate.Value.Date;
                            term.Description = termDescription;
                        }

                        // All courses have been added into the term so add it into transcript
                        transcript.Terms.Add(term);
                        // & get new instance of term to place the other courses in it
                        term = new Term();
                    }                    
                    
                    termDescription = reader[5] as string;
                    termStartDate = reader[3] as DateTime?;
                    
                    prevTermId = termId;
                }

                // Adding the last term but avoiding the addition of term in case where no rows were returned.
                if (!prevTermId.Equals(""))
                {
                    if (termStartDate.HasValue)
                    {
                        term.StartDate = termStartDate.Value.Date;
                        term.Description = termDescription;
                    }
                    transcript.Terms.Add(term);
                }
            }

            return transcript;
        }
    }
}
