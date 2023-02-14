using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout.content
{
    public partial class quizPage : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                // Required to connect to the database
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();
                // --

                // Fetch 10 quizzes at random
                string fetchQuizzes = "SELECT TOP 10 * FROM quizData WHERE isDeleted = 'false' ORDER BY NEWID()";

                SqlDataAdapter quizDataAdapter = new SqlDataAdapter(fetchQuizzes, conn);
                DataTable quizDataTable = new DataTable();
                quizDataAdapter.Fill(quizDataTable);

                quizDataTable.Columns.Add("Answer1", typeof(string));
                quizDataTable.Columns.Add("Answer2", typeof(string));
                quizDataTable.Columns.Add("Answer3", typeof(string));
                quizDataTable.Columns.Add("Answer4", typeof(string));

                int i = 1;

                foreach (DataRow row in quizDataTable.Rows)
                {
                    // System.Diagnostics.Debug.WriteLine(row["contentdata"].ToString().Split(';')[0].Replace("bannerPath=~", ".."));

                    row["question"] = i.ToString() + ") " + row["question"];

                    row["Answer1"] = Server.HtmlDecode(row["choices"].ToString().Split(';')[0]);
                    row["Answer2"] = Server.HtmlDecode(row["choices"].ToString().Split(';')[1]);
                    row["Answer3"] = Server.HtmlDecode(row["choices"].ToString().Split(';')[2]);
                    row["Answer4"] = Server.HtmlDecode(row["choices"].ToString().Split(';')[3]);

                    i += 1;
                }



                quizRepeater.DataSource = quizDataTable;
                quizRepeater.DataBind();
            }
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

        protected void quizSubmitBtn_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["quizCountIndex"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + "You have not answered any questions, give a shot at it first!" + "');", true);
            } else if (int.Parse(HttpContext.Current.Session["quizCountIndex"].ToString()) < 10)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + "Some answers were left unanswered, you can do this! I'll restart it for you for some challenge..." + "');", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Refresh", "refreshPage();", true);
            }
            else
            {
                int index = 0;
                List<string> rbID = new List<string>();
                List<string> rbGroupName = new List<string>();

                foreach (RepeaterItem item in quizRepeater.Items)
                {
                    RadioButton rbOption1 = (RadioButton)item.FindControl("Option1");
                    RadioButton rbOption2 = (RadioButton)item.FindControl("Option2");
                    RadioButton rbOption3 = (RadioButton)item.FindControl("Option3");
                    RadioButton rbOption4 = (RadioButton)item.FindControl("Option4");

                    RadioButton[] rbArray = new RadioButton[4];
                    rbArray[0] = rbOption1;
                    rbArray[1] = rbOption2;
                    rbArray[2] = rbOption3;
                    rbArray[3] = rbOption4;

                    foreach (RadioButton rb in rbArray)
                    {
                        if (rb.Checked)
                        {
                            rbID.Add(rb.GroupName.ToString().Trim());
                            rbGroupName.Add(rb.ID.ToString().Replace("Option", "").Trim());

                            index += 1;
                        }
                    }
                }

                for (int i = 0; i < 10; i++)
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                    conn.Open();

                    // Creating the record in the table called postData
                    string createQuery = "insert into quizSaveData (userID, " +
                        "quizID, " +
                        "answer ) values (@userID," +
                        "@quizID, " +
                        "@answer )";
                    SqlCommand createCMD = new SqlCommand(createQuery, conn);

                    createCMD.Parameters.AddWithValue("@userID", Session["userID"]);
                    createCMD.Parameters.AddWithValue("@quizID", rbID[i]);
                    createCMD.Parameters.AddWithValue("@answer", rbGroupName[i]);
                    createCMD.ExecuteNonQuery();

                    conn.Close();
                    HttpContext.Current.Session["quizCountIndex"] = null;
                    Response.Redirect("~/content/reportCardPage.aspx");
                }
            }

        }

        [WebMethod]
        public static void SetSessionData(string value)
        {
            HttpContext.Current.Session["quizCountIndex"] = value;

            commonFunction.debugMessage(HttpContext.Current.Session["quizCountIndex"].ToString());
        }

    }


}

