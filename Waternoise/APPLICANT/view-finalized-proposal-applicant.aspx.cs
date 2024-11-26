using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Waternoise.APPLICANT
{
    public partial class view_finalized_proposal_applicant : System.Web.UI.Page
    {
        ProposalBLL proposalBLL = new ProposalBLL();
        RequestBLL requestBLL = new RequestBLL();
        PortfolioBLL portfolioBLL = new PortfolioBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int proposalId = int.Parse(Request.QueryString["proposalId"]); // Obtener el ID de la propuesta desde la URL
                LoadProposal(proposalId);
            }
        }
        private void LoadProposal(int proposalId)
        {
            var proposal = proposalBLL.GetByID(proposalId);
            var request = requestBLL.GetByID(proposal.RequestID);
            proposal.Request = request;

            // Datos de la solicitud
            lblTitulo.Text = proposal.Request.NameRequest;
            lblTipoProblema.Text = proposal.Request.ProblemType;
            lblDescripcion.Text = proposal.Request.Description;
            lblCaracteristicasTecnicas.Text = proposal.Request.TechnicalFeatures;
            lblAguaAfectada.Text = proposal.Request.AffectedWater;
            lblUbicacion.Text = proposal.Request.Location;
            lblMonedaValor.Text = proposal.Request.Currency;
            lblPrecioMinimo.Text = proposal.Request.MinPrice.ToString();
            lblPrecioMaximo.Text = proposal.Request.MaxPrice.ToString();

            // Catálogo
            lblCatalogName.Text = portfolioBLL.GetPortfolioByID(proposal.PortfolioID).Title;

            // Productos
            grvProductos.DataSource = portfolioBLL.ProductsGetByPortfolioId(proposal.PortfolioID);
            grvProductos.DataBind();

            // Descripción y total
            lblPropuestaDescripcion.Text = proposal.Details;
            lblPropuestaTotal.Text = proposal.TotalPrice.ToString();
        }
    }
}