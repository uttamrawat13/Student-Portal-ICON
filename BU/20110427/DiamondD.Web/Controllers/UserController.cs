using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DiamondD.Data.DataAccess.User;
using DiamondD.Services.User;
using DiamondD.Web.Common.Logging;
using DiamondD.Web.Controllers.Filters;
using DiamondD.Web.Helpers;
using log4net;
using log4net.Config;
using System.Text.RegularExpressions;
using DiamondD.Services.StudentReportStatua;
using System.Text;

namespace DiamondD.Web.Controllers
{
    public class UserController : Controller
    {
        public static string SmtpUserName
        {
            get { return "smtpUserName"; }
        }
        public static string SmtpPassword
        {
            get { return "smtpPassword"; }
        }
        public static string Domain
        {
            get { return "domain"; }
        }
        public static string Port
        {
            get { return "port"; }
        }
        public static string Email
        {
            get { return "email"; }
        }
        public static string DisplayName
        {
            get { return "displayName"; }
        }
        public static string EmailSubject
        {
            get { return "emailSubject"; }
        }

        public static string UserEmailToSendPassword
        {
            get { return "DD_Email_To_SendPassword"; }
        }

        public static string SessionKey
        {
            get { return "DD_USER"; }
        }
        public static string SessionKeyRole
        {
            get { return "DD_Role";  }
        }
        public static string ReportStatus
        {
            get { return "DD_Status"; }
        }
        public static string SessionKeyStudentNo
        {
            get { return "DD_StudentNo"; }
        }

        private ILogger logger;
        //
        // GET: /Login/


        public UserController()
        {
            logger = new Logger(this.GetType());
        }
        #region Login ... 
        
        

        public ActionResult Login()
        {
            try
            {
                IWebUserService webUserService = new WebUserService();

                string LoginMsg = webUserService.GetLoginMsgText();
                ViewData["CustomMsg"] = LoginMsg;

                return View();
            }
            catch (Exception ex)
            {
                logger.Error("Exception in UserController", ex);
                
                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }

        }

