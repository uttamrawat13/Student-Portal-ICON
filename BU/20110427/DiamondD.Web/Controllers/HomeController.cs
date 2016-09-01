using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DiamondD.Web.Controllers.Filters;
using DiamondD.Services.User;
using DiamondD.Web.Common.Logging;

namespace DiamondD.Web.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        private ILogger logger;
        //
        // GET: /Login/


        public HomeController()
        {
            logger = new Logger(this.GetType());
        }
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }
        
        public ActionResult About()
        {
            return View();
        }

        [RequiresAuthentication]
        public ActionResult Home()
        {
            try
            {
                IWebUserService webUserService = new WebUserService();

                var studentNo = Session[UserController.SessionKeyStudentNo];
                if (studentNo != null)
                {
                    string welcomeMsg = webUserService.GetWelcomeMsgText();
                    ViewData["WelcomeMsg"] = welcomeMsg;
                }

                return View();
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
                // Redirect to error page
                Response.Redirect("Result/error");
                return null;
            }
        }
       
    }
}
