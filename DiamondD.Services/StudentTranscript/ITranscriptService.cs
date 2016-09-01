using System.Collections.Generic;
using DiamondD.Data.DataAccess;
using DiamondD.Data;
using DiamondD.Data.DataAccess.StudentTranscript;

namespace DiamondD.Services
{
    public interface ITranscriptService
    {
        Transcript GetTranscript(int studentNo);
    }
}