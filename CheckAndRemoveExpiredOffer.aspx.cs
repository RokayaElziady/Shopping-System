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
    public partial class CheckAndRemoveExpiredOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void check_expired_offer(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("checkandremoveExpiredoffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string offerid = txt_offerid.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@offerid", offerid));

            //Save the output from the procedure
            SqlParameter output = cmd.Parameters.Add("@output", SqlDbType.Int);
            output.Direction = ParameterDirection.Output;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            //Executing the SQLCommand
            if (output.Value.ToString().Equals("0"))
                Response.Write("the offer is not expired");
            else
            {
                Response.Write("the offer is not expired");

            }
        }
    }
    }
