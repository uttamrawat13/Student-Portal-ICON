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
        private readonly Dictionary<int, WebUser> _testUsers = new Dictionary<int, WebUser>();

        public TestWebUserRepository()
        {
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
                                   VisibleReports = new List<string> {"Report 1", "Report 2", "Report 3"},
                                   RoleReportsRights = new List<string> { "Report 2", "Report 3" }
                                   
                               };

            _testUsers.Add(webUser1.WebUserId, webUser1);


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
                                   VisibleReports = new List<string> { "Report 1", "Report 2" },
                                   RoleReportsRights = new List<string> { "Report 1"}
                               };

            _testUsers.Add(webUser2.WebUserId, webUser2);


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
                VisibleReports = new List<string> { "Report 1", "Report 2", "Report 3", "Report 4", "Report 5" },
                RoleReportsRights = new List<string> { "Report 1", "Report 2", "Report 3", "Report 4", "Report 5" }
            };

            _testUsers.Add(webUser3.WebUserId, webUser3);

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

        public void Register(WebUser webUserInfo)
        {
            _testUsers.Add(webUserInfo.WebUserId, webUserInfo);
        }

        public WebUser GetUserInfo(int studentNo)
        {
            WebUser user;
            _testUsers.TryGetValue(studentNo, out user);

            return user;
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
            //foreach (var user in _testUsers.Values)
            //{
            //    if (user.)
            //    {
            //        user.WebPassword = password;
            //    }
            //    return;
            //}
            return null;
        }

        public void UpdateReportsRight(string reportsName, string roleName)
        {
            return; 
        }
        public string GetWelcomeMsgText()
        {
            return null;
        }
        public void UpdateWelcomeMsg(string MsgText)
        {
            return;
        }
        public string GetLoginMsgText()
        {
            return null;
        }
        public void UpdateLoginMsg(string MsgText)
        {
            return;
        }
    }
}
