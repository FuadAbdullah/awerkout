using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout.content
{
    public partial class reportCardPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {

            }
            else
            {
                Response.Redirect("~/signInPage.aspx");
            }

            // Required to connect to the database
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
            conn.Open();
            // --

            /* string fetchPastQuizzes = "SELECT TOP 10 quizSaveID, userID, quizID, answer, createdAt, updatedAt, isDeleted " +
                "FROM (SELECT quizSaveID, userID, quizID, answer, createdAt, updatedAt, isDeleted, " +
                "ROW_NUMBER() OVER (PARTITION BY quizID ORDER BY updatedAt DESC) AS rowNum " +
                "FROM quizSaveData WHERE userID = " + Session["userID"] + ") " +
                "sub WHERE rowNum = 1" +
                "ORDER BY updatedAt"; */

            // Fetch only the latest record for every quiz taken, result should be unique, capped at 10 records
            string fetchPastQuizzes = "SELECT TOP 10 * " +
                "FROM ( SELECT *, ROW_NUMBER() OVER (PARTITION BY quizID ORDER BY updatedAt DESC) " +
                "as row_num FROM quizSaveData WHERE userID = '" + Session["userID"]  + "' ) " +
                "as t WHERE row_num = 1 ORDER BY updatedAt DESC";

            SqlDataAdapter pastQuizDataAdapter = new SqlDataAdapter(fetchPastQuizzes, conn);
            DataTable pastQuizDataTable = new DataTable();
            pastQuizDataAdapter.Fill(pastQuizDataTable);

            // commonFunction.debugMessage(pastQuizDataTable.Rows.Count.ToString());

            if (pastQuizDataTable.Rows.Count <= 0)
                noContentLbl.Visible = true;

            int i = 0;

            pastQuizDataTable.Columns.Add("question", typeof(string));
            pastQuizDataTable.Columns.Add("correctans", typeof(string));
            pastQuizDataTable.Columns.Add("Answer1", typeof(string));
            pastQuizDataTable.Columns.Add("Answer2", typeof(string));
            pastQuizDataTable.Columns.Add("Answer3", typeof(string));
            pastQuizDataTable.Columns.Add("Answer4", typeof(string));
            pastQuizDataTable.Columns.Add("RevisionDate", typeof(string));
            pastQuizDataTable.Columns.Add("NoLongerAvailable", typeof(string));

            foreach (DataRow row in pastQuizDataTable.Rows)
            {
                // Appending Option to the front of the selected answer
                row["answer"] = "Option" + row["answer"];
                commonFunction.debugMessage(row["answer"].ToString());

                // Fetch only quiz record that was taken by the user
                string fetchTakenQuiz = "SELECT question, correctans, choices, updatedAt, isDeleted FROM quizData where quizID = '" + row["quizID"].ToString().Trim() + "'";
                SqlDataAdapter takenQuizDataAdapter = new SqlDataAdapter(fetchTakenQuiz, conn);
                DataTable takenQuizDataTable = new DataTable();
                takenQuizDataAdapter.Fill(takenQuizDataTable);

                row["question"] = Server.HtmlDecode(takenQuizDataTable.Rows[0]["question"].ToString());
                row["correctans"] = "Option" + Server.HtmlDecode(takenQuizDataTable.Rows[0]["correctans"].ToString());
                row["Answer1"] = Server.HtmlDecode(takenQuizDataTable.Rows[0]["choices"].ToString().Split(';')[0]);
                row["Answer2"] = Server.HtmlDecode(takenQuizDataTable.Rows[0]["choices"].ToString().Split(';')[1]);
                row["Answer3"] = Server.HtmlDecode(takenQuizDataTable.Rows[0]["choices"].ToString().Split(';')[2]);
                row["Answer4"] = Server.HtmlDecode(takenQuizDataTable.Rows[0]["choices"].ToString().Split(';')[3]);
                row["RevisionDate"] = Server.HtmlDecode(takenQuizDataTable.Rows[0]["updatedAt"].ToString());
                row["NoLongerAvailable"] = Server.HtmlDecode(takenQuizDataTable.Rows[0]["isDeleted"].ToString());

                i += row["answer"].ToString().Trim().Equals(row["correctans"].ToString().Trim()) ? 1 : 0;
                // commonFunction.debugMessage(row["answer"].ToString().Trim().Equals(row["correctans"].ToString().Trim()) ? "true" : "false");
            }

            Session["totalQuizAnswered"] = pastQuizDataTable.Rows.Count;
            Session["totalQuizCorrect"] = i;
            Session["totalQuizWrong"] = int.Parse(Session["totalQuizAnswered"].ToString()) - int.Parse(Session["totalQuizCorrect"].ToString());

            quizRepeater.DataSource = pastQuizDataTable;
            quizRepeater.DataBind();

            commonFunction.debugMessage(Session["totalQuizAnswered"].ToString());
            commonFunction.debugMessage(Session["totalQuizCorrect"].ToString());
            commonFunction.debugMessage(Session["totalQuizWrong"].ToString());

        }

        protected void myDashboardlnk_Click(object sender, EventArgs e)
        {

            // Redirect admin to adminDashboard.aspx
            if (Session["usertype"].ToString().Trim() == "ADMIN")
            {
                Response.Redirect("~/adminDashboard.aspx");
            }
            // Redirect member to memberDashboard.aspx
            else if (Session["usertype"].ToString().Trim() == "USER")
            {
                Response.Redirect("~/userDashboard.aspx");
            }

        }

        protected void signOutlnk_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Request.Cookies.Clear();

            Response.Redirect("~/signInPage.aspx");
        }
    }
}