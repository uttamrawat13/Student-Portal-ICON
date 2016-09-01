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

        public ActionResult DisableReports()
        {
            return View();
        }
    }
}
