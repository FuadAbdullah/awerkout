using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout
{
    public partial class signInPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            generalErrorMsg.Visible = false;
        }

        protected void signInBtn_Click(object sender, EventArgs e)
        {
            try
            {
                // Required to connect to the database
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();
                // --

                // Check if the username and password entry exist in the db
                string query = "select count(*) from userData where username = '"
                    + usernameTxtBx.Text
                    + "' and password = '"
                    + passwordTxtBx.Text
                    + "' and accstatus = 'A'";
                SqlCommand cmd = new SqlCommand(query, conn);
                int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                // If the database do have the record (> 0 record(s)), then username and password is correct
                if (check > 0)
                {

                    // Fetch the first name and the user type
                    string fetchUser = "select firstname, usertype, username, userID from userData where username = '"
                    + usernameTxtBx.Text
                    + "' and password = '"
                    + passwordTxtBx.Text
                    + "'";

                    SqlCommand cmdFetch = new SqlCommand(fetchUser, conn);
                    SqlDataReader fetchResult = cmdFetch.ExecuteReader();

                    // Placeholder to store the usertype and first name
                    string type = "";
                    string firstname = "";
                    string username = "";
                    string userID = "";

                    // Will loop as long as Read is true, could indicate existence of multiple records
                    // Loop will override with the last record in case there indeed are multiple records
                    while (fetchResult.Read())
                    {
                        type = fetchResult["usertype"].ToString().Trim();
                        firstname = fetchResult["firstname"].ToString().Trim();
                        username = fetchResult["username"].ToString().Trim();
                        userID = fetchResult["userID"].ToString().Trim();
                    }

                    // Storing the first name and usertype
                    Session["firstname"] = firstname;
                    Session["usertype"] = type;
                    Session["username"] = username;
                    Session["userID"] = userID;

                    // Redirect admin to adminDashboard.aspx
                    if (type == "ADMIN")
                    {
                        Response.Redirect("adminDashboard.aspx");
                    }
                    // Redirect member to memberDashboard.aspx
                    else if (type == "USER")
                    {
                        Response.Redirect("userDashboard.aspx");
                    }

                }
                else // No record fetched meaning no matching username and password were found in the db
                {
                    generalErrorMsg.Visible = true;
                    generalErrorMsg.ForeColor = System.Drawing.Color.Red;
                    generalErrorMsg.Text = "Incorrect username or password!";
                }

                // Must close connection once opened
                conn.Close();
            }
            catch (Exception ex)
            {
                generalErrorMsg.Visible = true;
                generalErrorMsg.ForeColor = System.Drawing.Color.Red;
                generalErrorMsg.Text = "Error: " + ex.ToString();
            }
        }

        protected void registerUserlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("registerUserPage.aspx");
        }
    }
}