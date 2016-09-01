using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.User;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface IWebUserRepository : IBaseRepository
    {
        WebUser GetUserInfo(int studentNo);
        WebUser VerifyCredantials(string userName, string password);
        bool Register(WebUser webUserInfo);
        void UpdateSecretQuestionAnswer(int studentNo, string question, string answer);
        void UpdateEmail(int studentNo, string email);
        void UpdatePassword(int studentNo, string password);
        IList<string> GetRoleRights(string roleName);
        void UpdateReportsRight(string reportsName, string roleName);
        string GetPassword(string userName);
        bool ConfirmSecretAnswer(string userName, string secretAnswer);
        string GetSecretQuestion(string userName);
        WebUser GetUserInfo(string studentRollNo);
        WebUser GetUserInfoByEmail(string email);
    }
}
