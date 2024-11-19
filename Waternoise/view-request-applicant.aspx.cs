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
    public partial class view_request_applicant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int requestId = Convert.ToInt32(Request.QueryString["requestId"]); // Suponiendo que se pasa el ID en la URL
                LoadRequestData(requestId);
            }
        }
        private void LoadRequestData(int requestId)
        {
            RequestBLL requestBLL = new RequestBLL();
            Request request = requestBLL.GetByID(requestId);

            if (request != null)
            {
                // Asignar los valores a los controles de la página
                txtTituloSolicitud.Text = request.NameRequest;
                txtProblemType.Text = request.ProblemType;
                txtDescription.Text = request.Description;
                txtTechnicalFeatures.Text = request.TechnicalFeatures;
                ddlAffectedWater.SelectedValue = request.AffectedWater;
                txtLocation.Text = request.Location;
                ddlMoneda.SelectedValue = request.Currency;
                txtMinPrice.Text = request.MinPrice.ToString();
                txtMaxPrice.Text = request.MaxPrice.ToString();
            }
            else
            {
                // Manejar el caso en el que no se encuentra la solicitud
                // Puede redirigir o mostrar un mensaje de error
                Response.Redirect("requestsapplicant.aspx");
            }
        }
    }
}