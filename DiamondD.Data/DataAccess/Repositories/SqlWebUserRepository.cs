using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.User;
using DiamondD.Data.Properties;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;
using DiamondD.Data.DataAccess.Repositories.Base;

namespace DiamondD.Data.DataAccess.Repositories
{
    public class SqlWebUserRepository : IWebUserRepository
    {
        public WebUser VerifyCredantials(string userName, string password)
        {
            userName = userName.Replace("'", "''");
            password = password.Replace("'", "''");

            var query = new StringBuilder();
            query.AppendFormat("SELECT WebUserId, WebUserName, WebPassword, Email, AccountStatus, PasswordQuestion, PasswordAnswer, WebUserRole.RoleName, DateOfBirth, StudentId,EmailSent ")
                .AppendFormat(" FROM WebUser, WebUserRole ") 
                .AppendFormat(" WHERE WebUserName='{0}' AND WebPassword='{1}' AND WebUser.RoleId = WebUserRole.RoleId AND AccountStatus='Active'", userName, password);

            WebUser webUser = null;           

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                if (reader.Read())
                {
                    webUser = new WebUser();

                    int colIndex = -1;
                    webUser.WebUserId = reader.GetInt32(++colIndex);
                    webUser.UserName = reader.GetString(++colIndex);
                    webUser.WebPassword = reader.GetString(++colIndex);
                    webUser.Email = reader.GetString(++colIndex);
                    webUser.AccountStatus = reader.GetString(++colIndex);
                    webUser.SecretQuestion = reader.GetString(++colIndex);
                    webUser.SecretAnswer = reader.GetString(++colIndex);
                    webUser.Role = reader.GetString(++colIndex);
                    webUser.DateofBirth = reader[++colIndex] as DateTime?;
                    webUser.StudentId = reader[++colIndex] as string;
                    webUser.EmailSent = reader.GetInt32(++colIndex);
                }
            }

            if (webUser != null)
                webUser.VisibleReports = GetRoleRights(webUser.Role);

            return webUser;
        }

        public IList<string> GetRoleRights(string roleName)
        {
            StringBuilder query;

            query = new StringBuilder();
            query.AppendFormat("SELECT WebReport.ReportName ")
                .AppendFormat(" FROM WebRoleReportRights, WebUserRole, WebReport ")
                .AppendFormat(" WHERE WebUserRole.RoleId = WebRoleReportRights.RoleId  ")
                .AppendFormat("   AND WebReport.ReportId = WebRoleReportRights.ReportId AND WebUserRole.RoleName = '{0}'",
                              roleName);

            var visibleReports = new List<string>();
            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                while (reader.Read())
                {
                    string reportName = reader.GetString(0);
                    visibleReports.Add(reportName);
                }
            }
            
