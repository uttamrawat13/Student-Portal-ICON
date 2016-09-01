using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Settings;

namespace DiamondD.Data.DataAccess.Repositories.Base
{
    public interface ISettingsRepository : IBaseRepository
    {
        string GetWelcomeMsgText();
        void UpdateWelcomeMsg(string MsgText);
        string GetLoginMsgText();
        void UpdateLoginMsg(string MsgText);
        string GetTitleMsgText();
        void UpdateTitleMsg(string titleMsg);
        void UpdateLogoFileName(string fileName);
        string GetLogoFileName();
        string GetConfigration(string settingName);
        ForgetUsernameSetting GetForgetUsernameSetting();
        void UpdateForgetUsernameSetting(ForgetUsernameSetting setting);
    }
}
