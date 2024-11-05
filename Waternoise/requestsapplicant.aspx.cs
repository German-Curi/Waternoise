using BE;
using BLL;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Waternoise
{
    public partial class requestsapplicant : System.Web.UI.Page
    {
        private const int PageSize = 3;

        private int CurrentPage
        {
            get { return Session["CurrentPage"] != null ? (int)Session["CurrentPage"] : 1; }
            set { Session["CurrentPage"] = value; }
        }

        private int TotalPages
        {
            get { return Session["TotalPages"] != null ? (int)Session["TotalPages"] : 1; }
            set { Session["TotalPages"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRequests();
            }
        }

        private void LoadRequests()
        {
            RequestBLL requestBLL = new RequestBLL();
            string token = Session["UserID"].ToString();

            int offset = (CurrentPage - 1) * PageSize;
            PaginatedRequests paginatedRequests = requestBLL.GetUserRequestsByUserID(token, offset, PageSize,"CreatedDate", "DESC");

            rptRequests.DataSource = paginatedRequests.Results;
            rptRequests.DataBind();

            // Almacena TotalPages en Session para utilizarlo en ChangePage
            TotalPages = paginatedRequests.TotalPages;

            // Actualiza la información de la página
            lblPageInfo.Text = $"Página {CurrentPage} de {TotalPages}";
            btnPrevious.Enabled = CurrentPage > 1;
            btnNext.Enabled = CurrentPage < TotalPages;
        }

        protected void ChangePage(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            if (btn.CommandArgument == "Next" && CurrentPage < TotalPages)
            {
                CurrentPage++;
            }
            else if (btn.CommandArgument == "Previous" && CurrentPage > 1)
            {
                CurrentPage--;
            }

            LoadRequests();
        }

        protected void rptRequests_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewRequest")
            {
                int requestId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"view-request-applicant.aspx?requestId={requestId}");
            }
        }
    }
}
