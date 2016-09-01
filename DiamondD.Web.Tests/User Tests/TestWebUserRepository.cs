using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.User;
using DiamondD.Services.User;

namespace DiamondD.Web.Tests.User_Tests
{
    public class TestWebUserRepository : IWebUserRepository
    {
        private readonly Dictionary<string, WebUser> _testUsers = new Dictionary<string, WebUser>();
        private string _welcomeMessageText;
        private string _titleText;
        private string _loginMessageText;
        private string _logoFilename;
        private readonly IList<string> studentRights;
        private readonly IList<string> adminRights;

        public TestWebUserRepository()
        {
            studentRights = new List<string> { "Report 1", "Report 2", "Report 3" };
            adminRights = new List<string> { "Report 1", "Report 2", "Report 3", "Report 4", "Report 5" };

            _welcomeMessageText = "Test Welcome Message!";
            _loginMessageText = "Test Login Message!";

            var webUser1 = new WebUser
                               {
                                   AccountStatus = "Active",
                                   SecretQuestion = "May favourite weather?",
                                   SecretAnswer = "Winter",
                                   Email = "alex@diamondd.com",
                                   WebUserId = 1,
                                   UserName = "alex",
                                   WebPassword = "wonderland",
                                   Role = "Student",
                                   VisibleReports = studentRights,
                                   RoleReportsRights = studentRights,
                                   DateofBirth = new DateTime(1990, 2, 13),
                                   StudentId = "200500001"                                   
                               };

            _testUsers.Add(webUser1.StudentId, webUser1);


            var webUser2 = new WebUser
                               {
                                   AccountStatus = "Active",
                                   SecretQuestion = "My favourite soprt?",
                                   SecretAnswer = "Soccer",
                                   Email = "bob@diamondd.com",
                                   WebUserId = 2,
                                   UserName = "bob",
                                   WebPassword = "fifa",
                                   Role = "Student",
                                   VisibleReports = studentRights,
                                   RoleReportsRights = studentRights,
                                   DateofBirth = new DateTime(1980, 3, 23),
                                   StudentId = "200500002"
                               };

            _testUsers.Add(webUser2.StudentId, webUser2);


            var webUser3 = new WebUser
                               {
                                   AccountStatus = "Active",
                                   SecretQuestion = "My mobile phone's company?",
                                   SecretAnswer = "nokia",
                                   Email = "carol@diamondd.com",
                                   WebUserId = 3,
                                   UserName = "carol",
                                   WebPassword = "cell",
                                   Role = "Admin",
                                   VisibleReports = adminRights,                                       
                                   RoleReportsRights = adminRights,
                                   DateofBirth = new DateTime(1970, 6, 23),
                                   StudentId = "200600001"

                               };

            _testUsers.Add(webUser3.StudentId, webUser3);

        }

        public WebUser VerifyCredantials(string userName, string password)
        {
            foreach (var user in _testUsers.Values)
            {
                if (user.UserName.Equals(userName) && user.WebPassword.Equals(password))
                    return user;
            }

            return null;
        }

        public bool Register(WebUser webUserInfo)
        {
            _testUsers.Add(webUserInfo.StudentId, webUserInfo);
            return true;
        }

        public WebUser GetUserInfo(int studentNo)
        {
            return _testUsers.Values.FirstOrDefault(user => user.WebUserId == studentNo);
        }

        public void UpdateSecretQuestionAnswer(int studentNo, string question, string answer)
        {
            foreach (var user in _testUsers.Values)
            {
                if (user.WebUserId.Equals(studentNo))
                {
                    user.SecretQuestion = question;
                    user.SecretAnswer = answer;
                }
                    return;
            }
        }

        public void UpdateEmail(int studentNo, string Email)
        {
            foreach (var user in _testUsers.Values)
            {
                if (user.WebUserId.Equals(studentNo))
                {
                    user.Email = Email;
                }
                return;
            }
        }
        public void UpdatePassword(int studentNo, string password)
        {
            foreach (var user in _testUsers.Values)
            {
                if (user.WebUserId.Equals(studentNo))
                {
                    user.WebPassword = password;
                }
                return;
            }
        }
        public IList<string> GetRoleRights(string roleName)
        {

            if (roleName.Equals(WebUserRole.Student))
                return studentRights;
            else if (roleName.Equals(WebUserRole.Admin))
                return adminRights;

            return new List<string>();
        }

        public void UpdateReportsRight(string reportsName, string roleName)
        {
            return; 
        }
        public string GetWelcomeMsgText()
        {
            return _welcomeMessageText;
        }
        public void UpdateWelcomeMsg(string msgText)
        {
            _welcomeMessageText = msgText;
        }
        public string GetLoginMsgText()
        {
            return _loginMessageText;
        }
        public void UpdateLoginMsg(string msgText)
        {
            _loginMessageText = msgText;
        }

        public string GetPassword(string userName)
        {
            foreach (var kvp in _testUsers)
            {
                var user = kvp.Value;
                if (user.UserName.Equals(userName))
                    return user.WebPassword;
            }
            return null;
        }

        public bool ConfirmSecretAnswer(string userName, string secretAnswer)
        {
            foreach (var kvp in _testUsers)
            {
                var user = kvp.Value;
                if (user.UserName.Equals(userName))
                    return user.SecretAnswer.Equals(secretAnswer);
            }
            return false;
        }

        public string GetSecretQuestion(string userName)
        {
            foreach (var kvp in _testUsers)
            {
                var user = kvp.Value;
                if (user.UserName.Equals(userName))
                    return user.SecretQuestion;
            }
            return null;
        }

        public string GetTitleMsgText()
        {
            return _titleText;
        }

        public void UpdateTitleMsg(string titleMsg)
        {
            _titleText = titleMsg;
        }

        public void UpdateLogoFileName(string fileName)
        {
            _logoFilename = fileName;
        }

        public string GetLogoFileName()
        {
            return _logoFilename;
        }


        public WebUser GetUserInfo(string studentRollNo)
        {
            foreach (var kvp in _testUsers)
            {
                var user = kvp.Value;
                if (user.StudentId.Equals(studentRollNo))
                    return user;
            }
            return null;
        }


        public WebUser GetUserInfoByEmail(string email)
        {
            foreach (var kvp in _testUsers)
            {
                var user = kvp.Value;
                if (user.Email.Equals(email))
                    return user;
            }
            return null;
        }
    }
}
