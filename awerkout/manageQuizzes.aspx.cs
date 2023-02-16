using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace awerkout
{
    public partial class manageQuizzes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            generalErrorMsg.Visible = false;
            //QuestionErrMsg.Visible = false;
            //Option1ErrMsg.Visible = false;
            //Option2ErrMsg.Visible = false;
            //Option3ErrMsg.Visible = false;
            //Option4ErrMsg.Visible = false;
            //AnswerErrMsg.Visible = false;

            if (Session["username"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
            {
                greetLbl.Text = "Hello there, Admin " + Session["username"] + "!";
            }
            else
            {
                Response.Redirect("signInPage.aspx");
            }

            if (!IsPostBack)
            {

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();

                string query = "select * from quizData where isDeleted='false'";
                SqlDataAdapter quizDataAdapter = new SqlDataAdapter(query, conn);
                DataTable quizDataTable = new DataTable();
                quizDataAdapter.Fill(quizDataTable);

                // Question ID initializer
                QuestionDropDown.DataSource = quizDataTable;
                QuestionDropDown.DataTextField = "quizID";
                QuestionDropDown.DataValueField = "quizID";
                QuestionDropDown.DataBind();

                conn.Close();

                string[] choice = quizDataTable.Rows[0][4].ToString().Trim().Split(';');

                TextBox[] optionTxtBx = new TextBox[4];

                optionTxtBx[0] = option1TxtBx;
                optionTxtBx[1] = option2TxtBx;
                optionTxtBx[2] = option3TxtBx;
                optionTxtBx[3] = option4TxtBx;

                QuestionTxtBx.Text = Server.HtmlDecode(quizDataTable.Rows[0][2].ToString().Trim());

                int i = 0;
                foreach (TextBox txtbx in optionTxtBx)
                {
                    commonFunction.debugMessage(Server.HtmlDecode(choice[i]));
                    txtbx.Text = Server.HtmlDecode(choice[i]);
                    i += 1;
                }

                // Option initializer
                ListItem[] optionList = new ListItem[4];
                ListItem option1 = new ListItem();
                ListItem option2 = new ListItem();
                ListItem option3 = new ListItem();
                ListItem option4 = new ListItem();

                option1.Text = "Option 1";
                option1.Value = 1.ToString();
                option2.Text = "Option 2";
                option2.Value = 2.ToString();
                option3.Text = "Option 3";
                option3.Value = 3.ToString();
                option4.Text = "Option 4";
                option4.Value = 4.ToString();

                optionList.SetValue(option1, 0);
                optionList.SetValue(option2, 1);
                optionList.SetValue(option3, 2);
                optionList.SetValue(option4, 3);
                AnswerDropDown.Items.Clear();
                AnswerDropDown.Items.AddRange(optionList);
                AnswerDropDown.SelectedIndex = 0;

                commonFunction.debugMessage(quizDataTable.Rows[0][3].ToString().Trim());

                AnswerDropDown.ClearSelection();
                // Trim is needed because apparently there is a whitespace somewhere
                AnswerDropDown.Items.FindByValue(quizDataTable.Rows[0][3].ToString().Trim()).Selected = true;

                string quizAuthorQuery = "select username from userData where userID='" + quizDataTable.Rows[0][1].ToString() + "'";
                SqlDataAdapter quizAuthorAdapter = new SqlDataAdapter(quizAuthorQuery, conn);
                DataTable quizAuthorDataTable = new DataTable();
                quizAuthorAdapter.Fill(quizAuthorDataTable);

                quizAuthorLbl.Text = "Created by Admin " + quizAuthorDataTable.Rows[0][0].ToString();
                quizCreationDateLbl.Text = "Created on " + quizDataTable.Rows[0][5].ToString();
                quizUpdateDateLbl.Text = "Updated on " + quizDataTable.Rows[0][6].ToString();


            }
        }


        protected void signOutlnk_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            Request.Cookies.Clear();

            Response.Redirect("signInPage.aspx");
        }

        protected void myDashboardlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminDashboard.aspx");
        }

        protected void CreateQuizBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("createQuiz.aspx");
        }

        protected void QuestionDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
            conn.Open();

            string query = "select * from quizData where quizID='" + QuestionDropDown.SelectedValue + "'";
            SqlDataAdapter quizDataAdapter = new SqlDataAdapter(query, conn);
            DataTable quizDataTable = new DataTable();
            quizDataAdapter.Fill(quizDataTable);

            string[] choice = quizDataTable.Rows[0][4].ToString().Trim().Split(';');

            TextBox[] optionTxtBx = new TextBox[4];

            optionTxtBx[0] = option1TxtBx;
            optionTxtBx[1] = option2TxtBx;
            optionTxtBx[2] = option3TxtBx;
            optionTxtBx[3] = option4TxtBx;

            QuestionTxtBx.Text = Server.HtmlDecode(quizDataTable.Rows[0][2].ToString().Trim());

            int i = 0;
            foreach (TextBox txtbx in optionTxtBx)
            {
                commonFunction.debugMessage(Server.HtmlDecode(choice[i]));
                txtbx.Text = Server.HtmlDecode(choice[i]);
                i += 1;
            }

            // Option initializer
            ListItem[] optionList = new ListItem[4];
            ListItem option1 = new ListItem();
            ListItem option2 = new ListItem();
            ListItem option3 = new ListItem();
            ListItem option4 = new ListItem();

            option1.Text = "Option 1";
            option1.Value = 1.ToString();
            option2.Text = "Option 2";
            option2.Value = 2.ToString();
            option3.Text = "Option 3";
            option3.Value = 3.ToString();
            option4.Text = "Option 4";
            option4.Value = 4.ToString();

            optionList.SetValue(option1, 0);
            optionList.SetValue(option2, 1);
            optionList.SetValue(option3, 2);
            optionList.SetValue(option4, 3);
            AnswerDropDown.Items.Clear();
            AnswerDropDown.Items.AddRange(optionList);
            AnswerDropDown.SelectedIndex = 0;

            commonFunction.debugMessage(quizDataTable.Rows[0][3].ToString().Trim());

            AnswerDropDown.ClearSelection();
            // Trim is needed because apparently there is a whitespace somewhere
            AnswerDropDown.Items.FindByValue(quizDataTable.Rows[0][3].ToString().Trim()).Selected = true;

            string quizAuthorQuery = "select username from userData where userID='" + quizDataTable.Rows[0][1].ToString() + "'";
            SqlDataAdapter quizAuthorAdapter = new SqlDataAdapter(quizAuthorQuery, conn);
            DataTable quizAuthorDataTable = new DataTable();
            quizAuthorAdapter.Fill(quizAuthorDataTable);

            quizAuthorLbl.Text = "Created by Admin " + quizAuthorDataTable.Rows[0][0].ToString();
            quizCreationDateLbl.Text = "Created on " + quizDataTable.Rows[0][5].ToString();
            quizUpdateDateLbl.Text = "Updated on " + quizDataTable.Rows[0][6].ToString();


            conn.Close();
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
            conn.Open();

            string query = "update quizData set isDeleted = 'true', updatedAt = '" +
                DateTime.UtcNow.ToString("yyyy-MM-dd hh:mm:ss") + "' where quizID = '" +
                QuestionDropDown.SelectedValue.ToString() + "'";

            SqlCommand updateCmd = new SqlCommand(query, conn);
            updateCmd.ExecuteNonQuery();

            conn.Close();
            Response.Redirect(string.Format("~/manageQuizzes.aspx"));

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            if (Regex.IsMatch(QuestionTxtBx.Text.Trim(), "['\";]+") ||
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
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();

                // Delimiter as input is forbidden, therefore sanitized
                string choices = option1TxtBx.Text.Trim().Replace("'", "\"").Replace(";", "") + ";" +
                    option2TxtBx.Text.Trim().Replace("'", "\"").Replace(";", "") + ";" +
                    option3TxtBx.Text.Trim().Replace("'", "\"").Replace(";", "") + ";" +
                    option4TxtBx.Text.Trim().Replace("'", "\"").Replace(";", "") + ";";

                string encodedChoices = Server.HtmlEncode(choices);

                string query = "update quizData set question = '" +
                Server.HtmlEncode(QuestionTxtBx.Text.Trim()) + "', correctans = '" +
                AnswerDropDown.SelectedValue.ToString().Trim() + "', choices = '" +
                encodedChoices + "', updatedAt = '" +
                DateTime.UtcNow.ToString("yyyy-MM-dd hh:mm:ss") + "' where quizID = '" +
                QuestionDropDown.SelectedValue.ToString() + "'";

                SqlCommand updateCmd = new SqlCommand(query, conn);
                updateCmd.ExecuteNonQuery();

                conn.Close();
                Response.Redirect(string.Format("~/manageQuizzes.aspx"));
            }

        }
    }
}