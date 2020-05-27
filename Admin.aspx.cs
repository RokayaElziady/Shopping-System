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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void activate(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("activateVendors", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user


            string vendor_username = vendorname.Text;
            if (vendor_username == String.Empty || vendor_username == null)
            {
                Response.Write("please write the vendor username");
            }
            else
            {



                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@admin_username", Session["username"]));
                cmd.Parameters.Add(new SqlParameter("@vendor_username", vendor_username));

                SqlParameter check = cmd.Parameters.Add("@check", SqlDbType.Int);
                check.Direction = ParameterDirection.Output;
                SqlParameter check2 = cmd.Parameters.Add("@checkactivated", SqlDbType.Int);
                check2.Direction = ParameterDirection.Output;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                if (check.Value.ToString().Equals("1") && (check2.Value.ToString().Equals("0")))
                {
                    Response.Write("successfully");
                }
                if ((check.Value.ToString().Equals("0")))
                {
                    Response.Write("the vendor username is not found");
                }

                if ((check2.Value.ToString().Equals("1")))
                    Response.Write("This vendor is already activated");

            }

        }



        protected void review(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("reviewOrders", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            DataTable x = new DataTable();
            using (SqlDataAdapter c = new SqlDataAdapter(cmd))
            {
                c.Fill(x);

            }
            this.Table.Visible = true;
            this.Table.DataSource = x;
            Table.DataBind();



        }

        protected void Createtodaysdeal(object sender, EventArgs e)
        {


            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("createTodaysDeal", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user

            string DealAmount = dealamount.Text;
            string ExpiryDate = expirydate.Text;
            if (DealAmount == String.Empty || DealAmount == null || ExpiryDate == String.Empty || ExpiryDate == null)
            {
                Response.Write("please fill all the information");
            }
            else
            {

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@admin_username", Session["username"]));
                cmd.Parameters.Add(new SqlParameter("@deal_amount", DealAmount));
                cmd.Parameters.Add(new SqlParameter("@expiry_date", ExpiryDate));

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("successfull");
                }
                catch (SqlException e1)
                {

                    Response.Write("please write the correct type or date format");
                }
            }

        }

        protected void addtodaysdealonproduct(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("addTodaysDealOnProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string DEALID = dealid.Text;
            string SERIALNO = serialno.Text;
            if (SERIALNO == String.Empty || SERIALNO == null || DEALID == String.Empty || DEALID == null)
                Response.Write("please fill all the information");

            else
            {


                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@deal_id", DEALID));
                cmd.Parameters.Add(new SqlParameter("@serial_no", SERIALNO));
                SqlParameter check = cmd.Parameters.Add("@checkdeal", SqlDbType.Int);
                check.Direction = ParameterDirection.Output;
                SqlParameter check2 = cmd.Parameters.Add("@checkifdealfound", SqlDbType.Int);
                check2.Direction = ParameterDirection.Output;
                SqlParameter check3 = cmd.Parameters.Add("@checkserialfound", SqlDbType.Int);
                check3.Direction = ParameterDirection.Output;




                try
                {
                    conn.Open();

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    //       Response.Write("successfull");


                    if (check.Value.ToString().Equals("1") && check2.Value.ToString().Equals("1"))
                    {
                        Response.Write("You can not insert more than one deal on one product");
                    }
                    //if (check2.Value.ToString().Equals("0"))
                    //{
                    //    Response.Write("The deal id is not found");
                    //}

                    if (check.Value.ToString().Equals("0") && check2.Value.ToString().Equals("1") && check3.Value.ToString().Equals("1"))
                    {
                        Response.Write("successfull");
                    }



                    if (check2.Value.ToString().Equals("0"))
                    {
                        Response.Write("The deal id is not found");

                        //if(e2.Number == 2627)
                        //{
                        //    Response.Write("this record already exists");
                        //}
                    }


                    if (check3.Value.ToString().Equals("0"))
                    {
                        Response.Write("The serial number is not found");
                    }



                }




                catch (SqlException e1)
                {
                    Response.Write("please write the correct type of deal id or serial number");




                }


            }
        }
        protected void removeexpireddeal(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("removeExpiredDeal", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string DEAL = Deal.Text;
            if (DEAL == String.Empty || DEAL == null)
                Response.Write("please fill all the information");


            else
            {
                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@deal_id", DEAL));
                SqlParameter check = cmd.Parameters.Add("@checkexpired", SqlDbType.Int);
                check.Direction = ParameterDirection.Output;
                SqlParameter check2 = cmd.Parameters.Add("@checkdate", SqlDbType.Int);
                check2.Direction = ParameterDirection.Output;
                // Response.Write("The expired deal is removed");
                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (check.Value.ToString().Equals("1") && check2.Value.ToString().Equals("1"))
                    {
                        Response.Write("successfully");
                    }


                    if (check.Value.ToString().Equals("0"))
                    {
                        Response.Write("the deal id is not found");
                    }
                    if (check2.Value.ToString().Equals("0") && check.Value.ToString().Equals("1"))
                    {
                        Response.Write("This deal is not expired");
                    }


                }

                catch (SqlException e1)
                {
                    Response.Write("please write the correct number");
                }
            }
        }
        protected void updatingstatus(object sender, EventArgs e)
        {
            //Get the information of the connection to the database
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("updateOrderStatusInProcess", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string order_no = ordernumber.Text;

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@order_no", order_no));
            //  Response.Write("order status is updated successfully");
            SqlParameter check2 = cmd.Parameters.Add("@checkorder", SqlDbType.Int);
            check2.Direction = ParameterDirection.Output;
            SqlParameter check3 = cmd.Parameters.Add("@checkupdated", SqlDbType.Int);
            check3.Direction = ParameterDirection.Output;
            if (order_no == String.Empty || order_no == null)
            {
                Response.Write("please fill all the information");
            }
            else
            {
                try
                {
                    conn.Open();

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (check2.Value.ToString().Equals("1") && check3.Value.ToString().Equals("0"))
                    {
                        Response.Write("successfully");
                    }
                    if ((check2.Value.ToString().Equals("0")))
                    {
                        Response.Write("the order no is not found");
                    }


                    if ((check3.Value.ToString().Equals("1")))
                    {
                        Response.Write("this order status is already in process");
                    }
                }

                catch (SqlException e1)
                {
                    Response.Write("please write correct type");
                }

            }

        }
    }
}