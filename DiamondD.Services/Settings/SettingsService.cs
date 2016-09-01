using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DiamondD.Services.Common;
using System.Data.SqlClient;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Settings;

namespace DiamondD.Services.Settings
{
    public class SettingsService : ISettingsService
    {
        private readonly ISettingsRepository _repository;
        private readonly ILogService _logService;

        public SettingsService()
        {
            _repository = new SqlSettingsRepository();
            _logService = new LogService();
        }

        public SettingsService(ISettingsRepository repository, ILogService logService)
        {
            _repository = repository;
            _logService = logService;
        }

        public string GetWelcomeMsgText()
        {
            string welcomeMsgText = null;
            try
            {
                welcomeMsgText = _repository.GetWelcomeMsgText();
                return welcomeMsgText;
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public string GetLoginMsgText()
        {
            string LoginMsgText = null;
            try
            {
                LoginMsgText = _repository.GetLoginMsgText();
                return LoginMsgText;
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public void UpdateWelcomeMsg(string MsgText)
        {
            try
            {
                _repository.UpdateWelcomeMsg(MsgText);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public void UpdateLoginMsg(string MsgText)
        {
            try
            {
                _repository.UpdateLoginMsg(MsgText);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public string GetTitleMsg()
        {
            string TitleMsgText = null;
            try
            {
                TitleMsgText = _repository.GetTitleMsgText();
                return TitleMsgText;
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public void UpdateTitleMsg(string titleMsg)
        {
            try
            {
                _repository.UpdateTitleMsg(titleMsg);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public void UpdateLogoFileName(string fileName)
        {
            try
            {
                _repository.UpdateLogoFileName(fileName);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public string GetLogoFileName()
        {
            string logoFileName = "";
            try
            {
                logoFileName = _repository.GetLogoFileName();
                return logoFileName;
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public ForgetUsernameSetting GetForgetUsernameSetting()
        {
            try
            {
                ForgetUsernameSetting forgetUsernameSetting = _repository.GetForgetUsernameSetting();
                return forgetUsernameSetting;
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public void UpdateForgetUsernameSetting(ForgetUsernameSetting forgetUsernameSetting)
        {
            try
            {
                _repository.UpdateForgetUsernameSetting(forgetUsernameSetting);
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }

        public string GetConfigration(string settingName)
        {
            string value = null;
            try
            {
                value = _repository.GetConfigration(settingName);
                return value;
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
      
    }
}
