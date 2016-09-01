using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using DiamondD.Web.Common.Logging;
using DiamondD.Web.Controllers;
using DiamondD.Web.Helpers;

namespace DiamondD.Web.Controllers.Filters
{
    public class RequiresAuthenticationAttribute : ActionFilterAttribute,
                    IActionFilter
    {
        #region IActionFilter Members
        void IActionFilter.OnActionExecuting(ActionExecutingContext filterContext)
        {
            string sessionKey = UserController.SessionKey.ToString();
            Debug.Assert(filterContext != null);
            Debug.Assert(filterContext.HttpContext != null);
            
            var httpContext = filterContext.HttpContext;

            var value = httpContext.Session[sessionKey];
            if (value == null)
            {
                ILogger logger = new Logger(this.GetType());
                string msg = string.Format("A User tried to view '{0}' when he was not logged in.", httpContext.Request.RawUrl);
                logger.Warn(msg);

                httpContext.Response.Redirect(AppHelper.UsersUrl("Login"));
            }
        }
        #endregion
    }
}
