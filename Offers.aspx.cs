using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace finalmilestone3
{
    public partial class Offers : System.Web.UI.Page
    {
        protected void add_offers(object sender, EventArgs e)
        {
            Response.Redirect("AddOffer.aspx", true);
        }
        protected void P_PRODUCT(object sender, EventArgs e)
        {
            Response.Redirect("PostProduct.aspx", true);
        }
        protected void V_PRODUCT(object sender, EventArgs e)
        {
            Response.Redirect("ViewProducts.aspx", true);
        }
        protected void E_PRODUCT(object sender, EventArgs e)
        {
            Response.Redirect("EditProduct.aspx", true);
        }

        protected void apply_offers(object sender, EventArgs e)
        {
            Response.Redirect("ApplyOffer.aspx", true);
        }

        protected void remove_offers(object sender, EventArgs e)
        {
            Response.Redirect("CheckAndRemoveExpiredOffer.aspx", true);
        }
    }
}