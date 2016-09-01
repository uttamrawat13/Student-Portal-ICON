using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.ProgramCourseStatus;
using DiamondD.Data.DataAccess.Repositories.Base;

namespace DiamondD.Web.Tests.ReportsTest
{
    public class TestProgramCourseProgressRepository : IProgramCourseProgressRepository
    {
        private Dictionary<int, StudentProgramCourseProgress> programCourseProgress { get; set; }

        public TestProgramCourseProgressRepository()
        {
            init();
        }

        private void init()
        {
            #region Insert Test Data of Program Course Progress

            programCourseProgress = new Dictionary<int, StudentProgramCourseProgress>();

            // StudentNo 1.
            var programCoursePrograssDetail = new List<ProgramCourseProgress>();
            // Enter Valid Data
            var programCoursePrograss1 = new ProgramCourseProgress()
            {
                StudentNo = 1,
                Student = "Alex",
                ReportGroup = "Completed",
                CourseNo = 100,
                CourseCode = "CLI002 Tast1",
                CourseDescription = "Test",
                Units = 1600.00
            };
            programCoursePrograssDetail.Add(programCoursePrograss1);

            // Enter Valid Data
            var programCoursePrograss2 = new ProgramCourseProgress()
            {
                StudentNo = 1,
                Student = "Alex",
                ReportGroup = "Completed",
                CourseNo = 102,
                CourseCode = "CLI002 Tast2",
                CourseDescription = "Test",
                Units = 1200.00
            };
            programCoursePrograssDetail.Add(programCoursePrograss2);

            // Enter Valid Data
            var programCoursePrograss3 = new ProgramCourseProgress()
            {
                StudentNo = 1,
                Student = "Alex",
                ReportGroup = "Completed",
                CourseNo = 180,
                CourseCode = "CLI002 Tast3",
                CourseDescription = "Test",
                Units = 1600.00
            };
            programCoursePrograssDetail.Add(programCoursePrograss3);

            // Enter Valid Data
            var programCoursePrograss4 = new ProgramCourseProgress()
            {
                StudentNo = 1,
                Student = "Alex",
                ReportGroup = "In Progress",
                CourseNo = 250,
                CourseCode = "CLI002 Tast4",
                CourseDescription = "Test",
                Units = 1200.00
            };
            programCoursePrograssDetail.Add(programCoursePrograss4);


            // Enter Valid Data
            var programCoursePrograss5 = new ProgramCourseProgress()
            {
                StudentNo = 1,
                Student = "Alex",
                ReportGroup = "In Progress",
                CourseNo = 200,
                CourseCode = "CLI002 Tast5",
                CourseDescription = "Test",
                Units = 800.00
            };
            programCoursePrograssDetail.Add(programCoursePrograss5);

            var programCourseDetail = new StudentProgramCourseProgress(programCoursePrograssDetail);
            programCourseProgress.Add(1, programCourseDetail);


            // StudentNo 2.
            programCoursePrograssDetail = new List<ProgramCourseProgress>();
            for (int i = 0; i < 4; i++)
            {
                    // Enter Valid Data
                    programCoursePrograss1 = new ProgramCourseProgress()
                    {
                        StudentNo = 2,
                        Student = "Ben",
                        ReportGroup = "In Progress",
                        CourseNo = 100,
                        CourseCode = "CLI002 Tast"+i,
                        CourseDescription = "Test",
                        Units = 400.00 * i
                    };
                programCoursePrograssDetail.Add(programCoursePrograss1);

            }
            programCourseDetail = new StudentProgramCourseProgress(programCoursePrograssDetail);
            programCourseProgress.Add(2, programCourseDetail);



            #endregion
        }

        public StudentProgramCourseProgress GetStudentProgramCoursePrograssDetail(int? studentNo)
        {
            int studentID = Convert.ToInt32(studentNo);
            return programCourseProgress[studentID];
        }
    }
}
