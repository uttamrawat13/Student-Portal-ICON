using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.StudentTranscript;

namespace DiamondD.Web.Tests.TranscriptTests
{
    class TestTranscriptRepository : ITranscriptRepository
    {
        private Dictionary<int, Transcript> _studentRepository;
        public TestTranscriptRepository()
        {
            _studentRepository = new Dictionary<int, Transcript>();

            for (int i = 0; i < 5; ++i)
            {
                var transcript = new Transcript();

                for (int j = 0; j < 3; ++j)
                {
                    string[] grades = {"D", "C", "B", "A"};
                    var term = new Term();

                    for (int k = 0; k < 4; ++k)
                    {
                        var course = new RegisteredCourse();

                        course.GpaWeight = (k != 0? k : 1);
                        course.GpaValue = k;
                        course.Grade = grades[k];
                        course.NumberGrade = k;
                        course.UnitsAttempted = 3;
                        course.UnitsCompleted = 3;
                        course.UnitsInProgress = 3;

                        term.Courses.Add(course);
                    }
                    term.Session = "D";
                    term.SessionNo = 1;
                    term.StartDate = DateTime.Now;
                    
                    transcript.Terms.Add(term);
                }
                transcript.Code = "TRANS" + i;                
                _studentRepository.Add(i, transcript);
            }
        }

        public Transcript GetTranscript(int studentNo)
        {
            return _studentRepository[studentNo];
        }

        public IList<Term> GetTerms(int StudentNo)
        {
            return _studentRepository[StudentNo].Terms;
        }
    }
}
