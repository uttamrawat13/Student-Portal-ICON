﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DiamondD.Data.DataAccess.Repositories;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Services.Common;
using DiamondD.Data.DataAccess.User;

namespace DiamondD.Services.User
{
    public class WebUserService : IWebUserService
    {
        private readonly IWebUserRepository _repository;
        private readonly ILogService _logService;

        public WebUserService()
        {
            _repository = new SqlWebUserRepository();
            _logService = new LogService();
        }

        public WebUserService(IWebUserRepository repository, ILogService logService)
        {
            _repository = repository;
            _logService = logService;
        }

        public WebUser VerifyCredentials(string userName, string password)
        {
            try
            {
                var webUser = _repository.VerifyCredantials(userName, password);

                if (webUser != null)
                {
                    _logService.LogUserAction(userName, "Logged in.", "");
                }

                return webUser;
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

        public void Logout(string userName)
        {
            try
            {
                _logService.LogUserAction(userName, "Logged out.", "");   
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

        public void Register(WebUser webUserInfo)
        {
            try
            {
            _repository.Register(webUserInfo);
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


        public WebUser GetUserInfo(int studentNo)
        {
            try
            {
            return _repository.GetUserInfo(studentNo);
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

        public void UpdateSecretQuestionAnswer(int studentNo, string question, string answer)
        {
            try
            {
            _repository.UpdateSecretQuestionAnswer(studentNo, question, answer);
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

        public void UpdateEmail(int studentNo, string Email)
        {
            try
            {
            _repository.UpdateEmail(studentNo, Email);
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

        public void UpdatePassword(int studentNo, string password)
        {
            try
            {
            _repository.UpdatePassword(studentNo, password);
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

        public IList<string> GetRoleRights(string roleName)
        {
            try
            {
                IList<string> roleRightsList =  _repository.GetRoleRights(roleName);
                return roleRightsList;
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

        public void UpdateReportsRight(string reportsName, string roleName)
        {
            try
            {
                _repository.UpdateReportsRight(reportsName, roleName);
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