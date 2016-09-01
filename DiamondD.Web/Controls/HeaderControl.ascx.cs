using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiamondD.Services.Settings;

namespace DiamondD.Web.Controls
{
    public partial class HeaderControl : System.Web.UI.UserControl
    {
        public static string imagesPath;


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ISettingsService settingsService = new SettingsService();
                ViewState["TitleMsg"] = settingsService.GetTitleMsg();
                string path = ConfigurationManager.AppSettings["logoPath"];

                imagesPath = ResolveClientUrl("~" + path) + settingsService.GetLogoFileName();

                ViewState["LogoFilePath"] = imagesPath;
            }
            catch (Exception)
            {
                // Redirect to error page
                if(!Response.IsRequestBeingRedirected)
                    Response.Redirect("Result/error");  
            }
            
        }
    }
}