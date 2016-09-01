using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiamondD.Web.Controls
{
    public partial class ReportMenuControl : System.Web.UI.UserControl
    {
        public string lblHeadingText
        {
            set
            {
                this.lblHead.Text = value;
            }
        }
        public string HeadingCSSClass
        {
            set 
            {
                this.lblHead.CssClass = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}