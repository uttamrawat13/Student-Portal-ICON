using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.StudentTranscript;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface ITranscriptRepository : IBaseRepository
    {
        Transcript GetTranscript(int studentNo);
    }
}