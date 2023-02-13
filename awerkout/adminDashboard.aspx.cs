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
                // Required to connect to the database
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();
                // --

                // Fetch top 10 latest unreviewed feedbacks
                string fetchFeedbacks = "SELECT TOP 10 * FROM feedbackData WHERE isReviewed='false' ORDER BY createdAt DESC";

                SqlDataAdapter feedbackDataAdapter = new SqlDataAdapter(fetchFeedbacks, conn);
                DataTable feedbackDataTable = new DataTable();
                feedbackDataAdapter.Fill(feedbackDataTable);

                // commonFunction.debugMessage(pastQuizDataTable.Rows.Count.ToString());

                if (feedbackDataTable.Rows.Count <= 0)
                    noContentLbl.Visible = true;

                feedbackDataTable.Columns.Add("username", typeof(string));

                foreach (DataRow row in feedbackDataTable.Rows)
                {

                    // Fetch only quiz record that was taken by the user
                    string fetchUsername = "SELECT username FROM userData where userID = '" + row["userID"].ToString().Trim() + "'";
                    SqlDataAdapter fetchUsernameDataAdapter = new SqlDataAdapter(fetchUsername, conn);
                    DataTable fetchUsernameDataTable = new DataTable();
                    fetchUsernameDataAdapter.Fill(fetchUsernameDataTable);

                    row["username"] = Server.HtmlDecode(fetchUsernameDataTable.Rows[0]["username"].ToString());
                }

                FeedbackRepeater.DataSource = feedbackDataTable;
                FeedbackRepeater.DataBind();
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

        protected void adminManageQuizlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageQuizzes.aspx");
        }

        protected void FeedbackRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "PerformReviewed")
            {
                Button btn = (Button)e.Item.FindControl("FeedbackSetReviewedBtn");
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();

                string query = "update feedbackData set isReviewed = 'true', " +
                    "updatedAt = '" +
                    DateTime.UtcNow.ToString("yyyy-MM-dd hh:mm:ss") +
                    "' where feedbackID = '" +
                    btn.CommandArgument.ToString() + "'";
                SqlCommand updateCmd = new SqlCommand(query, conn);
                updateCmd.ExecuteNonQuery();

                conn.Close();
                Response.Redirect("~/adminDashboard.aspx");
            }
        }

        protected void FeedbackShowReviewedChkBx_CheckedChanged(object sender, EventArgs e)
        {
            // Clear the repeater
            FeedbackRepeater.DataSource = null;
            FeedbackRepeater.DataBind();


            // Required to connect to the database
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
            conn.Open();
            // --

            string fetchFeedbacks = "";

            if (FeedbackShowReviewedChkBx.Checked)
            {
                fetchFeedbacks = "SELECT TOP 10 * FROM feedbackData ORDER BY createdAt DESC";
            }
            else
            {
                fetchFeedbacks = "SELECT TOP 10 * FROM feedbackData WHERE isReviewed='false' ORDER BY createdAt DESC";
            }

            SqlDataAdapter feedbackDataAdapter = new SqlDataAdapter(fetchFeedbacks, conn);
            DataTable feedbackDataTable = new DataTable();
            feedbackDataAdapter.Fill(feedbackDataTable);

            // commonFunction.debugMessage(pastQuizDataTable.Rows.Count.ToString());

            if (feedbackDataTable.Rows.Count <= 0)
                noContentLbl.Visible = true;

            feedbackDataTable.Columns.Add("username", typeof(string));

            foreach (DataRow row in feedbackDataTable.Rows)
            {

                // Fetch only quiz record that was taken by the user
                string fetchUsername = "SELECT username FROM userData where userID = '" + row["userID"].ToString().Trim() + "'";
                SqlDataAdapter fetchUsernameDataAdapter = new SqlDataAdapter(fetchUsername, conn);
                DataTable fetchUsernameDataTable = new DataTable();
                fetchUsernameDataAdapter.Fill(fetchUsernameDataTable);

                row["username"] = Server.HtmlDecode(fetchUsernameDataTable.Rows[0]["username"].ToString());
            }

            FeedbackRepeater.DataSource = feedbackDataTable;
            FeedbackRepeater.DataBind();

        }
    }
}