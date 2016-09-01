using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using DiamondD.Web.Helpers;
namespace DiamondD.Web
{
    public partial class _Default : Page
    {
        public void Page_Load(object sender, System.EventArgs e)
        {
            // Change the current path so that the Routing handler can correctly interpret
            // the request, then restore the original path so that the OutputCache module
            // can correctly process the response (if caching is enabled).
            //Response.Redirect(AppHelper.HomeUrl("Index/123"));
            
            
            HttpContext.Current.RewritePath(Request.ApplicationPath, false);            
            IHttpHandler httpHandler = new MvcHttpHandler();
            httpHandler.ProcessRequest(HttpContext.Current);
            
            string originalPath = Request.Path;
            HttpContext.Current.RewritePath(originalPath, false);
            
            Response.Redirect(AppHelper.UsersUrl("Login"), false);      
        }
    }
}
