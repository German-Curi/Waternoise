using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BLL;

namespace Waternoise.SUPPLIER
{
    public partial class create_suscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SubscriptionBLL subscriptionBLL = new SubscriptionBLL();
            UserBLL userBLL = new UserBLL();
            User user = userBLL.GetByID(int.Parse(Session["UserID"].ToString()));
            List<Subscription> subscriptions = subscriptionBLL.GetByCompanyID(user.CompanyID);
            if (subscriptions.Count != 0)
            {
                subscription_ready.Text = "Ya cuenta con una suscripcion activa.";
                btnPagar.Visible= false;
                main_subs.Visible= false;
            }
        }

        protected void ddlCantidadMeses_SelectedIndexChanged(object sender, EventArgs e)
        {
            int cantidadMeses = int.Parse(ddlCantidadMeses.SelectedValue);
            decimal precioMensual = 300000;
            decimal total = 0;

            if (cantidadMeses == 1 || cantidadMeses == 2 || cantidadMeses == 3)
            {
                if (cantidadMeses == 3)
                {
                    // Aplicar descuento del 10% para 3 meses
                    total = precioMensual * cantidadMeses * 0.9m;
                }
                else
                {
                    total = precioMensual * cantidadMeses;
                }
            }

            // Mostrar el total solo si se selecciona un valor válido
            txtTotalSuscripcion.Text = total > 0 ? ("$"+ total.ToString()) : " ";

        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Subscription subscription = new Subscription();
                UserBLL userBLL = new UserBLL();
                SubscriptionBLL subscriptionBLL= new SubscriptionBLL();
                User user = userBLL.GetByID(int.Parse(Session["UserID"].ToString()));
                subscription.CompanyID = user.CompanyID;
                subscription.CardholderName = txtNombreTarjeta.Text;
                subscription.CardNumber = txtNumeroTarjeta.Text;
                subscription.ExpirationDate = DateTime.Parse( txtFechaExpiracion.Text);
                subscription.CVVCode = txtCodigoCVV.Text;
                subscription.SubscriptionDuration = int.Parse(ddlCantidadMeses.SelectedValue);
                subscription.SubscriptionTotal = decimal.Parse(txtTotalSuscripcion.Text.Replace("$", "").Trim()); 
                
                subscriptionBLL.Create(subscription,user);
                hdnMostrarModal.Value = "true";
            }
        }
    }
}