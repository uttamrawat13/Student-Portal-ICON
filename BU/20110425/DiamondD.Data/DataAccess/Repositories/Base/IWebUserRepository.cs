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
        void Register(WebUser webUserInfo);
        void UpdateSecretQuestionAnswer(int studentNo, string question, string answer);
        void UpdateEmail(int studentNo, string email);
        void UpdatePassword(int studentNo, string password);
        IList<string> GetRoleRights(string roleName);
        void UpdateReportsRight(string reportsName, string roleName);
        string GetWelcomeMsgText();
        void UpdateWelcomeMsg(string MsgText);
        string GetLoginMsgText();
        void UpdateLoginMsg(string MsgText);
    }
}
