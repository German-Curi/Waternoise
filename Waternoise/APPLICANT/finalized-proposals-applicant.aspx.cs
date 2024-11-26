using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Waternoise.APPLICANT
{
    public partial class finalized_proposals_applicant : System.Web.UI.Page
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
            int size = pageSize;
            int offset = (pageIndex - 1) * size;
            string orderByColumn = "CreatedAt";
            string orderByOrder = ddlOrderByOrder.SelectedValue;
            int? advisorID = null; // No se filtra por asesor
            int? userRequestID = int.Parse(Session["UserID"].ToString());
            List<string> status =new List<string>{ ProposalStatus.CLOSED.ToString(), ProposalStatus.REJECTED.ToString()};

            // Obtener propuestas filtradas
            var paginatedProposals = proposalBLL.GetAllPaginatedProposals(
                size: size,
                offset: offset,
                advisorID: advisorID,
                userRequestID: userRequestID,
                status: status,
                orderByColumn: orderByColumn,
                orderByOrder: orderByOrder
            );

            rptProposals.DataSource = paginatedProposals.Results;
            rptProposals.DataBind();

            Session["TotalPages"] = paginatedProposals.TotalPages;
            lblPageInfo.Text = $"Página {pageIndex} de {paginatedProposals.TotalPages}";
            btnPrevious.Enabled = pageIndex > 1;
            btnNext.Enabled = pageIndex < paginatedProposals.TotalPages;
        }
        protected void rptProposals_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewProposal")
            {
                int proposalId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"view-finalized-proposal-applicant.aspx?proposalId={proposalId}");
            }
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
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            Session["pageIndex"] = 1;
            LoadProposals();
        }
    }
}