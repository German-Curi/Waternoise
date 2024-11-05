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
    public partial class porfolio : System.Web.UI.Page
    {
        private const int PageSize = 5;
        private int CurrentPage
        {
            get => (int)(ViewState["CurrentPage"] ?? 1);
            set => ViewState["CurrentPage"] = value;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPortfolios();
            }
        }
        private void LoadPortfolios()
        {
            PortfolioBLL catalogoBLL= new PortfolioBLL();
            string token = Session["UserID"].ToString();
            PaginatedPortfolios paginatedPortfolios = catalogoBLL.GetPortfoliosByUserID(token, (CurrentPage - 1) * PageSize, PageSize, "", "CreatedDate", "DESC");

            
            rptPortfolios.DataSource = paginatedPortfolios.Results;
            rptPortfolios.DataBind();


            lblPageInfo.Text = $"Página {paginatedPortfolios.Page} de {paginatedPortfolios.TotalPages}";
            btnPrevious.Enabled = paginatedPortfolios.Page > 1;
            btnNext.Enabled = paginatedPortfolios.Page < paginatedPortfolios.TotalPages;
        }
        protected void ChangePage(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            CurrentPage += btn.CommandArgument == "Next" ? 1 : -1;
            LoadPortfolios();
        }

        protected void rptPortfolios_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewCatalog")
            {
                string portfolioID = e.CommandArgument.ToString();
                // Redirigir a la página de visualización del catálogo con el ID correspondiente
                Response.Redirect("viewPortfolio.aspx?portfolioID=" + portfolioID);
            }
        }
    }
}