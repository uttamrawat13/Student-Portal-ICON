using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiamondD.Web.Helpers
{
    public class AppHelper
    {
        public static string ContentRoot
        {
            get
            {
                const string contentVirtualRoot = "~/Content";
                return contentVirtualRoot;
            }
        }

        public static string ImageRoot
        {
            get
            {
                return string.Format("{0}/{1}", ContentRoot, "Images");
            }
        }

        public static string CssRoot
        {
            get
            {
                return string.Format("{0}/{1}", ContentRoot, "CSS");
            }
        }

        public static string ImageUrl(string imageFile)
        {
            string imageUrl = string.Format("{0}/{1}", ImageRoot, imageFile);
            return imageUrl;
        }
        public static string CssUrl(string cssFile)
        {
            string cssUrl = string.Format("{0}/{1}", CssRoot, cssFile);
            return cssUrl;
        }

        
        public static string ControlsRoot
        {
            get
            {
                const string controlsVirtualRoot = "~/UserControls";
                return controlsVirtualRoot;
            }
        }

        public static string ControlRoot
        {
            get
            {
                return string.Format("{0}", ControlsRoot);
            }
        }

        public static string ControlsUrl(string controlsFile)
        {
            string controlsUrl = string.Format("{0}/{1}", ControlRoot, controlsFile);
            return controlsUrl;
        }
        
        public static string ReportRoot 
        {
            get
            {
                const string reportVirtualRoot = "~/Reports";
                return reportVirtualRoot;
            }
        }

        public static string ReportsRoot
        {
            get
            {
                return string.Format("{0}", ReportRoot);
            }
        }

        public static string ReportsUrl(string reportsFile)
        {
            string reportsUrl = string.Format("{0}/{1}", ReportRoot, reportsFile);
            return reportsUrl;
        }


        public static string UserRoot
        {
            get
            {
                const string userVirtualRoot = "~/User";
                return userVirtualRoot;
            }
        }

        public static string UsersRoot
        {
            get
            {
                return string.Format("{0}", UserRoot);
            }
        }

        public static string UsersUrl(string userFile)
        {
            string usersUrl = string.Format("{0}/{1}", UserRoot, userFile);
            return usersUrl;
        }


        public static string HomeRoot
        {
            get
            {
                const string homeVirtualRoot = "~/Home";
                return homeVirtualRoot;
            }
        }

        public static string HomesRoot
        {
            get
            {
                return string.Format("{0}", HomeRoot);
            }
        }

        public static string HomeUrl(string homeFile)
        {
            string homeUrl = string.Format("{0}/{1}", HomeRoot, homeFile);
            return homeUrl;
        }

        public static string ErrorRoot
        {
            get
            {
                const string errorVirtualRoot = "~/Shared";
                return errorVirtualRoot;
            }
        }
        public static string ErrorsRoot
        {
            get
            {
                return string.Format("{0}", ErrorRoot);
            }
        }
        public static string ErrorUrl(string errorFile)
        {
            string errorUrl = string.Format("{0}/{1}", ErrorRoot, errorFile);
            return errorUrl;
        }
    }
}
