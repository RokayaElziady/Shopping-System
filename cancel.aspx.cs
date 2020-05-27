using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//sdfghjk
namespace finalmilestone3
{
    public partial class cancel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cancelO(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            int cashtest;
            if (int.TryParse(cancel_txt.Text, out cashtest))
            {


                SqlCommand cmd = new SqlCommand("cancelOrder", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                int id = Int32.Parse(cancel_txt.Text);
                string user = Session["username"].ToString();
                cmd.Parameters.Add(new SqlParameter("@orderid", id));
                cmd.Parameters.Add(new SqlParameter("@customername", user));
                SqlParameter check = cmd.Parameters.Add("@check", SqlDbType.Int);
                check.Direction = ParameterDirection.Output;

                SqlParameter status = cmd.Parameters.Add("@status", SqlDbType.VarChar, 20);
                status.Direction = ParameterDirection.Output;

                SqlParameter points = cmd.Parameters.Add("@points", SqlDbType.Int);
                points.Direction = ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                if (check.Value.ToString().Equals("1"))
                    Response.Write("Order cancelled successfully" +
                        "Points remaining= " + points.Value.ToString());
                else if (check.Value.ToString().Equals("0"))
                    Response.Write("You have never made this order.Please enter correct order ID");
                else if (status.Value.Equals("out for delivery") | status.Value.Equals("delivered"))
                    Response.Write("Cannot cancel an order that has status " + status.Value.ToString());
            }
            else
            {
                Response.Write("Please enter only numbers");
            }

        }

        protected void returnCart(object sender, EventArgs e)
        {
            Response.Redirect("MyCart.aspx", true);
        }
    }
}