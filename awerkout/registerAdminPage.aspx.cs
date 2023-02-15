using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace awerkout
{
    public partial class registerAdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Error messages are hidden at first
            adminUsernameErrMsgLbl.Visible = false;
            generalErrorMsg.Visible = false;
            adminRegistrationStatusLbl.Visible = false;
            commonFunction.debugMessage("Hello World!");

            if (Session["username"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
            {
                // Do nothing
            }
            else
            {
                Response.Redirect("signInPage.aspx");
            }

            if (!Page.IsPostBack) { 
                if (Request.QueryString["registerSuccessful"] != null)
                {
                    showNotificationMessage(adminRegistrationStatusLbl, "Account has been created successfully!");
                }
            }
        }

        protected void adminRegisterBtn_Click(object sender, EventArgs e)
        { 
            if (Regex.IsMatch(adminUsernameTxtBx.Text.Trim(), "['\";]+") ||
               Regex.IsMatch(adminPasswordTxtBx.Text.Trim(), "['\";]+") ||
               Regex.IsMatch(adminFirstNameTxtBx.Text.Trim(), "['\";]+") ||
               Regex.IsMatch(adminLastNameTxtBx.Text.Trim(), "['\";]+") ||
               Regex.IsMatch(adminEmailTxtBx.Text.Trim(), "['\";]+"))
            {
                generalErrorMsg.Visible = true;
                generalErrorMsg.Text = "Special Characters are not allowed";
            }
            else
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                    conn.Open();

                    string query = "select count(*) from userData where username = '" + adminUsernameTxtBx.Text + "'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                    if (check > 0)
                    {
                        adminUsernameErrMsgLbl.Visible = true;
                        adminUsernameErrMsgLbl.ForeColor = System.Drawing.Color.Red;
                        adminUsernameErrMsgLbl.Text = "Username has been taken!";
                    }
                    else
                    {
                        // Creating the record in the table called userData
                        string createQuery = "insert into userData (username, " +
                            "password, " +
                            "firstname, " +
                            "lastname, " +
                            "usertype, " +
                            "emailaddress ) values (@username," +
                            "@password, " +
                            "@firstname, " +
                            "@lastname, " +
                            "@usertype, " +
                            "@emailaddress )";
                        SqlCommand createCMD = new SqlCommand(createQuery, conn);

                        createCMD.Parameters.AddWithValue("@username", adminUsernameTxtBx.Text.Trim());
                        createCMD.Parameters.AddWithValue("@password", adminPasswordTxtBx.Text.Trim());
                        createCMD.Parameters.AddWithValue("@firstname", adminFirstNameTxtBx.Text.Trim());
                        createCMD.Parameters.AddWithValue("@lastname", adminLastNameTxtBx.Text.Trim());
                        createCMD.Parameters.AddWithValue("@usertype", "ADMIN");
                        createCMD.Parameters.AddWithValue("@emailaddress", adminEmailTxtBx.Text.Trim());
                        createCMD.ExecuteNonQuery();


                        string registerSuccessful = "true";
                        Response.Redirect(String.Format("registerAdminPage.aspx?registerSuccessful={0}", registerSuccessful));
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    generalErrorMsg.Visible = true;
                    generalErrorMsg.ForeColor = System.Drawing.Color.Red;
                    generalErrorMsg.Text = "Registration was not successful!" + ex.ToString();
                }
            }
        }

        protected void hideNotificationMessage(Label lbl)
        {
            lbl.Visible = false;
            lbl.Text = "";
        }

        protected void showNotificationMessage(Label lbl, string message = "Hello World!")
        {
            lbl.Visible = true;
            lbl.Text = message;
        }

        protected void myDashboardlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminDashboard.aspx");
        }

        protected void signOutlnk_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Request.Cookies.Clear();

            Response.Redirect("signInPage.aspx");

        }

        protected void SignInlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("signInPage.aspx");
        }

        protected void AdminPasswordFormat(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length < 8)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
    }


}