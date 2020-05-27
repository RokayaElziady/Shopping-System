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
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Session["username"] = "ahmed.ashraf";
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("ShowProductsbyPrice", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                //IF the output is a table, then we can read the records one at a time
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (rdr.Read())
                {

                    //Get the value of the attribute name in the Company table
                    string name = rdr.GetString(rdr.GetOrdinal("product_name"));
                    //int serial=rdr.GetInt32(rdr.GetOrdinal("serial_no"));
                    //Get the value of the attribute field in the Company table
                    string description = rdr.GetString(rdr.GetOrdinal("product_description"));
                    decimal price = rdr.GetDecimal(rdr.GetOrdinal("price"));
                    string color = rdr.GetString(rdr.GetOrdinal("color"));
                    decimal final_price = rdr.GetDecimal(rdr.GetOrdinal("final_price"));

                    //Create a new label and add it to the HTML form
                    Label lbl_CompanyName = new Label();
                    lbl_CompanyName.Text = "product_name: " + name + " product_description:" + description + " price: " + price + " final_price: " + final_price + " color: " + color + "  <br /> <br />";
                    form1.Controls.Add(lbl_CompanyName);

                }
            }

            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }

        }

    protected void viewcart(object sender, EventArgs e)
        {
            Response.Redirect("MyCart.aspx", true);

        }
        protected void add(object sender, EventArgs e)
        {
            Response.Redirect("AddCreditCard.aspx", true);

        }
        protected void create(object sender, EventArgs e)
        {
            Response.Redirect("CreateWishlist.aspx", true);

        }
        protected void viewwishlist(object sender, EventArgs e)
        {
            Response.Redirect("ViewWishlist.aspx", true);

        }
        protected void addmobile(object sender, EventArgs e)
        {
            Response.Redirect("AddMobile.aspx", true);

        }
    }
}