using System.Collections.Generic;
using DiamondD.Data.DataAccess;
using DiamondD.Data;
using DiamondD.Data.DataAccess.Transcript;

namespace DiamondD.Services
{
    public interface ITranscriptService
    {
        /// <summary>
        /// Get All Students Transcript.
        /// </summary>
        /// <returns>All students transcript</returns>
        IList<Transcript> GetTranscripts();
        /// <summary>
        /// Get Specific Student Transcript.
        /// </summary>
        /// <param name="StudentNo">give Student No. which student want take transcript</param>
        /// <returns>Specific student transcript</returns>
        IList<Transcript> GetTranscripts(int id);
        /// <summary>
        /// Get Term Wise transcript for specific student.
        /// </summary>
        /// <param name="StudentNo">provide student no.</param>
        /// <returns>Term Wise transcript</returns>
        IList<Term> GetTermsWise(int StudentNo);
        /// <summary>
        /// Calculate total GPA according student GPA value and student GPA wieght.
        /// </summary>
        /// <param name="TranscriptData">Provide student Transcript object.</param>
        /// <returns>Value of GPA</returns>
        double GetTotalGPA(IList<Transcript> TranscriptData);
        /// <summary>
        /// Calculate Total Units Attemps
        /// </summary>
        /// <param name="TranscriptData">provide transcript object.</param>
        /// <returns>Value of Total Units Attemps</returns>
        double GetTotalUnitsAttemps(IList<Transcript> TranscriptData);
        /// <summary>
        /// Calculate Total Units Completed.
        /// </summary>
        /// <param name="TranscriptData">Provide specific tTranscript object</param>
        /// <returns>Value of Total Units Completed</returns>
        double GetTotalUnitsCompleted(IList<Transcript> TranscriptData);
        /// <summary>
        /// Get Grade History View Model 
        /// </summary>
        /// <param name="Trancript">Provide transcript</param>
        /// <param name="TotalGPA">Total GPA value of student</param>
        /// <param name="TotalUnitsAttemps">Total Units Attemps value of student</param>
        /// <param name="TotalUnitsCompleted">Total Units Completed value of student</param>
        /// <returns>object of Grade History View Model</returns>
        GradeHistory GetGradeHistoryViewModel(IList<Transcript> Trancript, double TotalGPA, double TotalUnitsAttemps, double TotalUnitsCompleted);
        /// <summary>
        /// Get Trancript View Model
        /// </summary>
        /// <param name="termData">Provide transcript object</param>
        /// <returns>object of Trancript View Model</returns>
        TrancriptViewModel GetTrancriptViewModel(IList<Term> termData);
    }
}