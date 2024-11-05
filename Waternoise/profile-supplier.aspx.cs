using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BE;


namespace Waternoise
{
    public partial class profile_supplier : System.Web.UI.Page
    {
        UserBLL userBLL = new UserBLL();
        User user = new User();
        public static Company company = new Company();
        CompanyBLL companyBLL = new CompanyBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Solo ejecuta este código si la página no es un postback
            {
                try
                {
                    btmActualizar.Visible = false;
                    btnGuardar.Visible = true;
                    txtRazonSocial.Enabled = true;

                    user = userBLL.GetByID(int.Parse(Session["UserID"].ToString()));
                    if (user.CompanyID != -1)
                    {
                        company = companyBLL.GetByID(user.CompanyID);
                        txtRazonSocial.Text = company.BusinessName;
                        txtEmail.Text = company.Email;
                        txtDireccion.Text = company.Address;
                        txtNumeroContacto.Text = company.ContactNumber;

                        btmActualizar.Visible = true;
                        btnGuardar.Visible = false;
                        txtRazonSocial.Enabled = false;
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    user = userBLL.GetByID(int.Parse(Session["UserID"].ToString()));
                    company.BusinessName = txtRazonSocial.Text;
                    company.Email = txtEmail.Text;
                    company.Address = txtDireccion.Text;
                    company.ContactNumber = txtNumeroContacto.Text;

                    companyBLL.Create(user, company);
                    hdnMostrarModal.Value = "true";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btmActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    company.Email = txtEmail.Text;
                    company.Address = txtDireccion.Text;
                    company.ContactNumber = txtNumeroContacto.Text;

                    companyBLL.Update(company, Session["UserID"].ToString());
                    hdnMostrarModal.Value = "true";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}