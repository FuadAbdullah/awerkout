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
    public partial class createQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //QuestionErrMsg.Visible = false;
            //Option1ErrMsg.Visible = false;
            //Option2ErrMsg.Visible = false;
            //Option3ErrMsg.Visible = false;
            //Option4ErrMsg.Visible = false;
            //AnswerErrMsg.Visible = false;
            generalErrorMsg.Visible = false;

            if (Session["username"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
            {
                // Only admin has access to this page
                // Do nothing
            }
            else
            {
                Response.Redirect("signInPage.aspx");
            }
        }

        protected void CreateBtn_Click(object sender, EventArgs e)
        {
            if (Regex.IsMatch(questionTxtBx.Text.Trim(), "['\";]+") ||
                Regex.IsMatch(option1TxtBx.Text.Trim(), "['\";]+") ||
                Regex.IsMatch(option2TxtBx.Text.Trim(), "['\";]+") ||
                Regex.IsMatch(option3TxtBx.Text.Trim(), "['\";]+") ||
                Regex.IsMatch(option4TxtBx.Text.Trim(), "['\";]+"))
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

                    string choices = option1TxtBx.Text.Trim() + ";" +
                        option2TxtBx.Text.Trim() + ";" +
                        option3TxtBx.Text.Trim() + ";" +
                        option4TxtBx.Text.Trim() + ";";

                    string encodedChoices = Server.HtmlEncode(choices);

                    string createQuery = "insert into quizData (question, " +
                            "userID, " +
                            "correctans, " +
                            "choices ) values (@question," +
                            "@userID, " +
                            "@correctans, " +
                            "@choices )";
                    SqlCommand createCMD = new SqlCommand(createQuery, conn);

                    createCMD.Parameters.AddWithValue("@question", questionTxtBx.Text.Trim());
                    createCMD.Parameters.AddWithValue("@userID", Session["userID"]);
                    createCMD.Parameters.AddWithValue("@correctans", AnswerDropDown.SelectedValue);
                    createCMD.Parameters.AddWithValue("@choices", encodedChoices);
                    createCMD.ExecuteNonQuery();

                    conn.Close();
                    Response.Redirect("createQuiz.aspx");
                }
                catch (Exception ex)
                {
                    generalErrorMsg.Visible = true;
                    generalErrorMsg.ForeColor = System.Drawing.Color.Red;
                    generalErrorMsg.Text = "Quiz was not created successful!" + ex.ToString();
                }
            }
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

    }
}