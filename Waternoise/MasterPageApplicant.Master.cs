using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Waternoise
{
    public partial class MasterPageApplicant : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            profileApplicant.Text = Session["UserUsername"].ToString();
        }
    }
}