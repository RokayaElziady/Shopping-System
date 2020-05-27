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
    public partial class credit2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void creditPay(object sender, EventArgs e)
        {

            string Name = Session["id"].ToString();
            int id = Int32.Parse(Name);
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            decimal credittest;
            if (decimal.TryParse(credit_amount.Text, out credittest))
            {
                decimal credit = Convert.ToDecimal(credit_amount.Text);

                SqlCommand cmd = new SqlCommand("SpecifyAmount", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                string username = Session["username"].ToString();


                decimal cash = 0;
                cmd.Parameters.Add(new SqlParameter("@customername", username));
                cmd.Parameters.Add(new SqlParameter("@cash", cash));
                cmd.Parameters.Add(new SqlParameter("@credit", credit));
                cmd.Parameters.Add(new SqlParameter("@orderID", id));
                SqlParameter points = cmd.Parameters.Add("@remaining", SqlDbType.Int);
                points.Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("Payment successfully made     ");

                Response.Write("           Points Remaining=  " + points.Value.ToString());
            }
            else
            {
                Response.Write("Please enter numbers only");
            }
        }

        protected void returnCart(object sender, EventArgs e)
        {
            Response.Redirect("MyCart.aspx", true);
        }
    }
}