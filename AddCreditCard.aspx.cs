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
    public partial class AddCreditCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx",true);
            }
        }
        protected void add(object sender, EventArgs e)
        {
            try
            {
                //Session["username"] = "ahmed.ashraf";
                //Get the information of the connection to the database
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
                 the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("AddCreditCard", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //string username =(string) Session["username"];
                string username = Session["username"].ToString();
                string credit_card_no = TextBox1.Text;
                string cvv = TextBox2.Text;
                string expiry_date = TextBox3.Text;

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@customername", username));
                cmd.Parameters.Add(new SqlParameter("@creditcardnumber", credit_card_no));
                cmd.Parameters.Add(new SqlParameter("@cvv", cvv));
                cmd.Parameters.Add(new SqlParameter("@expirydate", expiry_date));

                SqlParameter success = cmd.Parameters.Add("@Success", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                if (success.Value.ToString().Equals("0"))
                {
                    Response.Write("SUCCESSFULLY ADED!");

                    //Response.Redirect("mainpage.aspx", true);

                }
                else
                {
                    Response.Write("THIS CREDIT CARD ALREADY EXISTS,CHECK NUMBER AGAIN!!");
                }
            }
            catch(SqlException ex)
            {
                Response.Write(ex.Message);
            }
            catch (Exception EX)
            {
                Response.Write("CHECK DATE FORMAT IT SHOULD BE MM/DD/YYYY");
            }
        }
    }
}