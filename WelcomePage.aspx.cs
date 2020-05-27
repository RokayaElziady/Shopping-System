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
    public partial class WelcomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cusregister(object sender, EventArgs e)
        {
            Response.Redirect("CustomerRegister.aspx", true);

        }
        protected void vendregister(object sender, EventArgs e)
        {
            Response.Redirect("VendorRegister.aspx", true);

        }
        protected void login(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", true);

        }
    }
}