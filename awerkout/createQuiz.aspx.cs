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
    public partial class createQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            QuestionErrMsg.Visible = false;
            Option1ErrMsg.Visible = false;
            Option2ErrMsg.Visible = false;
            Option3ErrMsg.Visible = false;
            Option4ErrMsg.Visible = false;
            AnswerErrMsg.Visible = false;
            generalErrorMsg.Visible = false;

            if (Session["username"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
            {
                // Do nothing
            }
            else
            {
                Response.Redirect("signInPage.aspx");
            }
        }

        protected void CreateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();

                string createQuery = "insert into quizData1 (question, " +
                        "option1, " +
                        "option2, " +
                        "option3, " +
                        "option4, " +
                        "answer ) values (@question," +
                        "@option1, " +
                        "@option2, " +
                        "@option3, " +
                        "@option4, " +
                        "@answer )";
                SqlCommand createCMD = new SqlCommand(createQuery, conn);

                createCMD.Parameters.AddWithValue("@question", questionTxtBx.Text.Trim());
                createCMD.Parameters.AddWithValue("@option1", option1TxtBx.Text.Trim());
                createCMD.Parameters.AddWithValue("@option2", option2TxtBx.Text.Trim());
                createCMD.Parameters.AddWithValue("@option3", option3TxtBx.Text.Trim());
                createCMD.Parameters.AddWithValue("@option4", option4TxtBx.Text.Trim());
                createCMD.Parameters.AddWithValue("@answer", AnswerDropDown.Text.Trim());
                createCMD.ExecuteNonQuery();

                conn.Close();
            }
            catch (Exception ex)
            {
                generalErrorMsg.Visible = true;
                generalErrorMsg.ForeColor = System.Drawing.Color.Red;
                generalErrorMsg.Text = "Quiz was not created successful!" + ex.ToString();
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