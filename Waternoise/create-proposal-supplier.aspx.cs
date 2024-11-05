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
    public partial class create_proposal_supplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int requestId = Convert.ToInt32(Request.QueryString["requestId"]); // Obtener el ID de la solicitud desde la URL
            CargarDatosSolicitud(requestId);
        }
        private void CargarDatosSolicitud(int requestId)
        {
            RequestBLL request= new RequestBLL();

            // Lógica para obtener la solicitud por ID desde la base de datos
            var solicitud = request.GetByID(requestId, Session["UserID"].ToString());
            if (solicitud != null)
            {
                lblTitulo.Text = solicitud.NameRequest;
                lblTipoProblema.Text = solicitud.ProblemType;
                lblDescripcion.Text = solicitud.Description;
                lblCaracteristicasTecnicas.Text = solicitud.TechnicalFeatures;
                lblAguaAfectada.Text = solicitud.AffectedWater;
                lblUbicacion.Text = solicitud.Location;
                lblMonedaValor.Text = solicitud.Currency;
                lblPrecioMinimo.Text = solicitud.MinPrice.ToString();
                lblPrecioMaximo.Text = solicitud.MaxPrice.ToString();
            }
        }
        protected void EnviarPropuesta_Click(object sender, EventArgs e)
        {

        }
    }
}