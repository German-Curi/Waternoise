using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Waternoise
{
    public partial class UserManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UserBLL userBLL = new UserBLL();
                var users = userBLL.Getall();
                gvUsers.DataSource = users;
                gvUsers.DataBind();
            }
        }
    }
}