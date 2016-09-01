using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiamondD.Services.Common;
using DiamondD.Services.User;

namespace DiamondD.Web.Controls
{
    public partial class StudentMenuControl : System.Web.UI.UserControl
    {
        public IList<string> enabledReportsList = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                IWebUserService webUserService = new WebUserService();
                enabledReportsList = webUserService.GetRoleRights(Session["DD_Role"].ToString());
            }
            catch (SqlException sqlEx)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception(EnumUtils.GetStringValue(ErrorMessage.UserDefinedMessage), ex);
            }
        }
    }
}