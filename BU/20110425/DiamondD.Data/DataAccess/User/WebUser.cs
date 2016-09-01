using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.User
{
    public class WebUser
    {
        public int WebUserId { get; set; }
        public string UserName { get; set; }
        public string WebPassword { get; set; }
        public string Email { get; set; }
        public string AccountStatus { get; set; }
        public string SecretQuestion { get; set; }
        public string SecretAnswer { get; set; }
        public string Role { get; set; }
        public IList<string> VisibleReports { get; set; }
        public IList<string> RoleReportsRights { get; set; }
        public string WelcomeMsg { get; set; }
        public string LoginMsg { get; set; }
    }
}
