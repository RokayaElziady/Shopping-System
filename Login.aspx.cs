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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
                protected void login(object sender, EventArgs e)
                {

                    try
                    {

                        //string x = TextBox1.Text;
                        //Session["username"] = "ahmed.ashraf";
                        //Get the information of the connection to the database
                        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                        //create a new connection
                        SqlConnection conn = new SqlConnection(connStr);

                        /*create a new SQL command which takes as parameters the name of the stored procedure and
                         the SQLconnection name*/
                        SqlCommand cmd = new SqlCommand("userLogin", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        string username = TextBox1.Text;
                        Session["username"] = username;
                        string password = TextBox2.Text;



                        //pass parameters to the stored procedure
                        cmd.Parameters.Add(new SqlParameter("@username", username));

                        cmd.Parameters.Add(new SqlParameter("@password", password));


                        //Save the output from the procedure
                        SqlParameter count2 = cmd.Parameters.Add("@type", SqlDbType.Int);
                        count2.Direction = ParameterDirection.Output;

                        SqlParameter count = cmd.Parameters.Add("@Success", SqlDbType.Int);
                        count.Direction = ParameterDirection.Output;

                        SqlParameter check = cmd.Parameters.Add("@checkV", SqlDbType.Bit);
                        check.Direction = ParameterDirection.Output;

                        // Response.Write(count);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        if (count.Value.ToString().Equals("1"))
                        {

                            if (count2.Value.ToString().Equals("0"))
                            {
                                Session["username"] = username;
                                Response.Redirect("MainPage.aspx", true);




                            }
                            if (count2.Value.ToString().Equals("1") && check.Value.ToString().Equals("True"))
                            {
                                Session["username"] = username;
                                Response.Redirect("Offers.aspx", true);



                            }
                            if (count2.Value.ToString().Equals("1") && check.Value.ToString().Equals("False"))
                            {
                                Response.Write("This vendor has not been activated yet.");



                            }


                            if (count2.Value.ToString().Equals("2"))
                            {
                                Session["username"] = username;
                                Response.Redirect("Admin.aspx", true);

                            }
                        }
                        else
                        {

                            Response.Write("Failed To Login,Maybe Wrong Password Or You Don't Have An Account");
                        }



                        //   Response.Redirect("mainpage.aspx", true);



                    }
         
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }

        }
    }
}