using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Waternoise
{
    public partial class profile_applicant : System.Web.UI.Page
    {
        UserBLL userBLL = new UserBLL();
        User user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                user = userBLL.GetByID(int.Parse(Session["UserID"].ToString()));
                txtUsername.Text = user.Username;
                txtEmail.Text = user.Email;
                txtCreacion.Text = user.CreatedAt.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}