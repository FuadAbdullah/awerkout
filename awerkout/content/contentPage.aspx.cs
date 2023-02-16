﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout.content
{
    public partial class guidePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            }

            if (!IsPostBack)
            {
                try
                {
                    // Required to connect to the database
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                    conn.Open();
                    // --

                    // Count the number of posts available for display
                    string query = "select count(*) from postData where isDeleted='false'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                    // If the database has posts, then display
                    if (check > 0)
                    {

                        // Fetch only 5 recently updated/created posts
                        string fetchPosts = "select TOP 5 * from postData where isDeleted='false' order by updatedAt DESC";

                        SqlDataAdapter postDataAdapter = new SqlDataAdapter(fetchPosts, conn);
                        DataTable postDataTable = new DataTable();
                        postDataAdapter.Fill(postDataTable);

                        postDataTable.Columns.Add("bannerPath", typeof(string));
                        postDataTable.Columns.Add("username", typeof(string));
                        postDataTable.Columns.Add("accstatus", typeof(string));

                        foreach (DataRow row in postDataTable.Rows)
                        {
                            row["bannerPath"] = row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", "..");
                            // System.Diagnostics.Debug.WriteLine(row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", ".."));
                            string fetchUsername = "select username, accstatus from userData where userID = " + row[1] + "";

                            SqlDataAdapter usernameDataAdapter = new SqlDataAdapter(fetchUsername, conn);
                            DataTable usernameDataTable = new DataTable();
                            usernameDataAdapter.Fill(usernameDataTable);

                            row["username"] = usernameDataTable.Rows[0][0];
                            row["accstatus"] = usernameDataTable.Rows[0][1];
                        }

                        contentRepeater.DataSource = postDataTable;
                        contentRepeater.DataBind();
                    }
                    else // No posts are available
                    {
                        noContentLbl.Visible = true;
                        /* generalErrorMsg.Visible = true;
                        generalErrorMsg.ForeColor = System.Drawing.Color.Red;
                        generalErrorMsg.Text = "Incorrect username or password!"; */
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

        protected void contentFocusBtn_Click(object sender, EventArgs e)
        {
            ImageButton contentFocusBtn = (ImageButton)sender;
            string focusContent = string.Format("./focusedContentPage.aspx?viewpost={0}", contentFocusBtn.CommandArgument);
            Response.Redirect(focusContent);
        }

    }
}