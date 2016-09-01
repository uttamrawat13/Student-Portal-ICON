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
        public IList<string> enabledReportsList = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                object role = Session["DD_Role"];
                if (null != role)
                {
                    IWebUserService webUserService = new WebUserService();
                    enabledReportsList = webUserService.GetRoleRights(role.ToString());
                }
                else
                {
                    enabledReportsList = new List<string>();
                }
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