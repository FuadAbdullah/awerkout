using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

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

            LinkButton[] links = new LinkButton[4];

            LinkButton homelnk = (LinkButton)Master.FindControl("homelnk");
            LinkButton planslnk = (LinkButton)Master.FindControl("planslnk");
            LinkButton guideslnk = (LinkButton)Master.FindControl("guideslnk");
            LinkButton nutritionslnk = (LinkButton)Master.FindControl("nutritionslnk");

            links[0] = homelnk;
            links[1] = planslnk;
            links[2] = guideslnk;
            links[3] = nutritionslnk;

            foreach (LinkButton lnk in links)
            {
                lnk.Visible = false;
            }

            generalErrorMsg.Visible = false;

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
            bool makeshiftValidFlag = false;
            List<bool> answered = new List<bool>();

            // Only need to check Question1 to see if the rest of the question are set
            if (HttpContext.Current.Session["Question1"] != null)
            {
                for (int i = 1; i < 11; i++)
                {
                    answered.Add(bool.Parse(HttpContext.Current.Session["Question" + i].ToString()));
                }
            }
            else
            {
                answered.Add(false);
            }

            if (answered.All(b => b == true))
                makeshiftValidFlag = true;


            if (makeshiftValidFlag)
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
                }

                for (int i = 1; i < 11; i++)
                {
                    HttpContext.Current.Session["Question" + i] = null;
                }
                Response.Redirect("~/content/reportCardPage.aspx");
            }
            else
            {
                generalErrorMsg.Text = "One or more questions were left empty! Answer all questions before submitting.";
                generalErrorMsg.Visible = true;
            }
        }


        [WebMethod]
        public static void SetSessionData(string value)
        {
            HttpContext.Current.Session["quizCountIndex"] = value;

            commonFunction.debugMessage(HttpContext.Current.Session["quizCountIndex"].ToString());
        }

        [WebMethod]
        public static void SetCurrentAnswerObj(answeredObj answeredObj)
        {
            HttpContext.Current.Session["Question1"] = answeredObj.Question1.ToString();
            HttpContext.Current.Session["Question2"] = answeredObj.Question2.ToString();
            HttpContext.Current.Session["Question3"] = answeredObj.Question3.ToString();
            HttpContext.Current.Session["Question4"] = answeredObj.Question4.ToString();
            HttpContext.Current.Session["Question5"] = answeredObj.Question5.ToString();
            HttpContext.Current.Session["Question6"] = answeredObj.Question6.ToString();
            HttpContext.Current.Session["Question7"] = answeredObj.Question7.ToString();
            HttpContext.Current.Session["Question8"] = answeredObj.Question8.ToString();
            HttpContext.Current.Session["Question9"] = answeredObj.Question9.ToString();
            HttpContext.Current.Session["Question10"] = answeredObj.Question10.ToString();

            for (int i = 1; i < 11; i++)
            {
                commonFunction.debugMessage(HttpContext.Current.Session["Question" + i].ToString());
            }

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static answeredObj GetCurrentAnswerObj()
        {
            answeredObj answeredObj = new answeredObj();
            if (HttpContext.Current.Session["Question1"] != null)
            {
                answeredObj.Question1 = bool.Parse(HttpContext.Current.Session["Question1"].ToString());
                answeredObj.Question2 = bool.Parse(HttpContext.Current.Session["Question2"].ToString());
                answeredObj.Question3 = bool.Parse(HttpContext.Current.Session["Question3"].ToString());
                answeredObj.Question4 = bool.Parse(HttpContext.Current.Session["Question4"].ToString());
                answeredObj.Question5 = bool.Parse(HttpContext.Current.Session["Question5"].ToString());
                answeredObj.Question6 = bool.Parse(HttpContext.Current.Session["Question6"].ToString());
                answeredObj.Question7 = bool.Parse(HttpContext.Current.Session["Question7"].ToString());
                answeredObj.Question8 = bool.Parse(HttpContext.Current.Session["Question8"].ToString());
                answeredObj.Question9 = bool.Parse(HttpContext.Current.Session["Question9"].ToString());
                answeredObj.Question10 = bool.Parse(HttpContext.Current.Session["Question10"].ToString());


                for (int i = 1; i < 11; i++)
                {
                    commonFunction.debugMessage(HttpContext.Current.Session["Question" + i].ToString());
                }

            }
            else
            {
                answeredObj.Question1 = false;
                answeredObj.Question2 = false;
                answeredObj.Question3 = false;
                answeredObj.Question4 = false;
                answeredObj.Question5 = false;
                answeredObj.Question6 = false;
                answeredObj.Question7 = false;
                answeredObj.Question8 = false;
                answeredObj.Question9 = false;
                answeredObj.Question10 = false;

            }

            return answeredObj;

        }

        [WebMethod]
        public static void DestroyHttpContextSession()
        {
            for (int i = 1; i < 11; i++)
            {
                HttpContext.Current.Session["Question" + i] = null;
            }
        }

        [WebMethod]
        public static void TestJSONDeserializer(Person person)
        {
            // Person person = JsonConvert.DeserializeObject<Person>(value);
            // HttpContext.Current.Session["quizCountIndex"] = value;

            commonFunction.debugMessage("Name: " + person.name);
            commonFunction.debugMessage("Age: " + person.age);
            commonFunction.debugMessage("Gender: " + person.gender);
        }

        public class Person
        {
            public string name { get; set; }
            public int age { get; set; }
            public string gender { get; set; }

        }

    }
}

