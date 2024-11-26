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
    public partial class viewPortfolio : System.Web.UI.Page
    {
        public static Portfolio catalogo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PortfolioBLL catalogoBLL = new PortfolioBLL();
                int portfolioIDParam = int.Parse(Request.QueryString["portfolioID"]);
                catalogo = catalogoBLL.GetPortfolioByID(portfolioIDParam);
                catalogo.Content = catalogoBLL.ProductsGetByPortfolioId(portfolioIDParam);
                txtTitulo.Text = catalogo.Title;
                txtDescripcion.Text = catalogo.Description;
                GridViewProductos.DataSource = catalogo.Content;
                GridViewProductos.DataBind();
            }
        }
    }
}