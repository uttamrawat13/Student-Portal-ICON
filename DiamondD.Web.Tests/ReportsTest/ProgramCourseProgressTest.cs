using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.ProgramCourseStatus;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DiamondD.Web.Tests.ReportsTest
{
    /// <summary>
    /// Summary description for ProgramCourseProgressTest
    /// </summary>
    [TestClass]
    public class ProgramCourseProgressTest
    {
        [TestMethod]
        public void Verify_SqlProgramCourseProgressRepository_GetProgramCourseProgressReport_Returns_Data_Against_DbStudent()
        {
            IProgramCourseProgressRepository programCourseRepository = new SqlProgramCourseProgressRepository();
            var studentProgramCourse = programCourseRepository.GetStudentProgramCoursePrograssDetail(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentProgramCourse);
            Assert.IsNotNull(studentProgramCourse.StudentName);
            Assert.IsNotNull(studentProgramCourse.programCoursePrograss);
            Assert.IsTrue(studentProgramCourse.programCoursePrograss.Count > 0);
        }

        [TestMethod]
        public void Verify_ProgramCourseProgressService_GetProgramCourseProgressReport_Returns_Data_Against_DbStudent()
        {
            IProgramCourseProgressService programCourseRepository = new ProgramCourseProgressService();
            var studentProgramCourse = programCourseRepository.GetStudentProgramCoursePrograssDetail(TestConstants.DbStudentUserId);

            Assert.IsNotNull(studentProgramCourse);
            Assert.IsNotNull(studentProgramCourse.StudentName);
            Assert.IsNotNull(studentProgramCourse.programCoursePrograss);
            Assert.IsTrue(studentProgramCourse.programCoursePrograss.Count > 0);
        }

        [TestMethod]
        public void Verify_TestProgramCourseProgressRepository_GetProgramCourseProgressReport_Returns_Data_Against_TestStudent()
        {
            IProgramCourseProgressRepository programCourseRepository = new TestProgramCourseProgressRepository();
            var studentProgramCourse = programCourseRepository.GetStudentProgramCoursePrograssDetail(1);

            Assert.IsNotNull(studentProgramCourse);
            Assert.IsNotNull(studentProgramCourse.StudentName);
            Assert.IsNotNull(studentProgramCourse.programCoursePrograss);
            Assert.IsTrue(studentProgramCourse.programCoursePrograss.Count > 0);
        }

        [TestMethod]
        public void Verify_TestProgramCourseProgressService_GetProgramCourseProgressReport_Returns_Data_Against_TestStudent()
        {
            IProgramCourseProgressService programCourseRepository = new ProgramCourseProgressService(new TestProgramCourseProgressRepository());
            var studentProgramCourse = programCourseRepository.GetStudentProgramCoursePrograssDetail(1);

            Assert.IsNotNull(studentProgramCourse);
            Assert.IsNotNull(studentProgramCourse.StudentName);
            Assert.IsNotNull(studentProgramCourse.programCoursePrograss);
            Assert.IsTrue(studentProgramCourse.programCoursePrograss.Count > 0);
        }

        [TestMethod]
        public void Verify_SqlProgramCourseProgressRepository_GetProgramCourseProgressReport_Returns_Empty_Data_Against_DbStudent()
        {
            IProgramCourseProgressRepository programCourseRepository = new SqlProgramCourseProgressRepository();
            var studentProgramCourse = programCourseRepository.GetStudentProgramCoursePrograssDetail(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentProgramCourse);
            Assert.IsNull(studentProgramCourse.StudentName);
            Assert.IsNotNull(studentProgramCourse.programCoursePrograss);
            Assert.IsTrue(studentProgramCourse.programCoursePrograss.Count == 0);
        }

        [TestMethod]
        public void Verify_ProgramCourseProgressService_GetProgramCourseProgressReport_Returns_Empty_Data_Against_DbStudent()
        {
            IProgramCourseProgressService programCourseRepository = new ProgramCourseProgressService();
            var studentProgramCourse = programCourseRepository.GetStudentProgramCoursePrograssDetail(TestConstants.InvalidUserId);

            Assert.IsNotNull(studentProgramCourse);
            Assert.IsNull(studentProgramCourse.StudentName);
            Assert.IsNotNull(studentProgramCourse.programCoursePrograss);
            Assert.IsTrue(studentProgramCourse.programCoursePrograss.Count == 0);
        }
    }
}
