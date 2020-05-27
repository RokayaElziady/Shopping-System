using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalmilestone3
{
    public partial class credit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string username = "'" + Session["username"] + "'";
            string creditcards = "Select cc_number from Customer_CreditCard where customer_name=" + username;
            SqlCommand cmd = new SqlCommand(creditcards, conn);

            SqlDataReader reader = cmd.ExecuteReader();

            DropDownList1.DataSource = reader;
            DropDownList1.DataBind();

            cmd.Dispose();
            cmd.Clone();
            conn.Dispose();

        }
        protected void payC(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("ChooseCreditCard", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string creditcard = DropDownList1.SelectedItem.Text;

            int id = Int32.Parse(Session["id"].ToString());



            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@creditcard", creditcard));

            cmd.Parameters.Add(new SqlParameter("@orderid", id));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("credit2.aspx", true);

        }

        protected void returnCart(object sender, EventArgs e)
        {
            Response.Redirect("MyCart.aspx", true);
        }
    }
}