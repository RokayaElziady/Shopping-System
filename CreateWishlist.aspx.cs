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
    public partial class CreateWishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx", true);
            }

        }


        protected void create(object sender, EventArgs e)
        {
            try { 
            // Session["username"] = "ahmed.ashraf";

            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("createWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //string username = Session["username"].ToString();
            string username = Session["username"].ToString();
            string wishlist_name = TextBox1.Text;

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@name", wishlist_name));

            SqlParameter success = cmd.Parameters.Add("@Success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString().Equals("0"))
            {
                Response.Write("SUCCESSFULLY CREATED!");

                //Response.Redirect("mainpage.aspx", true);

            }
            else
            {
                Response.Write("THIS WISHLIST ALREADY EXISTS,TRY ANOTHER NAME!!");
            }

            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}