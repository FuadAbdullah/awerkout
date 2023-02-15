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
    public partial class registerUserPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             //Error messages are hidden at first
            userUsernameErrMsgLbl.Visible = false;
            generalErrorMsg.Visible = false;
            debugMessage("Hello World!");

            // If the user had already logged in
            if (Session["username"] != null)
            {
                if (Session["usertype"].ToString() == "ADMIN")
                    Response.Redirect("adminDashboard.aspx");
                else
                    Response.Redirect("userDashboard.aspx");

            }
        }

        protected void debugMessage(string debugmsg)
        {
            System.Diagnostics.Debug.WriteLine(debugmsg);
        }

        protected void showErrorMessage(Label lbl, string message = "Ambiguous error") {
            lbl.Visible = true;
            lbl.Text = message;
        }

        protected void hideErrorMessage(Label lbl)
        {
            lbl.Visible = false;
            lbl.Text = "";
        }

        protected void userRegisterBtn_Click(object sender, EventArgs e)
        {
            if (Regex.IsMatch(userUsernameTxtBx.Text.Trim(), "['\";]+") ||
                Regex.IsMatch(userPasswordTxtBx.Text.Trim(), "['\";]+") ||
                Regex.IsMatch(userFirstNameTxtBx.Text.Trim(), "['\";]+") ||
                Regex.IsMatch(userLastNameTxtBx.Text.Trim(), "['\";]+") ||
                Regex.IsMatch(userEmailTxtBx.Text.Trim(), "['\";]+"))
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

                    string query = "select count(*) from userData where username = '" + userUsernameTxtBx.Text + "'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                    if (check > 0)
                    {
                        userUsernameErrMsgLbl.Visible = true;
                        userUsernameErrMsgLbl.ForeColor = System.Drawing.Color.Red;
                        userUsernameErrMsgLbl.Text = "Username has been taken!";
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

                        createCMD.Parameters.AddWithValue("@username", userUsernameTxtBx.Text.Trim());
                        createCMD.Parameters.AddWithValue("@password", userPasswordTxtBx.Text.Trim());
                        createCMD.Parameters.AddWithValue("@firstname", userFirstNameTxtBx.Text.Trim());
                        createCMD.Parameters.AddWithValue("@lastname", userLastNameTxtBx.Text.Trim());
                        createCMD.Parameters.AddWithValue("@usertype", "USER");
                        createCMD.Parameters.AddWithValue("@emailaddress", userEmailTxtBx.Text.Trim());
                        createCMD.ExecuteNonQuery();
                        Response.Redirect("signInPage.aspx");
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

        protected void SignInlnk_Click(object sender, EventArgs e)
        {

            Response.Redirect("signInPage.aspx");
        }

        protected void PasswordFormat(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length < 8)
                args.IsValid = false;
            else
                args.IsValid = true;

        }
    }
}