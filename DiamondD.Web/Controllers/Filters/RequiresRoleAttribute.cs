using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Diagnostics;
using DiamondD.Data.DataAccess.User;
using DiamondD.Web.Common.Logging;
using DiamondD.Web.Helpers;

namespace DiamondD.Web.Controllers.Filters
{
    public class RequiresRoleAttribute : ActionFilterAttribute,
                    IActionFilter
    {
        void IActionFilter.OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);

            Debug.Assert(filterContext != null);
            var httpContext = filterContext.HttpContext;

            Debug.Assert(httpContext != null);
            Debug.Assert(httpContext.Session != null);

            var userRights = httpContext.Session[UserController.SessionKeyRights] as IList<string>;
            var userName = httpContext.Session[UserController.SessionKey];
            var roleName = httpContext.Session[UserController.SessionKeyRole];

            bool isAccessAllowed = false;

            //if (null!=roleName && roleName.Equals(WebUserRole.Admin.ToString()))
            //{
                #region Admin Code
                if (userRights != null)
                {
                    string currentRequest = httpContext.Request.Path;

                    foreach (var reportName in userRights)
                    {
                        if (currentRequest.Contains(reportName))
                        {
                            isAccessAllowed = true;
                            break;
                        }
                    }

                    string[] adminMenus = {
                                          "AdminSettings", "Rights", "ChangeLogo", "ChangeTitleMsg", "ChangeWelcomeMsg",
                                          "ChangeLoginMsg","SetEmailOrStudentID"
                                      };

                    foreach (var adminMenu in adminMenus)
                    {
                        if (currentRequest.Contains(adminMenu) &&
                            roleName.Equals(WebUserRole.Admin.ToString()))
                        {
                            isAccessAllowed = true;
                            break;
                        }
                    }
                }

                #endregion
            //}
            if (null!= roleName && roleName.Equals(WebUserRole.SurveyAdmin.ToString()))
            {
                #region SurveyAdmin Code
                isAccessAllowed = true;
                //TODO check request for survey admin pages only.
                #endregion
            }

            if (!isAccessAllowed)
            {
                string msg = string.Format("A user {0} tried to view '{1}' but he wasn't allowed to access it.",
                                           userName, httpContext.Request.RawUrl);

                ILogger logger = new Logger(this.GetType());
                logger.Warn(msg);

                filterContext.Result = new RedirectResult(AppHelper.SharedUrl("UnauthorizedAccess"));
                httpContext.Response.Redirect(AppHelper.SharedUrl("UnauthorizedAccess"));
            }
        }
    }
}
