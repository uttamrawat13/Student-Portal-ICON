using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using DiamondD.Web.Helpers;
using RouteDebug;
namespace DiamondD.Web
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public class SurveyPrefixRouteHandler : IRouteHandler
        {
            public IHttpHandler GetHttpHandler(RequestContext requestContext)
            {
                //only apply this behavior to a part of the site
                
                if (requestContext.HttpContext.Request.Path.ToLower().StartsWith("/survey.mvc/createsurvey/"))
                {
                    requestContext.RouteData.Values["action"] = "createsurvey";
                    requestContext.RouteData.Values["controller"] = "Survey";

                    var id = requestContext.RouteData.Values["crudOperation"];
                    requestContext.RouteData.Values["id"] = id;
                }else if (requestContext.HttpContext.Request.Path.ToLower().StartsWith("/survey.mvc/"))
                //&& requestContext.HttpContext.User.Identity.IsAuthenticated)
                {
                    //prefix the action name with Admin
                    var type = requestContext.RouteData.Values["type"].ToString();

                    var crudOperation = requestContext.RouteData.Values["crudOperation"].ToString();
                    requestContext.RouteData.Values["action"] = crudOperation + type;
                    requestContext.RouteData.Values["controller"] = "Survey";

                }
                return new MvcHandler(requestContext);
            }
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            //routes.MapRoute("SP_CreateSurvey", "Survey" + AppHelper.ControllerExtension + "/CreateSurvey/{id}");
            
            routes.Add("SP_Survey", new Route("Survey" + AppHelper.ControllerExtension + "/{type}/{crudOperation}", new SurveyPrefixRouteHandler())
            );

            routes.MapRoute(
                "SP_Specific",
                "{controller}" + AppHelper.ControllerExtension + "/{action}/{id}"
                );



            //routes.MapRoute(
            //    "SP_Test", "Survey/{type}/{crudOperation}", 
            //    new { controller = "Survey", action = "Group{action}" }
            //    );

            routes.MapRoute(
                "SP_Enrollment_Paging",
                "{controller}" + AppHelper.ControllerExtension + "/List/{action}/{pageNumber}"
                );

            routes.MapRoute(
                "SP_Default",                                                       // Route name
                "{controller}" + AppHelper.ControllerExtension + "/{action}",       // URL with parameters             
                new { controller = "User", action = "Login" }                         // Parameter defaults
                );

            routes.MapRoute(
                "Root",
                "",
                new { controller = "User", action = "Login" }
                );
        }

        protected void Application_Start()
        {
            log4net.Config.XmlConfigurator.Configure();
            RegisterRoutes(RouteTable.Routes);
        }
    }
}