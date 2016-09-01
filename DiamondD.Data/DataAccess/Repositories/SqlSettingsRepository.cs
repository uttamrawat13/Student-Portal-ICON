using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Settings;
using System.Data;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlSettingsRepository : ISettingsRepository
    {
        public string GetWelcomeMsgText()
        {
            return GetSetting(DDSettings.WelcomeMsg.ToString());
        }

        public string GetLoginMsgText()
        {
            return GetSetting(DDSettings.LoginMsg.ToString());
        }

        public void UpdateWelcomeMsg(string msgText)
        {
            UpdateSetting(DDSettings.WelcomeMsg.ToString(), msgText);
        }

        public void UpdateLoginMsg(string msgText)
        {
            UpdateSetting(DDSettings.LoginMsg.ToString(), msgText);
        }

        public string GetTitleMsgText()
        {
            return GetSetting(DDSettings.TitleMsg.ToString());
        }

        public void UpdateTitleMsg(string titleMsg)
        {
            UpdateSetting(DDSettings.TitleMsg.ToString(), titleMsg);
        }

        public void UpdateLogoFileName(string fileName)
        {
            UpdateSetting(DDSettings.LogoFileName.ToString(), fileName);
        }

        public string GetLogoFileName()
        {
            return GetSetting(DDSettings.LogoFileName.ToString());
        }

        public ForgetUsernameSetting GetForgetUsernameSetting()
        {
            string dbSetting = GetSetting("ForgetUsernameSetting");
            
            int value = int.Parse(dbSetting);
            ForgetUsernameSetting setting = (ForgetUsernameSetting)value;

            return setting;
        }

        public void UpdateForgetUsernameSetting(ForgetUsernameSetting newSetting)
        {
            UpdateSetting("ForgetUsernameSetting", ((Int16)newSetting).ToString());
        }

        public string GetSetting(DDSettings setting)
        {
            return GetSetting(setting.ToString());
        }

        public void UpdateSetting(DDSettings settingName, string settingValue)
        {
            UpdateSetting(settingName.ToString(), settingValue);
        }

        internal string GetSetting(string settingName)
        {
            StringBuilder query = new StringBuilder();
            query.AppendFormat("SELECT MsgText ")
                .AppendFormat(" FROM WebCustomMessages ")
                .AppendFormat(" WHERE Msgname = '{0}'", settingName);

            var reader = this.ExecuteScalar(CommandType.Text, query.ToString());
            string settingValue = reader.ToString();

            return settingValue;
        }

        internal void UpdateSetting(string settingName, string settingValue)
        {
            settingValue = settingValue.Replace("'", "''");

            var query = new StringBuilder();            
            query.AppendFormat(
                "UPDATE WebCustomMessages SET MsgText = '{0}' ", settingValue)
                .AppendFormat(" WHERE MsgName ='{0}'", settingName);

            this.ExecuteNonQuery(CommandType.Text, query.ToString());        
        }


        public string GetConfigration(string settingName)
        {
            StringBuilder query = new StringBuilder();
            query.AppendFormat("SELECT MsgText ")
                .AppendFormat(" FROM WebCustomMessages ")
                .AppendFormat(" WHERE Msgname = '{0}'", settingName);

            var reader = this.ExecuteScalar(CommandType.Text, query.ToString());
            string settingValue = reader.ToString();

            return settingValue;

           
        }
    }
}
