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
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx", true);
            }
        }

        protected void add(object sender, EventArgs e)
        {
            try { 
            //Session["username"] = "ahmed.ashraf";
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("addToCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //string username = Session["username"].ToString();
            string username = Session["username"].ToString();
            string serial_no = TextBox2.Text;

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@serial", serial_no));

            SqlParameter success = cmd.Parameters.Add("@Success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            SqlParameter prodexist = cmd.Parameters.Add("@prodexist", SqlDbType.Int);
            prodexist.Direction = ParameterDirection.Output;
            SqlParameter check = cmd.Parameters.Add("@check", SqlDbType.Int);
            check.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString().Equals("0") && prodexist.Value.ToString().Equals("1") & check.Value.ToString().Equals("1"))
            {
                Response.Write("SUCCESSFULLY ADED!");

                //Response.Redirect("mainpage.aspx", true);

            }
            else
            {
                if (success.Value.ToString().Equals("1"))
                {

                    Response.Write("THIS PRODUCT ALREADY EXISTS IN YOUR CART!!");
                }
                else
                {
                    if (prodexist.Value.ToString().Equals("0"))
                    {
                        Response.Write("NO SUCH PRODUCT EXIST !!");
                    }
                    else
                    {
                        if (check.Value.ToString().Equals("0"))
                        {
                            Response.Write("SORRY THIS PRODUCT IS NOT AVAILABLE RIGHT NOW!!");
                        }

                    }
                }
            }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }



        }
    }
}
