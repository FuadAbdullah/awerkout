using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            QuestionErrMsg.Visible = false;
            Option1ErrMsg.Visible = false;
            Option2ErrMsg.Visible = false;
            Option3ErrMsg.Visible = false;
            Option4ErrMsg.Visible = false;
            AnswerErrMsg.Visible = false;

            if (Session["username"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
            {
                greetLbl.Text = "Hello there, Admin " + Session["username"] + "!";
            }
            else
            {
                Response.Redirect("signInPage.aspx");
            }
        }

        protected void signOutlnk_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            Request.Cookies.Clear();

            Response.Redirect("signInPage.aspx");
        }

        protected void myProfilelnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("userProfile.aspx");
        }

        protected void manageUserlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageUsers.aspx");
        }

        protected void adminCreateAdminAcclnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("registerAdminPage.aspx");
        }

        protected void adminCreateContentlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("createContent.aspx");
        }

        protected void CreateQuizBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("createQuiz.aspx");
        }

        protected void QuestionDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("select * from quizData1 fetch first 1 rows only", con);


            DataTable dt = new DataTable();
            da.Fill(dt);

            option1TxtBx.Text = dt.Rows[0][2].ToString();
            option2TxtBx.Text = dt.Rows[0][3].ToString();
            option3TxtBx.Text = dt.Rows[0][4].ToString();
            option4TxtBx.Text = dt.Rows[0][5].ToString();
            AnswerDropDown.Text = dt.Rows[0][6].ToString();


        }
    }
}