using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiamondD.Web.Helpers
{
    public class AppHelper
    {
        public const string ControllerExtension = ".mvc";

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

        public static string LogoImageRoot
        {
            get
            {
                return string.Format("{0}/{1}/{2}", ContentRoot, "Images", "LogoImages");
            }
        }

        public static string ScriptRoot
        {
            get { return "~/Scripts"; }
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

        public static string LogoImageUrl(string imageFile)
        {
            string imageUrl = string.Format("{0}/{1}", LogoImageRoot, imageFile);
            return imageUrl;
        }

        public static string ScriptUrl(string scriptFile)
        {
            string scriptUrl = string.Format("{0}/{1}", ScriptRoot, scriptFile);
            return scriptUrl;
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

        //public static string ControlRoot
        //{
        //    get
        //    {
        //        return string.Format("{0}", ControlsRoot);
        //    }
        //}

        public static string ControlsUrl(string controlName)
        {
            string controlsUrl = string.Format("{0}/{1}", ControlsRoot, controlName);
            return controlsUrl;
        }
        
        public static string ReportRoot 
        {
            get
            {
                const string reportVirtualRoot = "~/Reports" + ControllerExtension;
                return reportVirtualRoot;
            }
        }

        //public static string ReportsRoot
        //{
        //    get
        //    {
        //        return string.Format("{0}", ReportRoot);
        //    }
        //}

        public static string ReportsUrl(string viewName)
        {
            string reportsUrl = string.Format("{0}/{1}", ReportRoot, viewName);
            return reportsUrl;
        }


        public static string UserRoot
        {
            get
            {
                const string userVirtualRoot = "~/User" + ControllerExtension;
                return userVirtualRoot;
            }
        }

        public static string SurveyRoot
        {
            get
            {
                const string userVirtualRoot = "~/Survey" + ControllerExtension;
                return userVirtualRoot;
            }
        }
        //public static string UsersRoot
        //{
        //    get
        //    {
        //        return string.Format("{0}", UserRoot);
        //    }
        //}

        public static string UsersUrl(string viewName)
        {
            string usersUrl = string.Format("{0}/{1}", UserRoot, viewName);
            return usersUrl;
        }

        public static string SurveysUrl(string viewName)
        {
            string usersUrl = string.Format("{0}/{1}", SurveyRoot, viewName);
            return usersUrl;
        }
        public static string EnrollmentRoot
        {
            get
            {
                const string enrollmentVirtualRoot = "~/Enrollment" + ControllerExtension;
                return enrollmentVirtualRoot;
            }
        }

        public static string EnrollmentUrl(string viewName)
        {
            string usersUrl = string.Format("{0}/{1}", EnrollmentRoot, viewName);
            return usersUrl;
        }

        public static string SharedRoot
        {
            get
            {
                const string sharedVirtualRoot = "~/Shared" + ControllerExtension ;
                return sharedVirtualRoot;
            }
        }
        //public static string SharedsRoot
        //{
        //    get
        //    {
        //        return string.Format("{0}", SharedRoot);
        //    }
        //}
        public static string SharedUrl(string sharedFile)
        {
            string sharedUrl = string.Format("{0}/{1}", SharedRoot, sharedFile);
            return sharedUrl;
        }
    }
}
