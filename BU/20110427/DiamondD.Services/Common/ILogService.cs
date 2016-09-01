using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Services.Common
{
    public interface ILogService
    {
        void LogUserAction(string userName, string action, string note);
    }
}
