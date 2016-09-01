using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data;
using DiamondD.Data.DataAccess.Transcript;
using DiamondD.Data.DataAccess;
using System.Data.SqlClient;
using DiamondD.Data.Filters;
using DiamondD.Services.Common;

namespace DiamondD.Services
{
    public class TranscriptService : ITranscriptService
    {
        private readonly ITranscriptRepository _repository;

        #region Constructors ...
        
        public TranscriptService()
        {
            _repository = new SqlTranscriptRepository();
        }
        public TranscriptService(ITranscriptRepository repository)
        {
            _repository = repository;
        }

        #endregion

        #region Get Transcript ... 
        /// <summary>
        /// Get All Students Transcript.
        /// </summary>
        /// <returns>All students transcript</returns>
        public IList<Transcript> GetTranscripts()
        {
            try
            {
                return _repository.GetTranscripts().ToList();
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
        /// <summary>
        /// Get Specific Student Transcript.
        /// </summary>
        /// <param name="studentNo">give Student No. which student want take transcript</param>
        /// <returns>Specific student transcript</returns>
        public IList<Transcript> GetTranscripts(int studentNo)
        {
            try
            {
                return _repository.GetTranscripts().WithId(studentNo).ToList();
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        #endregion

        #region Calculate Total GPA ...
        
        /// <summary>
        /// Calculate total GPA according student GPA value and student GPA wieght.
        /// </summary>
        /// <param name="TranscriptData">Provide student Transcript object.</param>
        /// <returns>Value of GPA</returns>
        public double GetTotalGPA(IList<Transcript> transcriptData)
        {
            double studentGPAValue = 0.000;
            double studentGPAWeight = 0.000;
            foreach (var data in transcriptData)
            {
                studentGPAValue = studentGPAValue + Convert.ToDouble(data.StudentGpaValue);
                studentGPAWeight = studentGPAWeight + Convert.ToDouble(data.StudentGpaWeight);

            }
            // Formula for get Total GPA
            return studentGPAValue / studentGPAWeight;
        }
        
        #endregion

        #region Get Total Units Attemps ...
        /// <summary>
        /// Calculate Total Units Attemps
        /// </summary>
        /// <param name="TranscriptData">provide transcript object.</param>
        /// <returns>Value of Total Units Attemps</returns>
        public double GetTotalUnitsAttemps(IList<Transcript> transcriptData)
        {
            double totalAttemps = 0.00;
            foreach (var data in transcriptData)
                totalAttemps = totalAttemps + Convert.ToDouble(data.StudentUnitsAttempted);
            return totalAttemps;
        }
        
        #endregion

        #region Get Total Units Completed ...
        /// <summary>
        /// Calculate Total Units Completed.
        /// </summary>
        /// <param name="TranscriptData">Provide specific tTranscript object</param>
        /// <returns>Value of Total Units Completed</returns>
        public double GetTotalUnitsCompleted(IList<Transcript> transcriptData)
        {
            double totalUnitsCmpleted = 0.00;
            foreach (var data in transcriptData)
                totalUnitsCmpleted = totalUnitsCmpleted + Convert.ToDouble(data.StudentUnitsCompleted);
            return totalUnitsCmpleted;
        }

        #endregion

        #region Get Terms Wise Transcript ...
        /// <summary>
        /// Get Term Wise transcript for specific student.
        /// </summary>
        /// <param name="StudentNo">provide student no.</param>
        /// <returns>Term Wise transcript</returns>
        public IList<Term> GetTermsWise(int studentNo)
        {
            try
            {
                IList<Term> termdata = _repository.GetTerms(studentNo);
                // Get Transcript ...
                return GenerateTranscriptTermWise(termdata);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
        private IList<Term> GenerateTranscriptTermWise(IList<Term> termdata)
        {
            List<Term> termWiseTranscript = new List<Term>();

            double? cumulativeTotalUnitsAttemps = 0.00f;
            double? cumulativeTotalUnitsComplate = 0.00f;
            double? cumulativeTotalGPAValue = 0.00f;
            double? cumulativeTotalGPAWeight = 0.00f;

            foreach (var termsdata in termdata)
            {
                Term data = new Term();
                Term termWiseData = GetTermWiseData(termsdata.CourseDetail,ref cumulativeTotalUnitsAttemps,ref cumulativeTotalUnitsComplate,ref cumulativeTotalGPAValue,ref cumulativeTotalGPAWeight);
                data.TermDesc = termsdata.TermDesc;
                data.TermTotalUnitsAttempted = termWiseData.TermTotalUnitsAttempted;
                data.TermTotalUnitsCompleted = termWiseData.TermTotalUnitsCompleted;
                data.TermTotalGpa = termWiseData.TermTotalGpa;
                data.CumulativeTotalUnitsAttempted = termWiseData.CumulativeTotalUnitsAttempted;
                data.CumulativeTotalUnitsCompleted = termWiseData.CumulativeTotalUnitsCompleted;
                data.CumulativeTotalGpa =termWiseData.CumulativeTotalGpa;
                data.CourseDetail = termsdata.CourseDetail;
                termWiseTranscript.Add(data);
            }


            return (List<Term>)termWiseTranscript;
        }
        private Term GetTermWiseData(IList<CourseDetail> coursedetail,ref double? cumulativeTotalUnitsAttemps,ref double? cumulativeTotalUnitsComplate,ref double? cumulativeTotalGPAValue,ref double? cumulativeTotalGPAWeight)
        {
            Term obj = new Term();
            double? termWiseTotalAttemps = 0.00f;
            double? termWiseTotalComplete = 0.00f;
            double? studentGPAValue = 0.00f;
            double? studentGPAWeight = 0.00f;
            foreach (var data in coursedetail)
            {
                termWiseTotalAttemps = termWiseTotalAttemps + data.StudentUnitsAttempted;
                termWiseTotalComplete = termWiseTotalComplete + data.StudentUnitsCompleted;
                studentGPAValue = studentGPAValue + data.StudentGpaValue;
                studentGPAWeight = studentGPAWeight + data.StudentGpaWeight;
                cumulativeTotalUnitsAttemps = cumulativeTotalUnitsAttemps + data.StudentUnitsAttempted;
                cumulativeTotalUnitsComplate = cumulativeTotalUnitsComplate + data.StudentUnitsCompleted;
                cumulativeTotalGPAValue = cumulativeTotalGPAValue + data.StudentGpaValue;
                cumulativeTotalGPAWeight = cumulativeTotalGPAWeight + data.StudentGpaWeight;
            }
            double CGPA = Convert.ToDouble(cumulativeTotalGPAValue / cumulativeTotalGPAWeight);
            obj.CumulativeTotalGpa = Convert.ToDouble(Math.Round(CGPA, 2));
            obj.CumulativeTotalUnitsAttempted = cumulativeTotalUnitsAttemps;
            obj.CumulativeTotalUnitsCompleted=cumulativeTotalUnitsComplate;
            CGPA = Convert.ToDouble(studentGPAValue / studentGPAWeight);
            obj.TermTotalGpa = Convert.ToDouble(Math.Round(CGPA, 2));
            obj.TermTotalUnitsAttempted = termWiseTotalAttemps;
            obj.TermTotalUnitsCompleted = termWiseTotalComplete;
            return obj;
        }
        
        #endregion

        #region Get Grade History View Model ...
        /// <summary>
        /// Get Grade History View Model 
        /// </summary>
        /// <param name="Trancript">Provide transcript</param>
        /// <param name="TotalGPA">Total GPA value of student</param>
        /// <param name="TotalUnitsAttemps">Total Units Attemps value of student</param>
        /// <param name="TotalUnitsCompleted">Total Units Completed value of student</param>
        /// <returns>object of Grade History View Model</returns>
        public GradeHistory GetGradeHistoryViewModel(IList<Transcript> trancript, double totalGPA, double totalUnitsAttemps, double totalUnitsCompleted)
        {
            try
            {
                return new GradeHistory(trancript, totalGPA, totalUnitsAttemps, totalUnitsCompleted);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
        #endregion

        #region Get Trancript View Model ...
        /// <summary>
        /// Get Trancript View Model
        /// </summary>
        /// <param name="termData">Provide transcript object</param>
        /// <returns>object of Trancript View Model</returns>
        public TrancriptViewModel GetTrancriptViewModel(IList<Term> termData)
        {
            try
            {
                return new TrancriptViewModel(termData);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        #endregion
    }
}
