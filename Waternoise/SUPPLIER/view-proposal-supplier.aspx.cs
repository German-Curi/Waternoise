using BLL;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Waternoise
{
    public partial class view_proposal_supplier : System.Web.UI.Page
    {
        ProposalBLL proposalBLL = new ProposalBLL();
        RequestBLL requestBLL= new RequestBLL();
        PortfolioBLL portfolioBLL = new PortfolioBLL();
        private const int pageSize = 3;
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
            
            var proposal = proposalBLL.GetByID(proposalId); // Método BLL que devuelve la propuesta
            var request = requestBLL.GetByID(proposal.RequestID);
            proposal.Request= request;
            // Enlazar información de la solicitud
            lblTitulo.Text = proposal.Request.NameRequest;
            lblTipoProblema.Text = proposal.Request.ProblemType;
            lblDescripcion.Text = proposal.Request.Description;
            lblCaracteristicasTecnicas.Text = proposal.Request.TechnicalFeatures;
            lblAguaAfectada.Text = proposal.Request.AffectedWater;
            lblUbicacion.Text = proposal.Request.Location;
            lblMonedaValor.Text = proposal.Request.Currency;
            lblPrecioMinimo.Text = proposal.Request.MinPrice.ToString();
            lblPrecioMaximo.Text = proposal.Request.MaxPrice.ToString();

            // Enlazar el catálogo
            lblCatalogName.Text = portfolioBLL.GetPortfolioByID(proposal.PortfolioID).Title;

            // Enlazar la grilla de productos
            grvProductos.DataSource = portfolioBLL.ProductsGetByPortfolioId(proposal.PortfolioID); ;
            grvProductos.DataBind();

            // Enlazar descripción y total
            lblPropuestaDescripcion.Text = proposal.Details;
            lblPropuestaTotal.Text = proposal.TotalPrice.ToString();
        }

        protected void btnCerrarPropuesta_Click(object sender, EventArgs e)
        {

        }
    }
}