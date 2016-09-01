using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.User;

namespace DiamondD.Services.User
{
    public interface IWebUserService
    {
        WebUser GetUserInfo(int studentNo);
       
        WebUser VerifyCredentials(string username, string password);
        void Logout(string username);

        bool Register(WebUser webUserInfo);

        void UpdateSecretQuestionAnswer(int studentNo, string question, string answer);
        void UpdateEmail(int studentNo, string email);
        void UpdatePassword(int studentNo, string password);
        IList<string> GetRoleRights(string roleName);
        void UpdateReportsRight(string reportsName, string roleName);
        string GetPassword(string userName);

        bool ConfirmSecretAnswer(string userName, string secretAnswer);
        string GetSecretQuestion(string id);

        WebUser GetUserInfo(string RollNumber);
        WebUser GetUserInfoByEmail(string email);
    }
}
