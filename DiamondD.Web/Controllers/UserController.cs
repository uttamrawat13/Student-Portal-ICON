using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.Mvc;
using DiamondD.Data.DataAccess.User;
using DiamondD.Services.User;

using DiamondD.Web.Controllers.Filters;
using DiamondD.Web.Controls;
using DiamondD.Web.Helpers;
using DiamondD.Web.Common.Logging;
using System.Text.RegularExpressions;
using System.Text;
using DiamondD.Services.Settings;

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
        public static string EmailSubjectForUsernameRequeset
        {
            get { return "emailSubjectForUsernameRequest"; }
        }
        public static string SessionKey
        {
            get { return "DD_USER"; }
        }
        public static string SessionKeyRole
        {
            get { return "DD_Role"; }
        }
        public static string SessionKeyRights
        {
            get { return "DD_Rights"; }
        }
        public static string ReportStatus
        {
            get { return "DD_Status"; }
        }
        public static string SessionKeyStudentNo
        {
            get { return "DD_StudentNo"; }
        }
        public static string SessionKeyEmail
        {
            get { return "email"; }
        }
        public static string SessionKeyEmailSent
        {
            get { return "emailSent"; }
        }

        
        public static string SessionKeyCourseOfferingTermId
        {
            get { return "DD_TermId"; }
        }

        private readonly ILogger logger;
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
                ISettingsService settingsService = new SettingsService();

                string loginMessage = settingsService.GetLoginMsgText();
                ViewData["CustomMsg"] = loginMessage;

                logger.Debug("Got Login Message: " + loginMessage);

                return View();
            }
            catch (Exception ex)
            {
                logger.Error("Unable to get Login Message.", ex);

                Response.Redirect(AppHelper.SharedUrl("Result/Error"));
                return null;
            }

        }

        [RequiresAuthentication]
        public ActionResult Home()
        {
            try
            {
                ISettingsService settingsService = new SettingsService();

                var studentNo = Session[UserController.SessionKeyStudentNo];
                if (studentNo != null)
                {
                    string welcomeMsg = settingsService.GetWelcomeMsgText();
                    ViewData["WelcomeMsg"] = welcomeMsg;
                }

                return View();
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
        }



        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Login(FormCollection collection)
        {
            try
            {
                string userName = collection["userName"];
                string password = collection["password"];
                IWebUserService webUserService = new WebUserService();
                WebUser webUser = webUserService.VerifyCredentials(userName, password);
              

                if (webUser != null)
                {
                    
                    Session.Add(SessionKey, userName);
                    Session.Add(SessionKeyRole, webUser.Role);
                    Session.Add(SessionKeyRights, webUser.VisibleReports);
                    Session.Add(SessionKeyStudentNo, webUser.WebUserId);
                    Session.Add(SessionKeyEmail, webUser.Email);
                    Session.Add(SessionKeyEmailSent, webUser.EmailSent);
                    Session["uname"] = userName;

                    logger.Info("User '" + userName + "' has logged in.");
                    Response.Redirect(AppHelper.UsersUrl("Home"), false);
                }
                else
                {
                    var sb = new StringBuilder();
                    sb.AppendFormat("No such user with credentials : userName:{0}, password:{1}", userName, password);
                    logger.Info(sb.ToString());

                    ViewData["ErrorMessage"] = "Username and/or Password are invalid.";

                    ISettingsService settingsService = new SettingsService();

               
                    string loginMessage = settingsService.GetLoginMsgText();
                    ViewData["CustomMsg"] = loginMessage;

                    logger.Debug("Got Login Message: " + loginMessage + " (Invalid password case).");


                }
                return View("Login");
            }
            catch (Exception ex)
            {
                logger.Error("Exception in UserController", ex);

                // Redirect to error page                
                Response.Redirect(AppHelper.SharedUrl("Result/Error"));
                return null;
            }
        }

        [RequiresAuthentication]
        public ActionResult Logout()
        {
            try
            {
                IWebUserService userService = new WebUserService();

                string userName = Session[SessionKey] as string;

                if (userName != null)
                    userService.Logout(userName);

                Session.Clear();
                logger.Info("User '" + userName + "' has logged out.");

                ISettingsService settingsService = new SettingsService();
                string loginMessage = settingsService.GetLoginMsgText();

                if (loginMessage == null)
                    logger.Warn("loginMessage is null (logout case).");

                ViewData["CustomMsg"] = loginMessage;

                return View("Login");
            }
            catch (Exception ex)
            {
                logger.Error("Exception occurred while logging out.", ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Result/Error"));
                return null;
            }


        }

        #endregion


        #region "Payment Receipt: Microware"
        public ActionResult PaymentReceipt()
        {
            try
            {
             

                return View();
            }
            catch (Exception ex)
            {
              

                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));

                return null;
            }

        }        
        public ActionResult PaymentProcess()
        {
            try
                {

                   
                }
                catch (Exception ex)
                {
                    //logger.Error("Exception in UserController while registering a student", ex);
                     // Redirect to error page
                    Response.Redirect(AppHelper.SharedUrl("Result/Error"));

                }

                return View();
            
           

        }
        public ActionResult PaymentExecution()
        {
           
                try
                {


                }
                catch (Exception ex)
                {
                    //logger.Error("Exception in UserController while registering a student", ex);

                    // Redirect to error page
                    Response.Redirect(AppHelper.SharedUrl("Result/Error"));

                }

                return View();
           

        }

        
        #endregion 







        #region Register & Reset Password


        public ActionResult Register()
        {
            return View();
        }

        public ActionResult AskSecretQuestion()
        {

            try
            {
                IWebUserService webUserService = new WebUserService();

                string username = Request.Params["username"];
                string email = Request.Params["email"];


                logger.Info("(AskSecretQuestion case) username:" + username + ", email:" + email);

                if (string.IsNullOrEmpty(username))
                {
                    logger.Warn("username was null or empty userName: " + username);

                    Response.Redirect("ResetPassword");
                }

                string secretQuestion = webUserService.GetSecretQuestion(username);

                if (secretQuestion == null)
                    logger.Warn("secretQuestion was null for userName: " + username);

                // Since we need this information to display on ui again.
                TempData["username"] = username;
                TempData["email"] = email;
                TempData["secretQuestion"] = secretQuestion;
                ViewData["secretQuestion"] = secretQuestion;
            }
            catch (Exception ex)
            {
                logger.Error("Exception occurred while getting secret question.", ex);
                Response.Redirect(AppHelper.SharedUrl("Result/Error"));
            }
            return View();
        }

        [HttpPost]
        public ActionResult AskSecretQuestion(FormCollection collection)
        {
            try
            {
                IWebUserService webUserService = new WebUserService();

                string userName = TempData["username"] as string;
                string to = TempData["email"] as string;
                string secretQuestion = TempData["secretQuestion"] as string;
                string userAnswer = collection["secretAnswer"] as string;

                if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(to) || string.IsNullOrEmpty(secretQuestion))
                {
                    return Redirect("ResetPassword");
                }//View("ResetPassword");

                bool isValid = webUserService.ConfirmSecretAnswer(userName, userAnswer);

                if (isValid)
                {
                    var dbPassword = webUserService.GetPassword(userName);

                    var emailBody = new StringBuilder();
                    emailBody.AppendFormat("Dear {0},{1}{1}Your password is:{2}{1}", userName, Environment.NewLine, dbPassword)
                        .AppendFormat("If you received this as an error or you didn't request your password, please ignore the email and delete it.{0}{0}DiamondD Services.",
                                      Environment.NewLine);

                    string emailFrom = ConfigurationManager.AppSettings[Email];
                    string subject = ConfigurationManager.AppSettings[EmailSubject];
                    var displayName = ConfigurationManager.AppSettings[DisplayName];

                    SendEmail(displayName, emailFrom, to, subject, emailBody.ToString());

                    var sb = new StringBuilder();
                    sb.AppendFormat("Email sent to {0}, with display Name: {1} from email {2} with subject {3}, having body {4}.", to,
                                    displayName, emailFrom, subject, emailBody);
                    logger.Info(sb.ToString());

                    ViewData["SecretAnswerSuccessMessage"] = "Password has been sent at your email address";
                }
                else
                {
                    TempData["username"] = userName;
                    TempData["email"] = to;
                    TempData["SecretQuestion"] = secretQuestion;
                    ViewData["SecretQuestion"] = secretQuestion;
                    TempData["SecretAnswerErrorMessage"] = "Your answer doesn't match.";

                    var sb = new StringBuilder();
                    sb.AppendFormat("Answer doesn't match for userName{0}. Entered answer: {1}", userName, userAnswer);
                    logger.Info(sb.ToString());
                }
            }
            catch (Exception ex)
            {
                logger.Error("Exception Occurred while confirming secret answer.", ex);
                Response.Redirect(AppHelper.SharedUrl("Result/Error"));
            }
            return View();
        }

        private void SendEmail(string displayName, string emailFrom, string emailTo, string subject, string body)
        {
            var smtpPassword = ConfigurationManager.AppSettings[SmtpPassword];
            var smtpUserName = ConfigurationManager.AppSettings[SmtpUserName];
            var domain = ConfigurationManager.AppSettings[Domain];
            var port = ConfigurationManager.AppSettings[Port];

            var mail = new MailMessage
                           {
                               From = new MailAddress(emailFrom, displayName, Encoding.UTF8),
                               Subject = subject,
                               SubjectEncoding = Encoding.UTF8,
                               Body = body,
                               BodyEncoding = Encoding.UTF8,
                               IsBodyHtml = true,
                               Priority = MailPriority.Normal
                           };
            mail.To.Add(emailTo);

            System.Net.Mime.ContentType mimeType = new System.Net.Mime.ContentType("text/html");
            AlternateView alternate = AlternateView.CreateAlternateViewFromString(body, mimeType);

            mail.AlternateViews.Add(alternate);

            var smtpClient = new SmtpClient
                                 {
                                     Credentials = new NetworkCredential(smtpUserName, smtpPassword),
                                     Port = int.Parse(port),
                                     Host = domain
                                 };
            smtpClient.EnableSsl = true;
            smtpClient.Send(mail);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Register(FormCollection collection)
        {
            try
            {
                string userName = collection["userName"];
                string newPassword = collection["newPassword"];
                string studentId = collection["studentID"];
                string dateofBirth = collection["dateofBirth"];
                string email = collection["Email"];
                string secretQuestion = collection["secretQuestion"];
                string secretAnswer = collection["secretAnswer"];
                if (!CheckValidationForRegisterInfo(userName, newPassword, studentId,
                                                            dateofBirth, email, secretQuestion, secretAnswer))
                {
                    ViewData["errorMessage"] = "Please provide valid data.";
                }

                else
                {
                    var webUserInfo = new WebUser();
                    webUserInfo.SecretAnswer = secretAnswer;
                    webUserInfo.SecretQuestion = secretQuestion;
                    webUserInfo.Email = email;
                    webUserInfo.UserName = userName;
                    webUserInfo.WebPassword = newPassword;
                    webUserInfo.DateofBirth = DateTime.Parse(dateofBirth);
                    webUserInfo.StudentId = studentId;

                    IWebUserService webUserService = new WebUserService();
                    try
                    {
                        bool isUnique = webUserService.Register(webUserInfo);
                        if (isUnique)
                        {
                            logger.Info("New student registered successfully. UserInfo: " + webUserInfo);
                            Response.Redirect(AppHelper.UsersUrl("Login"));
                        }
                        else
                        {
                            logger.Info("A username already exists.");

                            ViewData["UserNameDuplicated"] = "Username already exists! Please choose another.";
                            return View("Register");
                        }
                    }
                    catch (Exception ex)
                    {
                        logger.Error("New student registered failed with Student:" + webUserInfo, ex);

                        // Redirect to error page
                        Response.Redirect(AppHelper.SharedUrl("Result/Error"));
                    }
                }
            }
            catch (Exception ex)
            {
                logger.Error("Exception in UserController while registering a student", ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Result/Error"));

            }

            return View("Register");
        }

        [AcceptVerbs(HttpVerbs.Post)]
       
        private bool CheckValidationForRegisterInfo(string userName, string newPassword, string studentId,
                                                        string dateofBirth, string email, string secretQuestion, string secretAnswer)
        {

            if (userName.Trim() == "" || newPassword.Trim() == "" || studentId.Trim() == "" || dateofBirth.Trim() == "" || email.Trim() == "" ||
                secretQuestion.Trim() == "" || secretAnswer.Trim() == "")
            {
                return false;
            }
            else if (!CheckSpecialCharacter(userName) || !CheckSpecialCharacter(newPassword))
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
        public ActionResult ResetPassword(FormCollection collection)
        {
            try
            {
                var userName = collection["userName"];
                var accountEmail = collection["accountEmail"];

                IWebUserService webUserService = new WebUserService();
                string dbPassword = webUserService.GetPassword(userName);

                if (string.IsNullOrEmpty(dbPassword))
                {
                    logger.Info("No such user name exsits. UserName: " + userName + ", Password: " + dbPassword);
                    TempData["ForgotPasswordErrorMessage"] = "No such user name exists.";
                }
                else
                {
                    //Session[UserEmailToSendPassword] = accountEmail;
                    TempData["username"] = userName;
                    TempData["email"] = accountEmail;

                    Response.Redirect("AskSecretQuestion?username=" + userName + "&email=" + accountEmail);
                }
            }
            catch (Exception ex)
            {
                var userName = collection["userName"];
                var accountEmail = collection["accountEmail"];

                var sb = new StringBuilder();
                sb.AppendFormat("Excpetion occurred in UserControlle wile resting password for user {0}, email:{1}",
                    userName, accountEmail);

                logger.Error(sb.ToString(), ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Result/Error"));
                return null;
            }
            return View();
        }

        #endregion

        #region Forget UserName
        public ActionResult ForgotUserName()
        {
            ViewData["step"] = 1;
            ViewData["EmailORID"] = 0;
            try
            {
                Data.DataAccess.Settings.ForgetUsernameSetting ForgotUserNameSettingEnum = new SettingsService().GetForgetUsernameSetting();
                ViewData["EmailORID"] = Convert.ToInt16(ForgotUserNameSettingEnum);
            }
            catch (Exception error)
            {
                ViewData["EmailORID"] = 1;
            }
            return View();
        }
        public WebUser getWebUser(Int16 EmailORID, string Email, string RollNumber, IWebUserService webUserService)
        {   
            WebUser webUser = null;
            //For Email
            if (EmailORID == 1)
            {
                if (!string.IsNullOrEmpty(Email))
                {
                    webUser = webUserService.GetUserInfoByEmail(Email);
                }
            }
            else if (EmailORID == 2)//For ID
            {
                if (!string.IsNullOrEmpty(RollNumber))
                {
                    webUser = webUserService.GetUserInfo(RollNumber);
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(Email))
                {
                    webUser = webUserService.GetUserInfoByEmail(Email);
                }
                else if (!string.IsNullOrEmpty(RollNumber))
                {
                    webUser = webUserService.GetUserInfo(RollNumber);
                }
                else
                {
                    webUser = null;
                }
            }
            return webUser;
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ForgotUserName(FormCollection formCollection, int step, Int16? EmailORID)
        {
            /*If EmailORID=1 It means Email will be asked by client for User Name.
             *If EmailORID=2 It means ID will be asked by client for User Name.
             *If EmailORID=3 It means option will be given to client to choose from both Email and ID 
             */
            EmailORID = Convert.ToInt16(formCollection["EmailORID"]);
            string RollNumber = formCollection["RollNumber"].Trim(new char[] { ',' });
            string Email = formCollection["Email"].Trim(new char[] { ',' });

            IWebUserService webUserService = new WebUserService();
            
            switch (step)
            {
                case 1:
                    WebUser webUser = getWebUser((Int16)EmailORID, Email, RollNumber, webUserService);
                    if (webUser != null)
                    {
                        //set session for webuser
                        ViewData["RollNumber"] = webUser.StudentId;
                        ViewData["Email"] = webUser.Email;
                        ViewData["Security_Question"] = webUser.SecretQuestion;
                        //Session.Add("ForgotPasswordWebUser", webUser);
                        //increment step 
                        ++step;
                    }
                    else
                    {
                        ViewData["errormessage"] = "Please Fill Fields with Correct Data.";

                    }
                    break;
                case 2:
                    string rollNumber = formCollection["rollNumber"] as string;
                    //string securityQuestion = formCollection["Security_Question"] as string;
                    string securityAnswer = formCollection["Security_Answer"] as string;

                    // Check Session for rollNumber
                    if (!string.IsNullOrEmpty(rollNumber))
                    {
                        if (!string.IsNullOrEmpty(securityAnswer))
                        {
                            webUser = getWebUser((Int16)EmailORID, Email, RollNumber, webUserService);
                            if (webUser.SecretAnswer == securityAnswer)
                            {
                                string emailFrom = ConfigurationManager.AppSettings[UserController.Email];
                                string subject = ConfigurationManager.AppSettings[EmailSubjectForUsernameRequeset];
                                var displayName = ConfigurationManager.AppSettings[DisplayName];

                                StringBuilder emailBody = new StringBuilder();
                                emailBody.AppendFormat("Dear User,<br/><br/>");
                                emailBody.AppendFormat("We recieved your request for username (given below):<br/><br/>");
                                emailBody.AppendFormat("Username:<br/>", webUser.UserName);
                                emailBody.AppendFormat("{0}<br/><br/>", webUser.UserName);
                                emailBody.AppendFormat("------------------<br/>");
                                emailBody.AppendFormat("This is auto generated Email by Diamond D software. Please Do Not Reply!<br/>");

                                SendEmail(displayName, emailFrom, webUser.Email, subject, emailBody.ToString());
                                ++step;
                            }
                            else
                            {
                                ViewData["errormessage"] = "Please Fill Fields with Correct Data";
                            }
                        }
                        else
                        {
                            ViewData["errormessage"] = "Please Fill Fields with Correct Data";
                        }
                    }
                    else
                    {
                        Response.Redirect("~/Shared/Error");
                    }
                    break;

                //if security question and answer matches 
                //get and mail User Id to user.
                //increment step 
                //else set error message.
                //else return to login Name.
                default:
                    break;
            }
            ViewData["step"] = step;
            ViewData["EmailORID"] = EmailORID;
            return View();
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
                return userInfo;
            }
            return null;
        }

        private WebUser GetWebInformation()
        {
            var studentNo = Session[SessionKeyStudentNo];

            IWebUserService webUserService = new WebUserService();
            WebUser userInfo = webUserService.GetUserInfo(int.Parse(studentNo.ToString()));
            if (userInfo != null)
            {
                ISettingsService settingsService = new SettingsService();
                userInfo.WelcomeMsg = settingsService.GetWelcomeMsgText();
                userInfo.RoleReportsRights = webUserService.GetRoleRights("Student");
                userInfo.LoginMsg = settingsService.GetLoginMsgText();
                userInfo.TitleMsg = settingsService.GetTitleMsg();
                userInfo.LogoFileName = settingsService.GetLogoFileName();
                userInfo.EmailOrStudentId = (Int16)settingsService.GetForgetUsernameSetting();
                // Set Logo file Path
                //var path = ConfigurationManager.AppSettings["logoPath"];

                //path = Path.Combine(path, userInfo.LogoFileName);

                //ViewData["LogoFilePath"] = HeaderControl.imagesPath;
            }
            else
                logger.Warn("User Info is null. ID is: " + studentNo);
            return userInfo;
        }


        private bool CheckOldPasswordIsValid(string txtOldPassword)
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

            if (userInfo == null)
            {
                userInfo = new WebUser();
                logger.Warn("User Info is null in UserSettings");
            }
            return View(userInfo);
        }

        [RequiresAuthentication]
        [RequiresRole]
        public ActionResult AdminSettings(string id)
        {
            var userInfo = new WebUser();
            try
            {
                //var studentNo = Session[SessionKeyStudentNo];

                ViewData["editOption"] = id;

                // Record is not updated.
                ViewData["successMsg"] = "0";


                // Get Admin information ... 
                userInfo = GetWebInformation();


            }
            catch (Exception ex)
            {
                logger.Error("Exception occurred in Admin Settings (id)" + id, ex);
            }

            return View(userInfo);
        }

        [RequiresAuthentication]
        [RequiresRole]
        public ActionResult Rights()
        {


            // Record is not updated.
            ViewData["successMsg"] = "0";

            // Get Admin information ... 
            WebUser userInfo = GetWebInformation();

            return View(userInfo);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        public ActionResult ChangePassword(FormCollection collection)
        {
            string txtOldPassword = collection["txtOldPassword"];
            string txtNewPassword = collection["txtNewPassword"];
            try
            {
                if (CheckOldPasswordIsValid(txtOldPassword))
                {
                    IWebUserService webUserService = new WebUserService();

                    var studentNo = Session[SessionKeyStudentNo];

                    webUserService.UpdatePassword(int.Parse(studentNo.ToString()), txtNewPassword);

                    // Get Student information ... 
                    var userInfo = GetStudentInfo();
                    ViewData["editOption"] = "cp";
                    // Record is updated.
                    ViewData["successMsg"] = "1";

                    logger.Debug("Password was successfully changed for Student No." + Session[SessionKeyStudentNo]);
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
                logger.Error("Password change request failed for Student No." + Session[SessionKeyStudentNo], ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }

        }

        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        public ActionResult ChangeSecretQuestion(FormCollection collection)
        {
            string txtSecretQuestion = collection["txtSecretQuestion"];
            string txtSecretAnswer = collection["txtSecretAnswer"];
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

                logger.Debug("Secret question changed successfully for Student No." + Session[SessionKeyStudentNo]);

                return View("UserSettings", userInfo);
            }
            catch (Exception ex)
            {
                var sb = new StringBuilder();
                sb.AppendFormat("Secret question change request failded for Student No:{0}. " + Session[SessionKeyStudentNo]);
                sb.AppendFormat("SecretQuestion: {0}, SecretAnswer: {1}", txtSecretQuestion, txtSecretAnswer);
                logger.Error(sb.ToString(), ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
        }


        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        public ActionResult ChangeEmail(FormCollection collection)
        {
            string txtChangeEmail = collection["txtChangeEmail"];
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

                logger.Debug("Email changed successfully for Student No." + Session[SessionKeyStudentNo]);
                return View("UserSettings", userInfo);
            }
            catch (Exception ex)
            {
                logger.Error("Email changed failded of Student No." + Session[SessionKeyStudentNo] + " New Email: " + txtChangeEmail, ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        [RequiresRole]
        public ActionResult ChangeWelcomeMsg(FormCollection collection)
        {
            string txtChangeWelcomeMsg = collection["txtChangeWelcomeMsg"];
            try
            {
                ISettingsService settingsService = new SettingsService();

                var studentNo = Session[SessionKeyStudentNo];

                settingsService.UpdateWelcomeMsg(txtChangeWelcomeMsg);

                // Get Admin information ... 
                WebUser userInfo = GetWebInformation();

                ViewData["editOption"] = "NN";
                // Record is updated.
                ViewData["successMsg"] = "1";

                logger.Debug("Welcome message changed successfully. New welcomeMessage:" + txtChangeWelcomeMsg);
                return View("AdminSettings", userInfo);
            }
            catch (Exception ex)
            {
                logger.Error("Welcome message request failed. New welcomeMessage: " + txtChangeWelcomeMsg, ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        [RequiresRole]
        public ActionResult ChangeLoginMsg(FormCollection collection)
        {
            string txtChangeLoginMsg = collection["txtChangeLoginMsg"];
            try
            {
                ISettingsService settingsService = new SettingsService();

                var studentNo = Session[SessionKeyStudentNo];

                settingsService.UpdateLoginMsg(txtChangeLoginMsg);

                // Get Admin information ... 
                WebUser userInfo = GetWebInformation();

                ViewData["editOption"] = "NN";
                // Record is updated.
                ViewData["successMsg"] = "1";

                logger.Debug("Login message changed successfully. New welcomeMessage:" + txtChangeLoginMsg);
                return View("AdminSettings", userInfo);
            }
            catch (Exception ex)
            {
                logger.Error("Change Login message request failed. NewLoginMessage: " + txtChangeLoginMsg, ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        [RequiresRole]
        public ActionResult SetEmailOrStudentID(FormCollection collection)
        {
            Int16 txtEmailOrStudentIdMsg = Convert.ToInt16(collection["radEmailOrStudentId"]);
            try
            {
                ISettingsService settingsService = new SettingsService();

                //var studentNo = Session[SessionKeyStudentNo];

                settingsService.UpdateForgetUsernameSetting((Data.DataAccess.Settings.ForgetUsernameSetting)txtEmailOrStudentIdMsg);

                // Get Admin information ... 
                WebUser userInfo = GetWebInformation();

                ViewData["editOption"] = "NN";
                // Record is updated.
                ViewData["successMsg"] = "1";

                logger.Debug("Forgot User Name Setting changed successfully. New Setting is:" + txtEmailOrStudentIdMsg);
                return View("AdminSettings", userInfo);
            }
            catch (Exception ex)
            {
                logger.Error("Change Login message request failed. NewLoginMessage: " + txtEmailOrStudentIdMsg, ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        [RequiresRole]
        public ActionResult ModifyReportRights(FormCollection collection)
        {
            string enableReports = collection["enableReports"];
            try
            {

                var studentNo = Session[SessionKeyStudentNo];

                IWebUserService webUserService = new WebUserService();
                webUserService.UpdateReportsRight(enableReports, "Student");

                // Get Admin information ... 
                WebUser userInfo = GetWebInformation();

                // Record is updated.
                ViewData["successMsg"] = "1";

                logger.Debug("Report rights modification done successfully for Student role. enableReports:" + enableReports);
                return View("Rights", userInfo);
            }
            catch (Exception ex)
            {
                logger.Error("Report rights modification failded for Student Role. enableReports:" + enableReports, ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [RequiresAuthentication]
        [RequiresRole]
        public ActionResult ChangeTitleMsg(FormCollection collection)
        {
            string titleMsg = "";
            try
            {
                titleMsg = collection["txtChangeTitleMsg"] as string;

                ISettingsService settingsService = new SettingsService();

                settingsService.UpdateTitleMsg(titleMsg);

                // Get Admin information ... 
                WebUser userInfo = GetWebInformation();

                ViewData["editOption"] = "NN";
                // Record is updated.
                ViewData["successMsg"] = "1";

                logger.Debug("Title message changed successfully. New TitleMessage:" + titleMsg);
                return View("AdminSettings", userInfo);

            }
            catch (Exception ex)
            {
                logger.Error("Change Title message request failed. NewTitleMessage: " + titleMsg, ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
        }

        [HttpPost]
        [RequiresAuthentication]
        [RequiresRole]
        public ActionResult ChangeLogo(HttpPostedFileBase uploadLogo)
        {
            try
            {

                if (uploadLogo.ContentLength > 0)
                {
                    string maxLogoImageSize = ConfigurationManager.AppSettings["LogoImageSize"];
                    int allowedSize = int.Parse(maxLogoImageSize);
                    if (uploadLogo.ContentLength > allowedSize)
                    {
                        ViewData["editOption"] = "ul";
                        ViewData["ImageType"] = "0";
                        ViewData["ErrorMessage"] = "Image size cannot be greater than " + allowedSize / 1024 + " KB.";
                        logger.Warn("Logo image size is not valid. Selected Logo Size:" + maxLogoImageSize);

                        // Get Admin information ... 
                        WebUser userInfo = GetWebInformation();

                        return View("AdminSettings", userInfo);
                    }

                    // Upload File on Server
                    var fileName = Path.GetFileName(uploadLogo.FileName);

                    fileName = DateTime.Now.Day.ToString("00")
                               + DateTime.Now.Month.ToString("00")
                               + DateTime.Now.Year.ToString("00") + "-"
                               + DateTime.Now.Hour.ToString("00")
                               + DateTime.Now.Minute.ToString("00")
                               + DateTime.Now.Second.ToString("00") + "-" + fileName;

                    var path = ConfigurationManager.AppSettings["uploadLogoPath"];

                    Bitmap bmp = new Bitmap(uploadLogo.InputStream);

                    // Check Image Format 
                    if (bmp.RawFormat.Equals(ImageFormat.Gif) || bmp.RawFormat.Equals(ImageFormat.Jpeg) || bmp.RawFormat.Equals(ImageFormat.Png))
                    {


                        path = Path.Combine(HttpContext.Server.MapPath(Url.Content("~" + path)),
                                                       fileName);
                        bmp.SetResolution(60, 60);

                        Image logoImage = (Image)bmp;

                        MemoryStream ms = new MemoryStream();
                        logoImage.Save(ms, logoImage.RawFormat);

                        System.IO.File.WriteAllBytes(path, ms.ToArray());

                        // Update in DB
                        ISettingsService settingsService = new SettingsService();

                        settingsService.UpdateLogoFileName(fileName);

                        // Get Admin information ... 
                        WebUser userInfo = GetWebInformation();

                        ViewData["editOption"] = "ul";
                        // Record is updated.
                        ViewData["successMsg"] = "1";

                        logger.Debug("Logo changed successfully. New LogoName:" + fileName);
                        return View("AdminSettings", userInfo);
                    }
                    else
                    {
                        ViewData["editOption"] = "ul";
                        ViewData["ImageType"] = "0";
                        ViewData["ErrorMessage"] = "(You can select .jpeg, .gif and .png only)";
                        logger.Warn("Logo image type not valid. Selected LogoName was:" + fileName);

                        // Get Admin information ... 
                        WebUser userInfo = GetWebInformation();

                        return View("AdminSettings", userInfo);

                    }
                }

            }
            catch (Exception ex)
            {
                logger.Error("Logo changed failed. ", ex);

                // Redirect to error page
                Response.Redirect(AppHelper.SharedUrl("Reply/Error"));
                return null;
            }
            return View();
        }

        #endregion
    }
}
