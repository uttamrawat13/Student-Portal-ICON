using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using RouteDebug;
namespace DiamondD.Web
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //routes.Add(new Route
            //    (
            //    "Views/{controller}.mvc.mvc/{action}",
            //    new RouteValueDictionary(new {  action = "Login", id = (string)null }),
            //    new MvcRouteHandler()

            //    ));
          routes.MapRoute(
                "User",                                                    // Route name
                "Views/{controller}.mvc/{action}",                             // URL with parameters
                new { controller = "User", action = "Login" }            // Parameter defaults
            );

          routes.MapRoute(
              "DisableReports",                                                    // Route name
              "Views/{controller}.mvc/{action}",                             // URL with parameters
              new { controller = "Shared", action = "DisableReports" }            // Parameter defaults
          );
            
            routes.MapRoute(
                "Register",                                                    // Route name
                "Views/{controller}.mvc/{action}",                             // URL with parameters
                new { controller = "User", action = "Register" }            // Parameter defaults
            );
            routes.MapRoute(
                "AskSecretQuestion",                                                    // Route name
                "Views/{controller}.mvc/{action}/{id}",                             // URL with parameters
                new { controller = "User", action = "AskSecretQuestion", id = "" }            // Parameter defaults
            );
            routes.MapRoute(
                "Result",                                                    // Route name
                "Views/{controller}.mvc/{action}",                             // URL with parameters
                new { controller = "User", action = "Result", id = "" }            // Parameter defaults
            );

            routes.MapRoute(
                "UserSettings",                                              // Route name
                "{id}",                                                      // URL with parameters
                new { controller = "User", action = "UserSettings", id = "" }// Parameter defaults
            );

            routes.MapRoute(
                "AdminSettings",                                              // Route name
                "{id}",                                                       // URL with parameters
                new { controller = "User", action = "AdminSettings", id = "" }// Parameter defaults
            );

           routes.MapRoute(
                "ResetPassword",                                                    // Route name
                "Views/{controller}.mvc/{action}",                                    // URL with parameters
                new { controller = "User", action = "ResetPassword" }            // Parameter defaults
            );
            routes.MapRoute(
                "ResendActivateAccount",                                                    // Route name
                "Views/{controller}.mvc/{action}",                             // URL with parameters
                new { controller = "User", action = "ResendActivateAccount" }            // Parameter defaults
            );

          routes.MapRoute(
              "Error",                                                    // Route name
              "Views/{controller}.mvc/{action}/{id}",                             // URL with parameters
              new { controller = "Shared", action = "Error", id = "" }            // Parameter defaults
          );
           routes.MapRoute(
               "AttendanceReview",                                              // Route name
               "Views/{controller}.mvc/{action}",                                   // URL with parameters
               new { controller = "Reports", action = "AttendanceReview" }      // Parameter defaults
           );

           routes.MapRoute(
              "ScheduleOfCourses",                                              // Route name
              "Views/{controller}.mvc/{action}",                                   // URL with parameters
              new { controller = "Reports", action = "ScheduleOfCourses" }      // Parameter defaults
          );
           routes.MapRoute(
             "AttendanceSummary",                                              // Route name
             "Views/{controller}.mvc/{action}",                                   // URL with parameters
             new { controller = "Reports", action = "AttendanceSummary" }      // Parameter defaults
         );
           routes.MapRoute(
            "StudentLedger",                                              // Route name
            "Views/{controller}.mvc/{action}",                                   // URL with parameters
            new { controller = "Reports", action = "StudentLedger" }      // Parameter defaults
        );
           routes.MapRoute(
               "StudentReportStatus",                                              // Route name
               "Views/{controller}.mvc/{action}",                                   // URL with parameters
               new { controller = "Reports", action = "StudentReportStatus" }      // Parameter defaults
           );
           routes.MapRoute(
              "CosmetologyGradeBookLabs",                                              // Route name
              "Views/{controller}.mvc/{action}",                                   // URL with parameters
              new { controller = "Reports", action = "CosmetologyGradeBookLabs" }      // Parameter defaults
          );
           routes.MapRoute(
              "CosmetologyGradeBookTests",                                              // Route name
              "Views/{controller}.mvc/{action}",                                   // URL with parameters
              new { controller = "Reports", action = "CosmetologyGradeBookTests" }      // Parameter defaults
          );
           routes.MapRoute(
              "CosmetologyGradeBookSummary",                                              // Route name
              "Views/{controller}.mvc/{action}",                                   // URL with parameters
              new { controller = "Reports", action = "CosmetologyGradeBookSummary" }      // Parameter defaults
          );
           routes.MapRoute(
              "ProgramCourseProgress",                                              // Route name
              "Views/{controller}.mvc/{action}",                                   // URL with parameters
              new { controller = "Reports", action = "ProgramCourseProgress" }      // Parameter defaults
          );
           routes.MapRoute(
                "Transcript",                                              // Route name
                "Views/{controller}.mvc/{action}",                             // URL with parameters
                new { controller = "Reports", action = "Transcript" }      // Parameter defaults
            );
            routes.MapRoute(
               "StudentDetail",                                              // Route name
               "Views/{controller}.mvc/{action}",                                // URL with parameters
               new { controller = "Reports", action = "StudentDetail" }      // Parameter defaults
           );
           routes.MapRoute(
               "PaymentSchedule",                                              // Route name
               "Views/{controller}.mvc/{action}",                                // URL with parameters
               new { controller = "Reports", action = "PaymentSchedule" }      // Parameter defaults
           );
            routes.MapRoute(
                "GradeHistory",                                              // Route name
                "{controller}.mvc/{action}",                                   // URL with parameters
                new { controller = "Reports", action = "GradeHistory" }       // Parameter defaults
            );
            routes.MapRoute(
                "Home",                                                 // Route name
                "{controller}.mvc/{action}",                                // URL with parameters
                new { controller = "Home", action = "Home" }            // Parameter defaults
            );

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}/{action}/{id}",                           // URL with parameters
                new { controller = "Home", action = "Index", id = "" }  // Parameter defaults
            );
            
            
            //routes.MapRoute(
            //    "Default",                                                        // Route name
            //    "{controller}.mvc/{action}/{id}",                                     // URL with parameters
            //    new { controller = "Reports", action = "Transcript", id = "" }    // Parameter defaults
            //);

            //routes.MapRoute(
            //    "Default",                                              // Route name
            //    "Views/{controller}.mvc/{action}",                           // URL with parameters
            //    new { controller = "Reports", action = "Transcript"}  // Parameter defaults
            //);

        }

        protected void Application_Start()
        {
            log4net.Config.XmlConfigurator.Configure();

            RegisterRoutes(RouteTable.Routes);
           // RouteDebug.RouteDebugger.RewriteRoutesForTesting(RouteTable.Routes);
        }
    }
}