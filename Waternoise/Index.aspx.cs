using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BLL;

namespace Waternoise
{
    public partial class Index : System.Web.UI.Page
    {
        UserBLL _userBll = new UserBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string username = Request.Form["username"];
                string password = Request.Form["password"];

                User _user = _userBll.Login(username, password);

                Session["UserID"] = _user.ID;
                Session["UserEmail"] = _user.Email;
                Session["UserUsername"] = _user.Username;
                if (_user.Roles.Contains(Role.ADVISOR))
                {
                    Response.Redirect("profile-supplier.aspx");
                }
                else if (_user.Roles.Contains(Role.ADMINISTRATOR))
                {
                    Response.Redirect("profile-admin.aspx");
                }
                else if (_user.Roles.Contains(Role.USER))
                {
                    Response.Redirect("profile-applicant.aspx");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}