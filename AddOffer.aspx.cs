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
    public partial class AddOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx", true);
            }
        }


        protected void add_offer(object sender, EventArgs e)
        {
            try
            {
                //Get the information of the connection to the database
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("addOffer", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                //To read the input from the user
                string offeramount = txt_offeramount.Text;
                string expirydate = txt_expirydate.Text;

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@offeramount", offeramount));
                cmd.Parameters.Add(new SqlParameter("@expiry_date", expirydate));

                //Save the output from the procedure
                // SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);
                // count.Direction = ParameterDirection.Output;

                //Executing the SQLCommand
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();


                Response.Write("offer is added");

            }
            catch (Exception ex)
            {
                Response.Write("please write date in correct format mm/dd/yyyy");
            }

            //if (count.Value.ToString().Equals("1"))
            //{
            //    //To send response data to the client side (HTML)
            //    Response.Write("Passed");

            //    /*ASP.NET session state enables you to store and retrieve values for a user
            //    as the user navigates ASP.NET pages in a Web application.
            //    This is how we store a value in the session*/
            //    Session["field1"] = "HIIII";

            //    //To navigate to another webpage
            //    Response.Redirect("Companies.aspx", true);

            //}
            //else
            //{
            //    Response.Write("Failed");
            //}


        }

        }
    }
