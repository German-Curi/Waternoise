using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BLL;
using Service;

namespace Waternoise
{
    public partial class register_supplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registrarProveedor_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                User user = new User();
                user.Username = name.Text;
                user.Password = Cryptography.Hash(password.Text);
                user.Email = email.Text;
                user.Roles = new List<Role>();
                user.Roles.Add(Role.ADVISOR);
                UserBLL userBLL = new UserBLL();
                userBLL.Create(user);
                hdnMostrarModal.Value = "true";
            }
        }
    }
}