        public ActionResult Result(string id)
        {
            if (id != null)
            {
                ViewData["response"] = id;
            }
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Authenticate(string userName, string password, string returnUrl)
        {
            try
            {
                IWebUserService webUserService = new WebUserService();
                WebUser webUser = webUserService.VerifyCredentials(userName, password);

                if (webUser != null)
                {
                    Session.Add(SessionKey, userName);
                    Session.Add(SessionKeyRole, webUser.Role);
                    Session.Add(SessionKeyStudentNo, webUser.WebUserId);


                    logger.Info("User '" + userName + "' has logged in.");
                    Response.Redirect(AppHelper.HomeUrl("Home"), false);
                }
                else
                {
                    logger.Info("User '" + userName + "' failed to login.");
                    ViewData["ErrorMessage"] = "Username and/or Password are invalid.";

                }
                string LoginMsg = webUserService.GetLoginMsgText();
                ViewData["CustomMsg"] = LoginMsg;
                return View("Login");
            }
            catch (Exception ex)
            {
                logger.Error("Exception in UserController", ex);

                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }
        }

        public ActionResult Logout()
        {
            try
            {

                ILogger logger = new Logger(this.GetType());

                IWebUserService webUserService = new WebUserService();
            
                string userName = Session[SessionKey] as string;

                if (userName != null)
                    webUserService.Logout(userName);

                Session.Clear();
                logger.Info("User '" + userName + "' has logged out.");




                string LoginMsg = webUserService.GetLoginMsgText();
                ViewData["CustomMsg"] = LoginMsg;

                return View("Login");
            }
            catch (Exception ex)
            {
                logger.Error("Exception in UserController", ex);

                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }

           
        }

        #endregion

        #region Verify Students ...


        public ActionResult Register()
        {
            return View();
        }
       
        public ActionResult AskSecretQuestion(string id)
        {
            string secretQuestion = "";
            IWebUserService webUserService = new WebUserService();

            if (string.IsNullOrEmpty(id))
            {
                Response.Redirect("ResetPassword");
            }

            try
            {
                secretQuestion = webUserService.GetSecretQuestion(id);
                ViewData["SecretQuestion"] = secretQuestion;
                ViewData["UserName"] = id;
            }
            catch (Exception ex)
            {                
                logger.Error("Exception occurred while getting secret question.", ex);
                Response.Redirect("Result/error");
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SecretQuestionAuthentication(string secretAnswer, string id)
        {
            IWebUserService webUserService = new WebUserService();

            try
            {
                string userName = id;

                bool isValid = webUserService.ConfirmSecretAnswer(userName, secretAnswer);

                if (isValid)
                {
                    var smtpPassword = ConfigurationManager.AppSettings[SmtpPassword];
                    var smtpUserName = ConfigurationManager.AppSettings[SmtpUserName];
                    var email = ConfigurationManager.AppSettings[Email];
                    var domain = ConfigurationManager.AppSettings[Domain];
                    var port = ConfigurationManager.AppSettings[Port];
                    var displayName = ConfigurationManager.AppSettings[DisplayName];
                    var emailSubject = ConfigurationManager.AppSettings[EmailSubject];
                    var mailFrom = email;

                    var mailTo = Session[UserEmailToSendPassword];

                    if (mailTo == null)
                    {
                        Response.Redirect("ResetPassword");
                    }
                    Session.Remove(UserEmailToSendPassword);

                    var dbPassword = webUserService.GetPassword(userName);

                    var body = new StringBuilder();
                    body.AppendFormat("Dear {0},{1}{1}Your password is:{2}{1}", userName, Environment.NewLine, dbPassword)
                        .AppendFormat("If you received this as an error or you didn't request your password, please ignore the email and delete it.{0}{0}DiamondD Services.",
                            Environment.NewLine);
                    

                    var mail = new MailMessage
                                   {
                                       From = new MailAddress(mailFrom, displayName, Encoding.UTF8),
                                       Subject = emailSubject,
                                       SubjectEncoding = Encoding.UTF8,
                                       Body = body.ToString(),
                                       BodyEncoding = Encoding.UTF8,
                                       IsBodyHtml = true,
                                       Priority = MailPriority.Normal
                                   };
                    mail.To.Add(mailTo.ToString());

                    var smtpClient = new SmtpClient
                                         {
                                             Credentials = new NetworkCredential(smtpUserName, smtpPassword),
                                             Port = int.Parse(port),
                                             Host = domain
                                         };

                    smtpClient.Send(mail);

                    ViewData["SecretAnswerSuccessMessage"] = "Password has been sent at your email address";
                }
                else
                {
                    ViewData["SecretAnswerErrorMessage"] = "Your answer doesn't match.";
                    var secretQuestion = webUserService.GetSecretQuestion(userName);
                    ViewData["SecretQuestion"] = secretQuestion;

                    Response.Redirect("../AskSecretQuestion/" + id);
                }
            }
            catch (Exception ex)
            {
                logger.Error("Exception Occurred.", ex);

                Response.Redirect("../Result/error");
            }
            return View("AskSecretQuestion");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult RegisterAuthentication(string userName, string newPassword, string studentID, 
                                                        string dateofBirth, string Email, string secretQuestion,string secretAnswer)
        {
            try
            {
                if (!CheckValidationForRegisterInfo(userName, newPassword, studentID,
                                                            dateofBirth, Email, secretQuestion, secretAnswer))
                {
                    ViewData["errorMessage"] = "Provide wrong information.";
                }

                else
                {
                    WebUser webUserInfo = new WebUser();
                    // Set Data
                    webUserInfo.AccountStatus = "InActive";
                    webUserInfo.SecretAnswer = secretAnswer;
                    webUserInfo.SecretQuestion = secretQuestion;
                    webUserInfo.Email = Email;
                    webUserInfo.WebUserId = Convert.ToInt32(studentID);
                    webUserInfo.UserName = userName;
                    webUserInfo.WebPassword = newPassword;
                    webUserInfo.DateofBirth = DateTime.Parse(dateofBirth);

                    IWebUserService webUserService = new WebUserService();
                    try
                    {
                        bool isUnique = webUserService.Register(webUserInfo);
                        if (isUnique)
                        {
                            logger.Info("New student registered successfully with student No. is " + studentID);
                            // redirect to success page
                            Response.Redirect("Result/success");
                        }
                        else
                        {
                            ViewData["UserNameDuplicated"] = "Username already exists! Please choose another.";
                            return View("Register");
                        }
                    }
                    catch (Exception ex)
                    {
                        logger.Error("New student registered failed with student No. is " + studentID, ex);
                        // Redirect to error page
                        Response.Redirect("Result/error");
                    }
                }
            }
            catch (Exception ex)
            {
                logger.Error("Exception in UserController", ex);

                // Redirect to error page
                Response.Redirect("Result/error");

            }

            return View("Register");
        }

        private bool CheckValidationForRegisterInfo(string userName, string newPassword, string studentID,
                                                        string dateofBirth, string Email, string secretQuestion, string secretAnswer)
        {

            if (userName.Trim() == "" || newPassword.Trim() == "" || studentID.Trim() == "" || dateofBirth.Trim() == "" || Email.Trim() == "" ||
                secretQuestion.Trim() == "" || secretAnswer.Trim() == "")
            {
                return false;
            }
            else if (!CheckSpecialCharacter(userName) || !CheckSpecialCharacter(newPassword) )
            {
                return false;
            }
            return true;
        }

        private bool CheckSpecialCharacter(string checkText)
        {
            Regex expresion = new Regex("[0123456789abcdefghijklmnopqrstuvwxyzABCDFGHIJKLMNOPQRSTUVWXYZ.]");
                if (!expresion.IsMatch(checkText))
                {
                    return false;

                }
            return true;
        }
        #endregion

        #region Reset Password ...

        public ActionResult ResetPassword()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ResetPasswordAuthentication(string userName, string accountEmail)
        {
            try
            {
                IWebUserService webUserService = new WebUserService();
                string dbPassword = webUserService.GetPassword(userName);

                if (string.IsNullOrEmpty(dbPassword))
                {
                    ViewData["ForgotPasswordErrorMessage"] = "No such user name exists.";
                }
                else
                {
                    Session[UserEmailToSendPassword] = accountEmail;
                    Response.Redirect("AskSecretQuestion/" + userName, false);
                }
            }
            catch (Exception ex)
            {
                logger.Error("Excpetion occurred. ", ex);

                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }
            return View("ResetPassword");
        }

        #endregion

        #region Resend Activate Account ... 
        
        
        public ActionResult ResendActivateAccount()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ResendActivateAccountAuthentication(string userName, string accountEmail)
        {
            return View("ResendActivateAccount");
        }

        #endregion

        #region User Settings ...

        private WebUser GetStudentInfo()
        {
            IWebUserService webUserService = new WebUserService();
            
            var studentNo = Session[SessionKeyStudentNo];
            if (studentNo != null)
            {
                WebUser userInfo = webUserService.GetUserInfo(int.Parse(studentNo.ToString()));
                //userInfo.RoleReportsRights = webUserService.GetRoleRights("Student");
                //userInfo.WelcomeMsg = webUserService.GetWelcomeMsgText();
                return userInfo;
            }
            return null;
        }

        private bool checkOldPasswordIsValid(string txtOldPassword)
        {
            IWebUserService webUserService = new WebUserService();

            var studentNo = Session[SessionKeyStudentNo];
            if (studentNo != null)
            {
                WebUser userInfo = webUserService.GetUserInfo(int.Parse(studentNo.ToString()));

                if (userInfo.WebPassword == txtOldPassword)
                    return true;
            }
            return false;
        }

        [RequiresAuthentication]
        public ActionResult UserSettings(string id)
        {         
            ViewData["editOption"] = id;
            
            // Record is not updated.
            ViewData["successMsg"] = "0";
           
            var userInfo = GetStudentInfo();
            
            return View(userInfo);
        }

        [RequiresAuthentication]
        public ActionResult AdminSettings(string id)
        {
            var studentNo = Session[SessionKeyStudentNo]; 

            ViewData["editOption"] = id;

            // Record is not updated.
            ViewData["successMsg"] = "0";

            IWebUserService webUserService = new WebUserService();

            // Get Admin information ... 
            WebUser userInfo = webUserService.GetUserInfo(int.Parse(studentNo.ToString()));
            userInfo.WelcomeMsg = webUserService.GetWelcomeMsgText();
            userInfo.RoleReportsRights = webUserService.GetRoleRights("Student");
            userInfo.LoginMsg = webUserService.GetLoginMsgText();

            return View(userInfo);
        }


        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        public ActionResult ChangePassword(string txtOldPassword, string txtNewPassword)
        {
            try
            {
             
                if (checkOldPasswordIsValid(txtOldPassword))
                {
                    IWebUserService webUserService = new WebUserService();

                    var studentNo = Session[SessionKeyStudentNo];

                    webUserService.UpdatePassword(int.Parse(studentNo.ToString()), txtNewPassword);

                    // Get Student information ... 
                    var userInfo = GetStudentInfo();
                    ViewData["editOption"] = "cp";
                    // Record is updated.
                    ViewData["successMsg"] = "1";

                    logger.Info("Password changed successfully of Student No." + Session[SessionKeyStudentNo]);
                    return View("UserSettings", userInfo);
                }
                else
                {
                    // Get Student information ... 
                    var userInfo = GetStudentInfo();
                    ViewData["editOption"] = "cp";
                    // Old password not match
                    ViewData["oldPassword"] = "0";
                    logger.Info("Old password not match of student No. " + Session[SessionKeyStudentNo]);
                    return View("UserSettings", userInfo);
                }

            }
            catch (Exception ex)
            {
                logger.Error("Password changed failed of Student No." + Session[SessionKeyStudentNo], ex);

                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }
            
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        public ActionResult ChangeSecretQuestion(string txtSecretQuestion, string txtSecretAnswer)
        {
            try
            {
                IWebUserService webUserService = new WebUserService();

                var studentNo = Session[SessionKeyStudentNo];

                webUserService.UpdateSecretQuestionAnswer(int.Parse(studentNo.ToString()), txtSecretQuestion, txtSecretAnswer);

                // Get Student information ... 
                var userInfo = GetStudentInfo();
                ViewData["editOption"] = "csq";
                // Record is updated.
                ViewData["successMsg"] = "1";

                logger.Info("Secret question changed successfully of Student No." + Session[SessionKeyStudentNo]);

                return View("UserSettings", userInfo);
            }
            catch (Exception ex)
            {
                logger.Error("Secret question changed failded of Student No." + Session[SessionKeyStudentNo], ex);

                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }
        }
        
        
        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        public ActionResult ChangeEmail(string txtChangeEmail )
        {
            try
            {
                IWebUserService webUserService = new WebUserService();

                var studentNo = Session[SessionKeyStudentNo];

                webUserService.UpdateEmail(int.Parse(studentNo.ToString()), txtChangeEmail);

                // Get Student information ... 
                var userInfo = GetStudentInfo();
                ViewData["editOption"] = "cm";
                // Record is updated.
                ViewData["successMsg"] = "1";

                logger.Info("Email changed successfully of Student No." + Session[SessionKeyStudentNo]);
                return View("UserSettings", userInfo);
            }
            catch (Exception ex)
            {
                logger.Info("Email changed failded of Student No." + Session[SessionKeyStudentNo]);
                logger.Error(ex.Message);
                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        public ActionResult ChangeWelcomeMsg(string txtChangeWelcomeMsg)
        {
            try
            {
                IWebUserService webUserService = new WebUserService();

                var studentNo = Session[SessionKeyStudentNo];

                webUserService.UpdateWelcomeMsg(txtChangeWelcomeMsg);

                // Get Admin information ... 
                WebUser userInfo = webUserService.GetUserInfo(int.Parse(studentNo.ToString()));
                userInfo.WelcomeMsg = webUserService.GetWelcomeMsgText();
                userInfo.RoleReportsRights = webUserService.GetRoleRights("Student");
                userInfo.LoginMsg = webUserService.GetLoginMsgText();

                ViewData["editOption"] = "NN";
                // Record is updated.
                ViewData["successMsg"] = "1";

                logger.Info("Welcome message changed successfully of Student No." + Session[SessionKeyStudentNo]);
                return View("AdminSettings", userInfo);
            }
            catch (Exception ex)
            {
                logger.Error("Welcome message not changed of Student No." + Session[SessionKeyStudentNo], ex);

                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        public ActionResult ChangeLoginMsg(string txtChangeLoginMsg)
        {
            try
            {
                IWebUserService webUserService = new WebUserService();

                var studentNo = Session[SessionKeyStudentNo];

                webUserService.UpdateLoginMsg(txtChangeLoginMsg);

                // Get Admin information ... 
                WebUser userInfo = webUserService.GetUserInfo(int.Parse(studentNo.ToString()));
                userInfo.WelcomeMsg = webUserService.GetWelcomeMsgText();
                userInfo.RoleReportsRights = webUserService.GetRoleRights("Student");
                userInfo.LoginMsg = webUserService.GetLoginMsgText();

                ViewData["editOption"] = "NN";
                // Record is updated.
                ViewData["successMsg"] = "1";

                logger.Info("Welcome message changed successfully of Student No." + Session[SessionKeyStudentNo]);
                return View("AdminSettings", userInfo);
            }
            catch (Exception ex)
            {
                logger.Error("Welcome message not changed of Student No." + Session[SessionKeyStudentNo], ex);

                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        public ActionResult ModifyReportRights(string enableReports)
        {
            try 
            {
                var studentNo = Session[SessionKeyStudentNo];

                IWebUserService webUserService = new WebUserService();
                webUserService.UpdateReportsRight(enableReports, "Student");

                // Get Admin information ... 
                WebUser userInfo = webUserService.GetUserInfo(int.Parse(studentNo.ToString()));
                userInfo.WelcomeMsg = webUserService.GetWelcomeMsgText();
                userInfo.RoleReportsRights = webUserService.GetRoleRights("Student");
                userInfo.LoginMsg = webUserService.GetLoginMsgText();

                ViewData["editOption"] = "NN";
                // Record is updated.
                ViewData["successMsg"] = "1";

                logger.Info("Report rights modification done successfully of Student No." + Session[SessionKeyStudentNo]);
                return View("AdminSettings", userInfo);
            }
            catch (Exception ex)
            {
                logger.Error("Report rights modification failded of Student No." + Session[SessionKeyStudentNo], ex);
                
                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }
        }





        #endregion
    }
}
