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
            if (Session["username"] != null)
            {
                // Do nothing yet
            }
            else
            {
                Response.Redirect("../signInPage.aspx");
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
                    string query = "select count(*) from postData";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                    // If the database has posts, then display
                    if (check > 0)
                    {

                        // Fetch the first name and the user type
                        string fetchPosts = "select * from postData";

                        SqlDataAdapter postDataAdapter = new SqlDataAdapter(fetchPosts, conn);
                        DataTable postDataTable = new DataTable();
                        postDataAdapter.Fill(postDataTable);

                        postDataTable.Columns.Add("bannerPath", typeof(string));

                        foreach (DataRow row in postDataTable.Rows)
                        {
                            // System.Diagnostics.Debug.WriteLine(row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", ".."));

                            row["bannerPath"] = row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", "..");
                        }

                        contentRepeater.DataSource = postDataTable;
                        contentRepeater.DataBind();
                    }
                    else // No posts are available
                    {
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

        protected void contentRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

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


    }
}