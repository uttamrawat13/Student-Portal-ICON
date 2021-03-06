﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data;
using DiamondD.Data.DataAccess;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.StudentTranscript;
using DiamondD.Services;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DiamondD.Web.Tests.TranscriptTests
{
    [TestClass]
    public class TranscriptTests
    {       
        [TestMethod]
        public void SqlTranscriptRepository_Can_Fetch_Student_Transript_Against_A_Valid_DbStudent()
        {
            ITranscriptRepository tr = new SqlTranscriptRepository();
            var transcript = tr.GetTranscript(TestConstants.DbStudentUserId);
            
            Assert.IsNotNull(transcript);
        }

        [TestMethod]
        public void TestTranscriptRepository_Can_Fetch_Student_Transript_Against_Test_Student()
        {
            ITranscriptRepository tr = new TestTranscriptRepository();
            var transcript = tr.GetTranscript(1);

            Assert.IsNotNull(transcript);
        }

        [TestMethod]
        public void TestTranscriptService_Can_Fetch_Student_Transript_Against_Test_Student()
        {
            ITranscriptService tr = new TranscriptService(new TestTranscriptRepository());
            var transcript = tr.GetTranscript(1);

            Assert.IsNotNull(transcript);
        }

        [TestMethod]
        public void TestTranscriptRepository_Returns_Valid_Transcript_Data_For_Test_Student()
        {
            ITranscriptRepository tr = new TestTranscriptRepository();
            
            var transcript = tr.GetTranscript(2);
            Assert.IsNotNull(transcript);

            var terms = transcript.Terms;
            Assert.IsNotNull(terms);

            double totalUnitsAttempted = 0;
            double totalUnitsCompleted = 0;
            double totalUnitsInProgress = 0;
            double gpaValue = 0.0;
            double gpaWeight = 0.0;

            foreach (var term in terms)
            {
                var courses = term.Courses;
                Assert.IsNotNull(courses);

                foreach (var course in courses)
                {
                    totalUnitsAttempted += course.UnitsAttempted;
                    totalUnitsCompleted += course.UnitsCompleted;
                    totalUnitsInProgress += course.UnitsInProgress;

                    if (course.GpaWeight != 0)
                    {
                        gpaValue += course.GpaValue;
                        gpaWeight += course.GpaWeight;
                    }
                }
            }

            double cgpa = gpaValue / gpaWeight;
            Assert.AreEqual(cgpa, transcript.Cgpa);
            Assert.AreEqual(totalUnitsCompleted, transcript.UnitsCompleted);
            Assert.AreEqual(totalUnitsAttempted, transcript.UnitsAttempted);
            Assert.AreEqual(totalUnitsInProgress, transcript.UnitsInProgress);            
        }

        [TestMethod]
        public void TestTranscriptService_Returns_Valid_Transcript_Data_For_Test_Student()
        {
            ITranscriptService tr = new TranscriptService(new TestTranscriptRepository());

            var transcript = tr.GetTranscript(2);
            Assert.IsNotNull(transcript);

            var terms = transcript.Terms;
            Assert.IsNotNull(terms);

            double totalUnitsAttempted = 0;
            double totalUnitsCompleted = 0;
            double totalUnitsInProgress = 0;
            double gpaValue = 0.0;
            double gpaWeight = 0.0;

            foreach (var term in terms)
            {
                var courses = term.Courses;
                Assert.IsNotNull(courses);

                foreach (var course in courses)
                {
                    totalUnitsAttempted += course.UnitsAttempted;
                    totalUnitsCompleted += course.UnitsCompleted;
                    totalUnitsInProgress += course.UnitsInProgress;

                    if (course.GpaWeight != 0)
                    {
                        gpaValue += course.GpaValue;
                        gpaWeight += course.GpaWeight;
                    }
                }
            }

            double cgpa = gpaValue / gpaWeight;
            Assert.AreEqual(cgpa, transcript.Cgpa);
            Assert.AreEqual(totalUnitsCompleted, transcript.UnitsCompleted);
            Assert.AreEqual(totalUnitsAttempted, transcript.UnitsAttempted);
            Assert.AreEqual(totalUnitsInProgress, transcript.UnitsInProgress);
        }

        [TestMethod]
        public void TestTranscriptRepository_Returns_Valid_Transcript_Data_For_DbStudent()
        {
            ITranscriptRepository tr = new SqlTranscriptRepository();

            var transcript = tr.GetTranscript(TestConstants.DbStudentUserId);
            Assert.IsNotNull(transcript);

            var terms = transcript.Terms;
            Assert.IsNotNull(terms);

            double totalUnitsAttempted = 0;
            double totalUnitsCompleted = 0;
            double totalUnitsInProgress = 0;
            double gpaValue = 0.0;
            double gpaWeight = 0.0;

            foreach (var term in terms)
            {
                var courses = term.Courses;
                Assert.IsNotNull(courses);

                foreach (var course in courses)
                {
                    totalUnitsAttempted += course.UnitsAttempted;
                    totalUnitsCompleted += course.UnitsCompleted;
                    totalUnitsInProgress += course.UnitsInProgress;

                    if (course.GpaWeight != 0)
                    {
                        gpaValue += course.GpaValue;
                        gpaWeight += course.GpaWeight;
                    }
                }
            }

            double cgpa = gpaValue / gpaWeight;
            Assert.AreEqual(cgpa, transcript.Cgpa);
            Assert.AreEqual(totalUnitsCompleted, transcript.UnitsCompleted);
            Assert.AreEqual(totalUnitsAttempted, transcript.UnitsAttempted);
            Assert.AreEqual(totalUnitsInProgress, transcript.UnitsInProgress);
        }

        [TestMethod]
        public void TranscriptService_TestTranscriptRepository_Fetches_Terms_against_Test_Student()
        {
            var tr = new TestTranscriptRepository();
            var ts = new TranscriptService(tr);
            
            var terms = tr.GetTranscript(1).Terms;

            Assert.IsNotNull(terms);
        }

        [TestMethod]
        public void TestTranscriptRepository_Fetches_Terms_against_Valid_Student()
        {
            ITranscriptRepository tr = new TestTranscriptRepository();
            var terms = tr.GetTranscript(1).Terms;

            Assert.IsNotNull(terms);
        }

        [TestMethod]
        public void TranscriptService_SqlTranscriptRepository_Fetches_Terms_against_DbStudent()
        {
            var tr = new SqlTranscriptRepository();
            var ts = new TranscriptService(tr);

            var terms = tr.GetTranscript(TestConstants.DbStudentUserId).Terms;

            Assert.IsNotNull(terms);
        }

        [TestMethod]
        public void SqlTranscriptRepository_Fetches_Terms_against_DbStudent()
        {
            ITranscriptRepository tr = new SqlTranscriptRepository();
            var terms = tr.GetTranscript(TestConstants.DbStudentUserId).Terms;

            Assert.IsNotNull(terms);
        }

        [TestMethod]
        public void TranscriptService_Returns_Not_Null_Data_against_Valid_DbStudent()
        {
            ITranscriptService tr = new TranscriptService();
            Transcript t = tr.GetTranscript(TestConstants.DbStudentUserId);

            Assert.IsNotNull(t.Cgpa);
            Assert.IsNotNull(t.Terms);

            foreach (var term in t.Terms)
            {
                // Database has entries where this field is null.
                Assert.IsNotNull(term.Courses);
            }

            Assert.IsNotNull(t.UnitsAttempted);
            Assert.IsNotNull(t.UnitsCompleted);
            Assert.IsNotNull(t.UnitsInProgress);
        }
    }
}