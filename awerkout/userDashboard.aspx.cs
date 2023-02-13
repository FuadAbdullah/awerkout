using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout
{
    public partial class userDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            calculation.Visible = false;
            ErrMsg.Visible = false;
            if (Session["username"] != null)
            {
                greetLbl.Text = "Hello there, " + Session["username"] + "!";
            }
            else
            {
                Response.Redirect("signInPage.aspx");
            }

            /*   load quiz questions from quizData and store the score...
             * 
             * 
             * 
             * 
             * 
             * 
             * 
             */




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

        protected void AdvancedBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Advanced.aspx");  //go to advanced workout plan page
        }

        protected void IntermediateBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Intermediate.aspx");   //go to intermediate workout plan page
        }

        protected void BeginnerBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Beginner.aspx");   //go to beginner workout plan page
        }

        protected void ContentPageBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./content/contentPage.aspx"); 
        }
        protected void QuizPageBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./content/quizPage.aspx"); 
        }

        protected void ReportCardBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./content/reportCardPage.aspx");
        }

        protected void calculate_Click(object sender, EventArgs e)
        {
            string heightTxt = "";
            heightTxt = heightTxtBx.Text;

            string weightTxt = "";
            weightTxt = weightTxtBx.Text;

            decimal height;
            decimal weight;

            if (heightTxt == "" || weightTxt == "")
            {
                ErrMsg.Visible = true;
                ErrMsg.Text = "Please ensure height or weight is filled.";
            }
            else if (Decimal.TryParse(heightTxt, out height) && Decimal.TryParse(weightTxt, out weight))
            {
                calculation.Visible = true;
                decimal bmical = (weight / (height * height));
                string bmi = bmical.ToString("#.##");
                calculation.Text = "Your BMI is: " + bmi + ".";
            } 
            else
            {
                ErrMsg.Visible = true;
                ErrMsg.Text = "Please ensure height or weight is numerical.";
            }
            
        }

        protected void FeedbackSubmitButton_Click(object sender, EventArgs e)
        {
            try
            {

                RadioButton[] rb = new RadioButton[5];

                rb[0] = r1;
                rb[1] = r2;
                rb[2] = r3;
                rb[3] = r4;
                rb[4] = r5;
                decimal rating = 0;

                foreach (RadioButton r in rb)
                {
                    if (r.Checked)
                    {
                        rating = decimal.Parse(r.ID.ToString().Replace("r", ""));
                    }
                }

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();

                string createQuery = "insert into feedbackData (userID, " +
                        "feedbacktitle, " +
                        "feedbackdesc, " +
                        "feedbackrating ) values (@userID," +
                        "@feedbacktitle, " +
                        "@feedbackdesc, " +
                        "@feedbackrating )";
                SqlCommand createCMD = new SqlCommand(createQuery, conn);

                createCMD.Parameters.AddWithValue("@userID", Session["userID"].ToString().Trim());
                createCMD.Parameters.AddWithValue("@feedbacktitle", Server.HtmlEncode(FeedbackSubjectTxtBx.Text.Trim()));
                createCMD.Parameters.AddWithValue("@feedbackdesc", Server.HtmlEncode(FeedbackDescTxtBx.Text.Trim()));
                createCMD.Parameters.AddWithValue("@feedbackrating", rating);
                createCMD.ExecuteNonQuery();

                conn.Close();
                Response.Redirect("userDashboard.aspx");
            }
            catch (Exception ex)
            {
                /*generalErrorMsg.Visible = true;
                generalErrorMsg.ForeColor = System.Drawing.Color.Red;
                generalErrorMsg.Text = "Quiz was not created successful!" + ex.ToString();*/
            }
        }

    }
}