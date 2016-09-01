using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Settings;

namespace DiamondD.Services.Settings
{
    public interface ISettingsService
    {
        string GetTitleMsg();
        void UpdateTitleMsg(string titleMsg);
        void UpdateLogoFileName(string fileName);
        string GetLogoFileName();
        string GetConfigration(string settingName);
        string GetWelcomeMsgText();
        void UpdateWelcomeMsg(string MsgText);
        string GetLoginMsgText();
        void UpdateLoginMsg(string MsgText);
        ForgetUsernameSetting GetForgetUsernameSetting();
        void UpdateForgetUsernameSetting(ForgetUsernameSetting setting);
    }
}
