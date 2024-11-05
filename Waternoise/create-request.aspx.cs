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
    public partial class create_request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GuardarSolicitud_Click(object sender, EventArgs e)
        {
            try
            {

                if (Page.IsValid)
                {
                    RequestBLL requestBLL = new RequestBLL();  
                    Request newRequest = new Request
                    {
                        Status = RequestStatus.OPEN,
                        NameRequest = txtTituloSolicitud.Text.Trim(),
                        ProblemType = txtProblemType.Text.Trim(),
                        Description = txtDescription.Text,
                        TechnicalFeatures = txtTechnicalFeatures.Text.Trim(),
                        AffectedWater = ddlAffectedWater.SelectedValue,
                        Location = txtLocation.Text.Trim(),
                        Currency = ddlMoneda.SelectedValue,
                        MinPrice = Convert.ToDecimal(txtMinPrice.Text),
                        MaxPrice = Convert.ToDecimal(txtMaxPrice.Text),
                    };
                    requestBLL.Create(newRequest, Session["UserID"].ToString());
                    hdnMostrarModal.Value = "true";
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}