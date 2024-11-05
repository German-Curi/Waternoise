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
    public partial class createportfolio : System.Web.UI.Page
    {
        public static Portfolio catalogo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                catalogo = new Portfolio();
                catalogo.Content = new List<Product>();
                GridViewProductos.DataSource = catalogo.Content;
                GridViewProductos.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    Product producto = new Product();
                    producto.Name = txtNombreProducto.Text;
                    producto.ProblemType = txtTipoProblematica.Text;
                    producto.TechnicalFeatures = txtCaracteristicasTecnicas.Text;
                    producto.Currency = ddlMoneda.SelectedValue;
                    producto.Price = double.Parse(txtPrecio.Text);
                    producto.WarrantyPeriod = txtPeriodoGarantia.Text;


                    catalogo.Content.Add(producto);
                    GridViewProductos.DataSource = catalogo.Content;
                    GridViewProductos.DataBind();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void GuardarCatalogo_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    PortfolioBLL catalogoBLL = new PortfolioBLL();
                    Portfolio catalogoAUX = new Portfolio();

                    catalogo.Title = txtTitulo.Text;
                    catalogo.Description = txtDescripcion.Text;
                    catalogoAUX = catalogoBLL.CreatePortfolio(catalogo, Session["UserID"].ToString());
                    

                    foreach (Product p in catalogo.Content)
                    {
                        p.PortfolioID = catalogoAUX.ID;
                        p.CompanyID = 1; // se tiene q poner el de la compania falta
                        catalogoBLL.CreateProduct(p, Session["UserID"].ToString());
                    }
                    hdnMostrarModal.Value = "true";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void GridViewProductos_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            if (index >= 0 && index < catalogo.Content.Count)
            {
                catalogo.Content.RemoveAt(index);
                GridViewProductos.DataSource = catalogo.Content;
                GridViewProductos.DataBind();
            }
        }
    }
}