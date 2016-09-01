using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DiamondD.Data.DataAccess.User
{
    public class WebUser
    {
        

        public WebUser()
        {            
            VisibleReports = new List<string>();
            RoleReportsRights = new List<string>();
            AccountStatus = "InActive";
        }

        public int? WebUserId { get; set; }
        public string UserName { get; set; }
        public string WebPassword { get; set; }
        public string Email { get; set; }
        public int EmailSent { get; set; }
   
        public string AccountStatus { get; set; }
        public string SecretQuestion { get; set; }
        public string SecretAnswer { get; set; }
        public string Role { get; set; }
        public IList<string> VisibleReports { get; set; }
        public IList<string> RoleReportsRights { get; set; }
        public string WelcomeMsg { get; set; }
        public string LoginMsg { get; set; }
        public string TitleMsg { get; set; }
        public Int16 EmailOrStudentId { get; set; }
        public DateTime? DateofBirth { get; set; }
        public string StudentId { get; set; }

        public string LogoFileName{ get;set; }
        
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.AppendFormat(
                "WebUserId:{0}, UserName:{1}, WebPassword:{2}, Email:{3}, AccountStatus:{4}, SecretQuestion:{5}, SecretAnswer:{6}, Role:{7}",
                WebUserId, UserName, WebPassword, Email, AccountStatus, SecretQuestion, SecretAnswer, Role);
                        
            return sb.ToString();
        }
    }
}
