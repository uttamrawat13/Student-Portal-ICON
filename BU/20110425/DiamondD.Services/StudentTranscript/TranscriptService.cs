using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.StudentTranscript;
using DiamondD.Data.DataAccess;
using System.Data.SqlClient;
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

        public Transcript GetTranscript(int studentNo)
        {
             try
             {
                 return _repository.GetTranscript(studentNo);
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
    }
}
