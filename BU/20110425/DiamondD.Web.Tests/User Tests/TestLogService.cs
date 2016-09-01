using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Services.Common;
using DiamondD.Data.DataAccess.Log;

namespace DiamondD.Web.Tests.User_Tests
{
    public class TestLogService : ILogService
    {
        private readonly List<string> _log = new List<string>();

        public void LogUserAction(string userName, string action, string note)
        {
            string entry = string.Format("{0}:{1}:{2}:{3}", userName, action, note, DateTime.Now);
            _log.Add(entry);
        }
    }
}
