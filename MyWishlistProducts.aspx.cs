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
    public partial class MyWishlistProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("Login.aspx", true);
                }
                Response.Write(Session["wishlist"]);
                //   Session["username"] = "ahmed.ashraf";
                //Get the information of the connection to the database
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("showWishlistProduct", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                //To read the input from the user
                // string username = Session["username"].ToString();

                //Console.Write(Session["username"].ToString());
                string username = Session["username"].ToString();
                string wishlist_name = Session["wishlist"].ToString();
                // string wishlist_name = "fashion";

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@customername", username));
                cmd.Parameters.Add(new SqlParameter("@name", wishlist_name));

                SqlParameter success = cmd.Parameters.Add("@Success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;


                conn.Open();
                //IF the output is a table, then we can read the records one at a time
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (rdr.Read())
                {

                    //Get the value of the attribute name in the Company table
                    string name = rdr.GetString(rdr.GetOrdinal("product_name"));
                    //int serial=rdr.GetInt32(rdr.GetOrdinal("serial_no"));
                    //Get the value of the attribute field in the Company table
                    string description = rdr.GetString(rdr.GetOrdinal("product_description"));
                    decimal price = rdr.GetDecimal(rdr.GetOrdinal("price"));
                    string color = rdr.GetString(rdr.GetOrdinal("color"));
                    decimal final_price = rdr.GetDecimal(rdr.GetOrdinal("final_price"));

                    //Create a new label and add it to the HTML form
                    Label lbl_CompanyName = new Label();
                    lbl_CompanyName.Text = "product_name: " + name + " product_description:" + description + " price: " + price + " final_price: " + final_price + " color: " + color + "  <br /> <br />";
                    form1.Controls.Add(lbl_CompanyName);

                }

            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
        }
        protected void add(object sender, EventArgs e)

        {

            Response.Redirect("AddToWishlist.aspx", true);

        }
        protected void remove(object sender, EventArgs e)

        {

            Response.Redirect("RemoveFromWishlist.aspx", true);

        }
    }
}