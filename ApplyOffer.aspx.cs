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
    public partial class ApplyOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void apply_offer(object sender, EventArgs e)
        {
            try
            {
                //Get the information of the connection to the database
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("applyOffer", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                //To read the input from the user
                string username = Session["username"].ToString();
                string offerid = txt_offerid.Text;
                string serial = txt_serial.Text;


                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@vendorname", username)); //hateegii men elsession bas ezaii??
                cmd.Parameters.Add(new SqlParameter(" @offerid", decimal.Parse(offerid)));
                cmd.Parameters.Add(new SqlParameter(" @priceserial", decimal.Parse(serial)));


                //Save the output from the procedure
                SqlParameter check = cmd.Parameters.Add("@output", SqlDbType.Int);
                check.Direction = ParameterDirection.Output;

                //Executing the SQLCommand
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();


                if (check.Value.ToString().Equals("0"))
                {
                    //To send response data to the client side (HTML)
                    Response.Write("offer applied");

                }
                else
                {
                    Response.Write("Failed to apply offer as there is an existing offer on product ");
                }
            }
           
            catch { Response.Write("incorrect insertion"); }



        }
    }
}