            return visibleReports;
        }

        public bool Register(WebUser webUser)
        {
            var query = new StringBuilder();
            query.AppendFormat(" SELECT DISTINCT WebUserRole.RoleId ")
                .AppendFormat("  FROM WebUserRole, WebUser ")
                .AppendFormat("  WHERE WebUserRole.RoleId = WebUser.RoleId AND WebUserRole.RoleName='{0}'", WebUserRole.Student.ToString()); // Since we'll always be registering a Student

            var roleId = this.ExecuteScalar(CommandType.Text, query.ToString());

            webUser.SecretQuestion = webUser.SecretQuestion.Replace("'", "''");
            webUser.SecretAnswer = webUser.SecretAnswer.Replace("'", "''");
            webUser.UserName = webUser.UserName.Replace("'", "''");
            webUser.WebPassword = webUser.WebPassword.Replace("'", "''");
            webUser.StudentId = webUser.StudentId.Replace("'", "''");
            webUser.Email = webUser.Email.Replace("'", "''");


            var userName = (int)this.ExecuteScalar(CommandType.Text,
                                              "SELECT count(*) FROM WebUser WHERE WebUserName = '" + webUser.UserName +
                                              "'");
            if (userName != 0)
                return false;
            
            query = new StringBuilder();
            query.AppendFormat(
                "INSERT INTO WebUser(WebUserName, WebPassword, Email, AccountStatus, PasswordQuestion, PasswordAnswer, RoleId, DateOfBirth, StudentId) ")
                .AppendFormat(" VALUES('{0}','{1}','{2}','{3}','{4}', '{5}', {6}, '{7}', '{8}')", webUser.UserName, webUser.WebPassword,
                              webUser.Email, webUser.AccountStatus, webUser.SecretQuestion, webUser.SecretAnswer, roleId, webUser.DateofBirth, webUser.StudentId);

            this.ExecuteNonQuery(CommandType.Text, query.ToString());
            return true;
        }

        public WebUser GetUserInfo(int studentNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT WebUserId, WebUserName, WebPassword, Email, AccountStatus, PasswordQuestion, PasswordAnswer, WebUserRole.RoleName, DateOfBirth, StudentId ")
                .AppendFormat(" FROM WebUser, WebUserRole ")
                .AppendFormat(" WHERE WebUserId={0} AND WebUser.RoleId = WebUserRole.RoleId AND WebUser.AccountStatus='Active'", studentNo);

            WebUser webUser = null;
            
            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                webUser = GetUserInfo(reader);
            }

            if (webUser != null)
                webUser.VisibleReports = GetRoleRights(webUser.Role);

            return webUser;
        }

        public WebUser GetUserInfoByEmail(string email)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT WebUserId, WebUserName, WebPassword, Email, AccountStatus, PasswordQuestion, PasswordAnswer, WebUserRole.RoleName, DateOfBirth, StudentId ")
                .AppendFormat(" FROM WebUser, WebUserRole ")
                .AppendFormat(" WHERE Email='{0}' AND WebUser.RoleId = WebUserRole.RoleId AND WebUser.AccountStatus='Active'", email);

            WebUser webUser = null;

            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                //if (reader.Read())
                //{
                    webUser = GetUserInfo(reader);
                //}
            }

            if (webUser != null)
                webUser.VisibleReports = GetRoleRights(webUser.Role);

            return webUser;
        }

        public WebUser GetUserInfo(string studentRollNo)
        {
            var query = new StringBuilder();
            query.AppendFormat("SELECT WebUserId, WebUserName, WebPassword, Email, AccountStatus, PasswordQuestion, PasswordAnswer, WebUserRole.RoleName, DateOfBirth, StudentId ")
                .AppendFormat(" FROM WebUser, WebUserRole ")
                .AppendFormat(" WHERE StudentId='{0}' AND WebUser.RoleId = WebUserRole.RoleId AND WebUser.AccountStatus='Active'", studentRollNo);

            WebUser webUser = null;
            using (var reader = this.ExecuteReader(CommandType.Text, query.ToString()))
            {
                webUser = GetUserInfo(reader);
            }

            if (webUser != null)
                webUser.VisibleReports = GetRoleRights(webUser.Role);

            return webUser;
        }

        private WebUser GetUserInfo(IDataReader reader)
        {
            WebUser webUser = null;
            if (reader.Read())
            {
                webUser = new WebUser();

                int colIndex = -1;
                webUser.WebUserId = reader.GetInt32(++colIndex);
                webUser.UserName = reader.GetString(++colIndex);
                webUser.WebPassword = reader.GetString(++colIndex);
                webUser.Email = reader.GetString(++colIndex);
                webUser.AccountStatus = reader.GetString(++colIndex);
                webUser.SecretQuestion = reader.GetString(++colIndex);
                webUser.SecretAnswer = reader.GetString(++colIndex);
                webUser.Role = reader.GetString(++colIndex);
                webUser.DateofBirth = reader[++colIndex] as DateTime?;
                webUser.StudentId = reader[++colIndex] as string;
            }

            return webUser;
        }

        public void UpdateSecretQuestionAnswer(int studentNo, string question, string answer)
        {
            question = question.Replace("'", "''");
            answer = answer.Replace("'", "''");

            var query = new StringBuilder();
            query.AppendFormat(
                "UPDATE WebUser SET PasswordQuestion = '{0}', PasswordAnswer = '{1}' ", question, answer)
                .AppendFormat(" WHERE WebUserId = {0} AND WebUser.AccountStatus='Active'", studentNo);
            
            this.ExecuteNonQuery(CommandType.Text, query.ToString());
        }

        public void UpdateEmail(int studentNo, string email)
        {
            email = email.Replace("'", "''");

            var query = new StringBuilder();
            query.AppendFormat(
                "UPDATE WebUser SET Email = '{0}' ", email)
                .AppendFormat(" WHERE WebUserId ={0} AND WebUser.AccountStatus='Active'", studentNo);
            
            this.ExecuteNonQuery(CommandType.Text, query.ToString());
        }

        public string GetPassword(string userName)
        {
            var query = new StringBuilder();
            userName = userName.Replace("'", "''");
            query.AppendFormat("SELECT WebPassword ")
                .AppendFormat(" FROM WebUser ")
                .AppendFormat(" WHERE WebUserName='{0}' AND AccountStatus = 'Active' ", userName);

            var password = this.ExecuteScalar(CommandType.Text, query.ToString()) as string;
            return password;
        }

        public bool ConfirmSecretAnswer(string userName, string secretAnswer)
        {
            secretAnswer = secretAnswer.Replace("'", "''");

            var query = new StringBuilder();
            query.AppendFormat("SELECT count(*) ")
                .AppendFormat(" FROM WebUser ")
                .AppendFormat(" WHERE WebUserName='{0}' AND PasswordAnswer='{1}' AND AccountStatus = 'Active' ", userName, secretAnswer);

            var count = (int)this.ExecuteScalar(CommandType.Text, query.ToString());

            if (count == 0)
                return false;
            else
                return true;
        }

        public string GetSecretQuestion(string userName)
        {
            userName = userName.Replace("'", "''");
            var query = new StringBuilder();
            query.AppendFormat("SELECT PasswordQuestion ")
                .AppendFormat(" FROM WebUser ")
                .AppendFormat(" WHERE WebUserName='{0}' AND AccountStatus = 'Active' ", userName);

            var passworQuestion = this.ExecuteScalar(CommandType.Text, query.ToString()) as string;
            return passworQuestion;
        }



        public void UpdatePassword(int studentNo, string password)
        {
            password = password.Replace("'", "''");

            var query = new StringBuilder();
            query.AppendFormat(
                "UPDATE WebUser SET WebPassword = '{0}' ", password)
                .AppendFormat(" WHERE WebUserId ={0}", studentNo);

            this.ExecuteNonQuery(CommandType.Text, query.ToString());
        }
        
        public void UpdateReportsRight(string reportsName, string roleName)
        {
            // Delete all records
            var querydelete = new StringBuilder();
            querydelete.AppendFormat(
                "DELETE WebRoleReportRights WHERE RoleId = (SELECT RoleId FROM WebUserRole WHERE RoleName = '{0}');",roleName);

            this.ExecuteNonQuery(CommandType.Text, querydelete.ToString());


            var query = new StringBuilder();
            string reportName = "";

            if (!string.IsNullOrEmpty(reportsName))
            {
                while (true)
                {
                    reportName = reportsName.Substring(0, reportsName.IndexOf(','));
                    reportsName = reportsName.Substring(reportName.Length+1);

                    query.AppendFormat(" INSERT INTO WebRoleReportRights (RoleId, ReportId) "
                                       + "SELECT wur.RoleId, wr.ReportId"
                                       + " FROM WebUserRole wur, WebReport wr "
                                       + "WHERE wur.RoleName='{0}' AND wr.ReportName='{1}';",roleName,reportName);
                
                    if (reportsName == "")
                        break;
                }
                this.ExecuteNonQuery(CommandType.Text, query.ToString());
            }
            
        }
    }
}
