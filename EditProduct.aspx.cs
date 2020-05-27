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
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void edit_product(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("EditProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string username = Session["username"].ToString();
            int serial1 = Int32.Parse(txt_serial.Text);
            string productname1 = txt_productName.Text;
            string category = txt_category.Text;
            string pd = txt_description.Text;
            decimal price = decimal.Parse(txt_price.Text);
            string color = txt_color.Text;
            if (username == "" || productname1 == "" || category == "" | pd == "" || color == "")
            {
                Response.Write("invalid data insertion empty");
            }
            else
            {

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@vendorname", username)); //hateegii men elsession bas ezaii??
                cmd.Parameters.Add(new SqlParameter("@serialnumber", serial1));
                cmd.Parameters.Add(new SqlParameter("@product_name", productname1));
                cmd.Parameters.Add(new SqlParameter("@category", category));
                cmd.Parameters.Add(new SqlParameter("@product_description", pd));
                cmd.Parameters.Add(new SqlParameter("@price", price));
                cmd.Parameters.Add(new SqlParameter("@color", color));

                //Save the output from the procedure
                // SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);
                // count.Direction = ParameterDirection.Output;

                //Executing the SQLCommand
                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                    Response.Write("PRODUCT IS Edited");
                }
                catch (Exception ex)
                {
                    Response.Write("invalid information");
                }
            }

            conn.Close();




        }
    }
}