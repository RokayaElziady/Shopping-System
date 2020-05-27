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
    public partial class AddToWishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx", true);
            }
            if (Session["wishlist"] == null)
            {
                Response.Redirect("ViewWishlist.aspx", true);
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
            SqlCommand cmd = new SqlCommand("AddtoWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //string username = Session["username"].ToString();
            string username = Session["username"].ToString();
          string wishlist_name = Session["wishlist"].ToString();
            //string wishlist_name = "rokaya";
            string serial_no = TextBox1.Text;

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@serial", serial_no));
            cmd.Parameters.Add(new SqlParameter("@name", wishlist_name));


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

                    Response.Write("THIS PRODUCT ALREADY EXISTS IN YOUR WISHLIST!!");
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
