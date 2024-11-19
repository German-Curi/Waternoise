using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BE;
using Newtonsoft.Json;
using System.Net.Http;
using Azure.Core;


namespace Waternoise
{
    public partial class create_proposal_supplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int requestId = Convert.ToInt32(Request.QueryString["requestId"]); // Obtener el ID de la solicitud desde la URL
                CargarDatosSolicitud(requestId);
                CargarPortafolios();
            }
        }
        private void CargarDatosSolicitud(int requestId)
        {
            RequestBLL request= new RequestBLL();

            // Lógica para obtener la solicitud por ID desde la base de datos
            var solicitud = request.GetByID(requestId);
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

        private void CargarPortafolios()
        {
            PortfolioBLL portfolioBLL = new PortfolioBLL();
            var portafolios = portfolioBLL.GetPortfoliosByUserID( Session["UserID"].ToString() ,0,100,"", "CreatedDate", "DESC").Results;

            ddlPortafolios.DataSource = portafolios;
            ddlPortafolios.DataTextField = "Title";
            ddlPortafolios.DataValueField = "ID";
            ddlPortafolios.DataBind();
            ddlPortafolios.Items.Insert(0, new ListItem("-- Seleccione un portafolio --", "0"));
        }

        protected void ddlPortafolios_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPortafolios.SelectedValue != "0")
            {
                CargarProductos(Convert.ToInt32(ddlPortafolios.SelectedValue));
            }
            else
            {
                grvProductos.DataSource = null;
                grvProductos.DataBind();
                txtTotalPrecio.Text = string.Empty;
            }
        }

        private void CargarProductos(int portfolioId)
        {
            PortfolioBLL portfolioBLL = new PortfolioBLL();
            var productos = portfolioBLL.ProductsGetByPortfolioId(portfolioId);
            double cotizacion_dolar = ObtenerCotizacionDolar();
            grvProductos.DataSource = productos;
            grvProductos.DataBind();

            // Calcular total de precios
            double totalPrecio = 0;
            foreach (var producto in productos)
            {
                if (producto.Currency == "Dólar")
                {
                    producto.Price = producto.Price * cotizacion_dolar;
                }
                totalPrecio += producto.Price;
            }
            txtTotalPrecio.Text = totalPrecio.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("es-AR"));
        }
        private double ObtenerCotizacionDolar()
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://api.exchangerate-api.com/v4/latest/USD"); // Cambia por la API que desees usar
                HttpResponseMessage response = client.GetAsync("").Result;

                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = response.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject<dynamic>(jsonResponse);
                    return (double)data.rates.ARS;
                }
                else
                {
                    throw new Exception("No se pudo obtener la cotización del dólar.");
                }
            }
        }
        protected void EnviarPropuesta_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                RequestBLL requestBLL = new RequestBLL();
                ProposalBLL proposalBLL = new ProposalBLL();

                BE.Request requestAux = requestBLL.GetByID(Convert.ToInt32(Request.QueryString["requestId"]));

                Proposal proposal = new Proposal();
                proposal.RequestID = requestAux.ID;
                proposal.UserRequestID = requestAux.UserId;
                proposal.AdvisorID = Convert.ToInt32(Session["UserID"]);
                proposal.PortfolioID = Convert.ToInt32(ddlPortafolios.SelectedValue);
                proposal.TotalPrice = decimal.Parse(txtTotalPrecio.Text.Replace("$", "").Trim());
                proposal.Details = txtDetallesPropuesta.Text;
                proposal.Status = ProposalStatus.PENDING;

                proposalBLL.Create(proposal, Session["UserID"].ToString());
                requestBLL.Update(requestAux.ID,RequestStatus.PENDING);

                hdnMostrarModal.Value = "true";
            }
        }
    }
}