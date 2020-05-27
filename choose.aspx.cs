using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalmilestone3
{
    public partial class choose : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void payCash(object sender, EventArgs e)
        {
            Response.Redirect("cash.aspx", true);
        }

        protected void enterCredit(object sender, EventArgs e)
        {
            Response.Redirect("credit.aspx", true);
        }

        protected void returnCart(object sender, EventArgs e)
        {
            Response.Redirect("MyCart.aspx", true);
        }
    }

}