using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Diagnostics;
using DiamondD.Web.Common.Logging;
using DiamondD.Web.Helpers;

namespace DiamondD.Web.Controllers.Filters
{
    public class RequiresRoleAttribute : ActionFilterAttribute,
                    IActionFilter
    {
        void IActionFilter.OnActionExecuting(ActionExecutingContext filterContext)
        {
            string SessionKeyRole = UserController.SessionKeyRole.ToString();
            string sessionKey = UserController.SessionKey.ToString();
            Debug.Assert(filterContext != null);
            Debug.Assert(filterContext.HttpContext != null);

            var httpContext = filterContext.HttpContext;

            var roleValue = httpContext.Session[SessionKeyRole];
            var userValue = httpContext.Session[sessionKey];

                        
            //if (roleValue != null && roleValue.Equals("Student"))
            //{
            //    ILogger logger = new Logger(this.GetType());
            //    string msg = string.Format("A student tried to view '{0}' but '{1}' can't used it.", httpContext.Request.RawUrl, userValue ?? "<null>");
            //    logger.Info(msg);

            //    httpContext.Response.Redirect(AppHelper.ErrorUrl("DisableReports"));
            //}
        }
    }
}
