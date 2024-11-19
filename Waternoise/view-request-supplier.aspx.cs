using BE;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Waternoise
{
    public partial class view_request_supplier : System.Web.UI.Page
    {
        RequestBLL requestBLL = new RequestBLL();
        private const int pageSize = 3;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["pageIndex"] = 1;
                LoadRequests();
            }
        }
        private void LoadRequests()
        {
            int pageIndex = (int)(Session["pageIndex"] ?? 1);
            DateTime? fromDate = null;
            DateTime? toDate = null;

            if (DateTime.TryParse(txtFromDate.Text, out DateTime from))
            {
                fromDate = from;
            }
            if (DateTime.TryParse(txtToDate.Text, out DateTime to))
            {
                toDate = to;
            }

            string orderByOrder = ddlOrderByOrder.SelectedValue;
            string location = txtLocation.Text;

            var paginatedRequests = requestBLL.GetAllPaginatedRequests(
                size: pageSize,
                offset: (pageIndex - 1) * pageSize,
                location: !string.IsNullOrEmpty(location) ? new List<string> { location } : null,
                status: new List<string> { RequestStatus.OPEN.ToString() },
                usernames: null, // Add if usernames filter is required
                orderByColumn: "CreatedAt",
                orderByOrder: orderByOrder,
                fromDate: fromDate,
                toDate: toDate
            );

            rptRequests.DataSource = paginatedRequests.Results;
            rptRequests.DataBind();

            Session["TotalPages"] = paginatedRequests.TotalPages;
            lblPageInfo.Text = $"Página {pageIndex} de {paginatedRequests.TotalPages}";
            btnPrevious.Enabled = pageIndex > 1;
            btnNext.Enabled = pageIndex < paginatedRequests.TotalPages;
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
            LoadRequests();
        }
        protected void rptRequests_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ProposeRequest")
            {
                int requestId = Convert.ToInt32(e.CommandArgument);
                // Implementa la lógica para proponer una solicitud
                Response.Redirect($"create-proposal-supplier.aspx?requestId={requestId}");
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            Session["pageIndex"] = 1; // Reset page index when filters are applied
            LoadRequests();
        }
    }
}