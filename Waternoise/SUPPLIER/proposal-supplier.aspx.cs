using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Waternoise.SUPPLIER
{
    public partial class proposal_supplier : System.Web.UI.Page
    {
        ProposalBLL proposalBLL = new ProposalBLL();
        private const int pageSize = 3;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["pageIndex"] = 1;
                LoadProposals();
            }
        }
        private void LoadProposals()
        {
            int pageIndex = (int)(Session["pageIndex"] ?? 1);

            // Configuración de filtros
            int size = pageSize; // Tamaño de la página definido globalmente
            int offset = (pageIndex - 1) * size; // Desplazamiento basado en la página actual
            string orderByColumn = "CreatedAt"; // Ordenar por la columna de creación
            string orderByOrder = ddlOrderByOrder.SelectedValue; // Dirección del orden (ASC/DESC)
            int? advisorID = int.Parse(Session["UserID"].ToString());
            int? userRequestID = null; // No estamos filtrando por ID de solicitud del usuario
            List<string> status = new List<string> { ProposalStatus.PENDING.ToString() };

            // Llamada al método GetAllPaginatedProposals
            var paginatedProposals = proposalBLL.GetAllPaginatedProposals(
                size: size,
                offset: offset,
                advisorID: advisorID,
                userRequestID: userRequestID,
                status: status,
                orderByColumn: orderByColumn,
                orderByOrder: orderByOrder
            );

            // Configurar el Repeater con las propuestas obtenidas
            rptProposals.DataSource = paginatedProposals.Results;
            rptProposals.DataBind();

            // Actualización de información de paginación
            Session["TotalPages"] = paginatedProposals.TotalPages;
            lblPageInfo.Text = $"Página {pageIndex} de {paginatedProposals.TotalPages}";
            btnPrevious.Enabled = pageIndex > 1;
            btnNext.Enabled = pageIndex < paginatedProposals.TotalPages;
        }
        protected void ChangePage(object sender, EventArgs e)
        {
            int pageIndex = (int)(Session["pageIndex"] ?? 1);
            int totalPages = (int)(Session["TotalPages"] ?? 1);

            var button = sender as Button;
            if (button.CommandArgument == "Next" && pageIndex < totalPages)
            {
                pageIndex++;
            }
            else if (button.CommandArgument == "Previous" && pageIndex > 1)
            {
                pageIndex--;
            }

            Session["pageIndex"] = pageIndex;
            LoadProposals();
        }
        protected void rptProposals_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewProposal")
            {
                int proposalId = Convert.ToInt32(e.CommandArgument);
                // Redirige a una página para visualizar detalles de la propuesta
                Response.Redirect($"view-proposal-supplier.aspx?proposalId={proposalId}");
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            Session["pageIndex"] = 1; // Reinicia la página al aplicar filtros
            LoadProposals();
        }
    }
}