﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout.content
{
    public partial class focusedContentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            commonFunction.debugMessage(Request.Url.Query); // ?viewpost=postID
            int postID = -1;

            // Check if the page was accessed without going through posts or no post ID was provided
            if (!string.IsNullOrEmpty(Request.QueryString["viewpost"]))
            {
                // Attempt to parse the value
                if (int.TryParse(Request.QueryString["viewpost"], out int result))
                {
                    postID = result;
                    Session["CurrentPostPageID"] = postID;
                    commonFunction.debugMessage(Session["CurrentPostPageID"].ToString());

                }
            }

            commonFunction.debugMessage(postID.ToString());

            if (Session["username"] != null) // Is logged in
            {
                signInlnk.Visible = false;
                signOutlnk.Visible = true;
                myProfilelnk.Visible = true;
            }
            else
            {
                signInlnk.Visible = true;
                signOutlnk.Visible = false;
                myProfilelnk.Visible = false;
                focusedCommentSubmitBtn.Visible = false;
                focusedCommentTxtBx.Enabled = false;
                focusedCommentTxtBx.Text = "You need to be logged in to leave a comment.";
            }

            if (!IsPostBack)
            {
                try
                {
                    // Required to connect to the database
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                    conn.Open();
                    // --

                    // Check if post is available for display
                    string query = "select count(*) from postData where postID=" + postID + "";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                    // If the database has such post, then display
                    if (check > 0)
                    {

                        // Fetch the post and its comments
                        string fetchPost = "select * from postData where postID=" + postID + "";

                        SqlDataAdapter postDataAdapter = new SqlDataAdapter(fetchPost, conn);
                        DataTable postDataTable = new DataTable();
                        postDataAdapter.Fill(postDataTable);

                        postDataTable.Columns.Add("bannerPath", typeof(string));
                        postDataTable.Columns.Add("username", typeof(string));

                        foreach (DataRow row in postDataTable.Rows)
                        {
                            // System.Diagnostics.Debug.WriteLine(row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", ".."));

                            row["bannerPath"] = row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", "..");
                            string fetchUsername = "select username from userData where userID = " + row[1] + "";

                            SqlDataAdapter usernameDataAdapter = new SqlDataAdapter(fetchUsername, conn);
                            DataTable usernameDataTable = new DataTable();
                            usernameDataAdapter.Fill(usernameDataTable);

                            row["username"] = usernameDataTable.Rows[0][0];
                        }


                        commonFunction.debugMessage(postDataTable.Rows[0][9].ToString().Trim());

                        focusedContentTitleLbl.Text = postDataTable.Rows[0][2].ToString().Trim();
                        focusedContentDescLbl.Text = postDataTable.Rows[0][3].ToString().Trim();
                        focusedContentImg.ImageUrl = postDataTable.Rows[0][8].ToString().Trim();
                        focusedContentAuthorLbl.Text = "Posted by " + postDataTable.Rows[0][9].ToString().Trim() + 
                            "#" + postDataTable.Rows[0][1].ToString().Trim() + 
                            " at " + postDataTable.Rows[0][5].ToString().Trim();

                        // Fetch the post and its comments
                        string fetchComments = "select * from commentData where postID = " + postID + "";

                        SqlDataAdapter commentDataAdapter = new SqlDataAdapter(fetchComments, conn);
                        DataTable commentDataTable = new DataTable();
                        commentDataAdapter.Fill(commentDataTable);

                        commentDataTable.Columns.Add("username", typeof(string));

                        foreach (DataRow row in commentDataTable.Rows)
                        {
                            // System.Diagnostics.Debug.WriteLine(row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", ".."));
                            string fetchUsername = "select username from userData where userID = " + row[1] + "";

                            SqlDataAdapter usernameDataAdapter = new SqlDataAdapter(fetchUsername, conn);
                            DataTable usernameDataTable = new DataTable();
                            usernameDataAdapter.Fill(usernameDataTable);

                            row["username"] = usernameDataTable.Rows[0][0];
                        }

                        focusedContentCommentRepeater.DataSource = commentDataTable;
                        focusedContentCommentRepeater.DataBind();
                    }
                    else // The post is not available
                    {
                        Response.Redirect("~/content/contentPage.aspx");
                    }

                    // Must close connection once opened
                    conn.Close();
                }
                catch (Exception ex)
                {
                    /* generalErrorMsg.Visible = true;
                    generalErrorMsg.ForeColor = System.Drawing.Color.Red;
                    generalErrorMsg.Text = "Error: " + ex.ToString(); */
                }
            }
        }

        protected void signOutlnk_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            Request.Cookies.Clear();

            Response.Redirect("../signInPage.aspx");
        }

        protected void myProfilelnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("../userDashboard.aspx");
        }

        protected void signInlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("../signInPage.aspx");
        }

        protected void focusedCommentSubmitBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
            conn.Open();

            // Creating the record in the table called postData
            string createQuery = "insert into commentData (userID, " +
                "postID, " +
                "commentdata ) values (@userID," +
                "@postID, " +
                "@commentdata)";
            SqlCommand createCMD = new SqlCommand(createQuery, conn);

            createCMD.Parameters.AddWithValue("@userID", Session["userID"]);
            createCMD.Parameters.AddWithValue("@postID", Session["CurrentPostPageID"]);
            createCMD.Parameters.AddWithValue("@commentdata", focusedCommentTxtBx.Text.Trim());
            createCMD.ExecuteNonQuery();
            Response.Redirect(string.Format("~/content/focusedContentPage.aspx?viewpost={0}", Session["CurrentPostPageID"].ToString().Trim()));

            conn.Close();
        }
    }
}