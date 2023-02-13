using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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

                        // Fetch the post
                        string fetchPost = "select * from postData where postID=" + postID + "";

                        SqlDataAdapter postDataAdapter = new SqlDataAdapter(fetchPost, conn);
                        DataTable postDataTable = new DataTable();
                        postDataAdapter.Fill(postDataTable);

                        postDataTable.Columns.Add("bannerPath", typeof(string));
                        postDataTable.Columns.Add("username", typeof(string));
                        postDataTable.Columns.Add("accstatus", typeof(string));

                        foreach (DataRow row in postDataTable.Rows)
                        {
                            // System.Diagnostics.Debug.WriteLine(row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", ".."));

                            row["bannerPath"] = row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", "..");
                            string fetchUsername = "select username, accstatus from userData where userID = " + row[1] + "";

                            SqlDataAdapter usernameDataAdapter = new SqlDataAdapter(fetchUsername, conn);
                            DataTable usernameDataTable = new DataTable();
                            usernameDataAdapter.Fill(usernameDataTable);

                            row["username"] = usernameDataTable.Rows[0][0];
                            row["accstatus"] = usernameDataTable.Rows[0][1];
                        }


                        commonFunction.debugMessage(postDataTable.Rows[0][9].ToString().Trim());

                        // Standard view
                        focusedContentTitleLbl.Text = Server.HtmlDecode(postDataTable.Rows[0][2].ToString().Trim());
                        focusedContentDescLbl.Text = Server.HtmlDecode(postDataTable.Rows[0][3].ToString().Trim());
                        focusedContentImg.ImageUrl = Server.HtmlDecode(postDataTable.Rows[0][8].ToString().Trim());
                        focusedContentImg.AlternateText = Server.HtmlDecode(postDataTable.Rows[0][8].ToString().Trim());

                        // Admin view
                        focusedEditTitleTxtBx.Text = Server.HtmlDecode(postDataTable.Rows[0][2].ToString().Trim());
                        focusedEditDescTxtBx.Text = Server.HtmlDecode(postDataTable.Rows[0][3].ToString().Trim());

                        focusedContentAuthorLbl.Text = "Posted by " + (
                            postDataTable.Rows[0][10].ToString().Trim().Equals("A") 
                            ? postDataTable.Rows[0][9].ToString().Trim() 
                            : "[DELETED USER]" ) +
                            "#" + postDataTable.Rows[0][1].ToString().Trim() +
                            " on " + postDataTable.Rows[0][5].ToString().Trim();

                        focusedContentUpdateLbl.Text = "Last updated on " + postDataTable.Rows[0][6].ToString().Trim();

                        // Fetch its latest 10 comments that is not set as deleted
                        string fetchComments = "select TOP 10 * from commentData where postID = "
                            + postID + "and isDeleted = 'false' order by updatedAt DESC";

                        SqlDataAdapter commentDataAdapter = new SqlDataAdapter(fetchComments, conn);
                        DataTable commentDataTable = new DataTable();
                        commentDataAdapter.Fill(commentDataTable);

                        commentDataTable.Columns.Add("username", typeof(string));
                        commentDataTable.Columns.Add("accstatus", typeof(string));

                        foreach (DataRow row in commentDataTable.Rows)
                        {
                            // System.Diagnostics.Debug.WriteLine(row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", ".."));
                            string fetchUsername = "select username, accstatus from userData where userID = " + row[1] + "";

                            SqlDataAdapter usernameDataAdapter = new SqlDataAdapter(fetchUsername, conn);
                            DataTable usernameDataTable = new DataTable();
                            usernameDataAdapter.Fill(usernameDataTable);

                            row["accstatus"] = usernameDataTable.Rows[0][1];
                            row["username"] = usernameDataTable.Rows[0][1].ToString().Trim().Equals("A")
                            ? usernameDataTable.Rows[0][0].ToString().Trim()
                            : "[DELETED USER]";
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

        protected void focusedContentCommentRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "PerformEditComment")
            {

                TextBox txt = (TextBox)e.Item.FindControl("focusedEditCommentTxtBx");
                Button btn = (Button)e.Item.FindControl("focusedEditCommentBtn");

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();

                string commentID = btn.CommandArgument.ToString().Trim();

                string query = "update commentData set commentdata = '" +
                    Server.HtmlEncode(txt.Text.Trim()) + "', updatedAt = '" +
                    DateTime.UtcNow.ToString("yyyy-MM-dd hh:mm:ss") + "' where commentID = '" +
                    commentID + "'";

                SqlCommand updateCmd = new SqlCommand(query, conn);
                updateCmd.ExecuteNonQuery();

                conn.Close();
                Response.Redirect(string.Format("~/content/focusedContentPage.aspx?viewpost={0}", Session["CurrentPostPageID"].ToString().Trim()));

            }

            if (e.CommandName == "PerformDeleteComment")
            {
                Button btn = (Button)e.Item.FindControl("focusedDeleteCommentBtn");

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();

                string commentID = btn.CommandArgument.ToString().Trim();

                string query = "update commentData set isDeleted = 'true', updatedAt = '" +
                    DateTime.UtcNow.ToString("yyyy-MM-dd hh:mm:ss") + "' where commentID = '" +
                    commentID + "'";

                SqlCommand updateCmd = new SqlCommand(query, conn);
                updateCmd.ExecuteNonQuery();

                conn.Close();
                Response.Redirect(string.Format("~/content/focusedContentPage.aspx?viewpost={0}", Session["CurrentPostPageID"].ToString().Trim()));

            }
        }

        protected void focusedEditPostSubmitBtn_Click(object sender, EventArgs e)
        {

            string folderPathStr = "~/ContentPic/";

            // for file upload 
            string folderPath = Server.MapPath(folderPathStr);

            string fileName = focusedContentImg.AlternateText;
            string fileExt = Path.GetExtension(focusedEditPicReupload.FileName);

            string contentdata = "";

            if (fileName == "") // assuming no img existed or stored
            {
                string newFileName = commonFunction.getRandomHexNumber(6);
                // save file to dir
                focusedEditPicReupload.SaveAs(folderPath + Path.GetFileName(newFileName) + fileExt);

                // display the pic in img control
                focusedContentImg.ImageUrl = folderPathStr + Path.GetFileName(newFileName) + fileExt;

                contentdata = "bannerPath=" + folderPathStr + newFileName + fileExt + ";";
            }
            else // Got pic ady
            {
                if (focusedEditPicReupload.FileName == "")
                { // Not upload pic
                    focusedContentImg.ImageUrl = focusedContentImg.AlternateText;
                    contentdata = focusedContentImg.ImageUrl + ";";
                }
                else // change existing pic
                {
                    string newFileName = commonFunction.getRandomHexNumber(6);
                    commonFunction.debugMessage(newFileName);
                    focusedEditPicReupload.SaveAs(folderPath + Path.GetFileName(newFileName) + fileExt);
                    focusedContentImg.ImageUrl = folderPathStr + Path.GetFileName(newFileName) + fileExt;

                    contentdata = "bannerPath=" + folderPathStr + newFileName + fileExt + ";";
                }
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
            conn.Open();


            string query = "update postData set postTitle = '" +
                Server.HtmlEncode(focusedEditTitleTxtBx.Text.Trim()) + "', postDescription = '" +
                Server.HtmlEncode(focusedEditDescTxtBx.Text.Trim()) + "', contentdata = '" +
                contentdata + "', updatedAt = '" +
                DateTime.UtcNow.ToString("yyyy-MM-dd hh:mm:ss") + "' where postID = '" +
                Session["CurrentPostPageID"] + "'";

            SqlCommand updateCmd = new SqlCommand(query, conn);
            updateCmd.ExecuteNonQuery();

            conn.Close();
            Response.Redirect(string.Format("~/content/focusedContentPage.aspx?viewpost={0}", Session["CurrentPostPageID"].ToString().Trim()));

        }

        protected void focusedDeletePostBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
            conn.Open();

            string query = "update postData set isDeleted = 'true', updatedAt = '" +
                DateTime.UtcNow.ToString("yyyy-MM-dd hh:mm:ss") + "' where postID = '" +
                Session["CurrentPostPageID"] + "'";

            SqlCommand updateCmd = new SqlCommand(query, conn);
            updateCmd.ExecuteNonQuery();

            conn.Close();
            Response.Redirect(string.Format("~/content/contentPage.aspx"));

        }
    }
}