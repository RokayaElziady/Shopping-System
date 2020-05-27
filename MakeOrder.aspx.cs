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
    public partial class MakeOrder : System.Web.UI.Page
    {
        static int idTest;
        static string check2;
        static int flagCa = 0;
        static int flagCr = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("makeOrder", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //string username = Session["sender"].ToString();
            string username = Session["username"].ToString();

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", username));

            SqlParameter check = cmd.Parameters.Add("@check", SqlDbType.Int);
            check.Direction = ParameterDirection.Output;

            SqlParameter sum = cmd.Parameters.Add("@sum", SqlDbType.Decimal);
            sum.Direction = ParameterDirection.Output;
            cmd.Parameters["@sum"].Precision = 10;
            cmd.Parameters["@sum"].Scale = 2;
            SqlParameter id = cmd.Parameters.Add("@ID", SqlDbType.Int);
            id.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            check2 = check.Value.ToString();
            if (check.Value.ToString().Equals("1"))
            {
                Session["id"] = id.Value.ToString();
                // Response.Write("Order Made Successfully");
                Response.Write("     Order ID: " + id.Value.ToString());
                Response.Write("     Total Amount: " + sum.Value.ToString());
            }
            else if (check.Value.ToString().Equals("0"))
            {
                Response.Write("Cart is empty.Add a product to your cart to make an order");
                btn_cash.Visible = false;
            }

        }

        protected void pay(object sender, EventArgs e)
        {

            Response.Redirect("choose.aspx", true);
        }


    }
}