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
    public partial class VendorRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void vendregister(object sender, EventArgs e)
        {
            try { 
            // Session["username"] = "ahmed.ashraf";
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("vendorRegister", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string username = TextBox1.Text;
            //Session["username"] = username;
            string first_name = TextBox2.Text;
            string last_name = TextBox3.Text;
            string password = TextBox4.Text;
            string email = TextBox5.Text;
            string compname = TextBox6.Text;
            string bankacc = TextBox7.Text;



            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@first_name", first_name));
            cmd.Parameters.Add(new SqlParameter("@last_name", last_name));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@company_name", compname));
            cmd.Parameters.Add(new SqlParameter("@bank_acc_no", bankacc));
            SqlParameter success = cmd.Parameters.Add("@Success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;


            conn.Open();
            cmd.ExecuteNonQuery();
             conn.Close();
             
            if (success.Value.ToString().Equals("1"))
            {
                Response.Write("YOU ARE ALREADY REGISTERED!JUST LOGIN");

                //Response.Redirect("mainpage.aspx", true);

            }
            else
            {
                Response.Redirect("Login.aspx", true);
            }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
