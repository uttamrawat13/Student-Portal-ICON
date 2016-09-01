using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Net;

namespace DiamondD.Web.Controllers
{
    public class SharedController : Controller
    {
        //
        // GET: /Shared/
        
        public ActionResult Error()
        {
            return View();
        }

        public ActionResult UnauthorizedAccess()
        {
            return View();
        }
        public ActionResult Result(string id)
        {
            // Show if error occure before login.
            if (id != null)
            {
                ViewData["response"] = id;
            }
            return View();
        }

        public ActionResult Reply(string id)
        {
            // Show if error occure after login.
            if (id != null)
            {
                ViewData["response"] = id;
            }
            return View();
        }
    }
}
