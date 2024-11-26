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
    public partial class Subscription_Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SubscriptionBLL subscriptionBLL = new SubscriptionBLL();
            List<Subscription> subscriptions = subscriptionBLL.GetAll();
            
            gvSubscriptions.DataSource = subscriptions;
            gvSubscriptions.DataBind();
        }
    }
}