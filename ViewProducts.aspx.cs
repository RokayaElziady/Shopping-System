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
    public partial class ViewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void view_product(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("vendorviewProducts", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string vendoName = Session["username"].ToString();


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@vendorname", vendoName));

            //Save the output from the procedure
            SqlParameter check = cmd.Parameters.Add("@check", SqlDbType.Int);
            check.Direction = ParameterDirection.Output;
            conn.Open();

            cmd.ExecuteNonQuery();
            conn.Close();
            //Executing the SQLCommand
            if (check.Value.ToString().Equals("0"))
            {
                Response.Write("you did not post a product yet");

                DataTable table = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(table);
                }
                this.XX.Visible = true;
                this.XX.DataSource = table;
                XX.DataBind();









            }
        }
    }
}