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
    public partial class registerAdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Error messages are hidden at first
            adminUsernameErrMsgLbl.Visible = false;
            adminFirstNameErrMsgLbl.Visible = false;
            adminLastNameErrMsgLbl.Visible = false;
            adminEmailErrMsgLbl.Visible = false;
            adminPasswordErrMsgLbl.Visible = false;
            adminRPasswordErrMsgLbl.Visible = false;
            generalErrorMsg.Visible = false;
            debugMessage("Hello World!");

        }
        protected void debugMessage(string debugmsg)
        {
            System.Diagnostics.Debug.WriteLine(debugmsg);
        }

        protected void showErrorMessage(Label lbl, string message = "Ambiguous error")
        {
            lbl.Visible = true;
            lbl.Text = message;
        }

        protected void hideErrorMessage(Label lbl)
        {
            lbl.Visible = false;
            lbl.Text = "";
        }


        protected void adminRegisterBtn_Click(object sender, EventArgs e)
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
                    createCMD.Parameters.AddWithValue("@password", adminUsernameTxtBx.Text.Trim());
                    createCMD.Parameters.AddWithValue("@firstname", adminUsernameTxtBx.Text.Trim());
                    createCMD.Parameters.AddWithValue("@lastname", adminUsernameTxtBx.Text.Trim());
                    createCMD.Parameters.AddWithValue("@usertype", "ADMIN");
                    createCMD.Parameters.AddWithValue("@emailaddress", adminUsernameTxtBx.Text.Trim());
                    createCMD.ExecuteNonQuery();
                    Response.Redirect("signInPage.aspx");
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                generalErrorMsg.Visible = true;
                generalErrorMsg.ForeColor = System.Drawing.Color.Red;
                generalErrorMsg.Text = "Registration was not successful! Error: " + ex.ToString();
            }
        }

    }
}