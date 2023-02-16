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
            ErrMsg.Visible = false;
            ErrMsg2.Visible = false;
            calculation.Visible = false;
            category.Visible = false;
            if (Session["username"] != null)
            {
                greetLbl.Text = "Hello there, " + Session["username"] + "!";
            }
            else
            {
                Response.Redirect("signInPage.aspx");
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
                category.Visible = true;

                if (Math.Log10(double.Parse(height.ToString())) > 2)
                {
                    // Greater than 2 digits, the value will be assumed to be in cm i.e 179 cm 165 cm
                    height /= 100;
                }

                decimal bmical = (weight / (height * height));
                string bmicat = "";

                if (bmical < decimal.Parse((18.5).ToString()))
                {
                    if (bmical <= decimal.Parse((10).ToString()))
                    {
                        bmical = 0;
                        bmicat = "Impossible to be categorized at this point.";
                    }
                    else
                    {
                        bmicat = "You are <strong><span style='color:blue'>underweight</span></strong>. Consider packing on some weight!";

                    }
                }
                else if (bmical >= decimal.Parse((18.5).ToString()) && bmical < decimal.Parse((25).ToString()))
                {
                    bmicat = "Congrats, your weight is categorized as <strong><span style='color:green'>normal</span></strong>! Keep up the good work.";
                }
                else if (bmical >= decimal.Parse((25).ToString()) && bmical < decimal.Parse((30).ToString()))
                {
                    bmicat = "You are <strong><span style='color:orange'>overweight</span></strong>. Try to reduce your daily calorie intake!";
                }
                else
                {
                    bmicat = "You are <strong><span style='color:red'>obese and your health is at risk</span></strong>! Do your best to reduce your daily calorie intake and perform plenty of exercises!";
                }
                string bmi = bmical == decimal.Parse(0.ToString()) ? "Not Available" : bmical.ToString("#.##");
                calculation.Text = "Your BMI is: " + bmi;
                category.Text = bmicat;
            }
            else
            {
                ErrMsg.Visible = true;
                ErrMsg.Text = "Please ensure height or weight is numerical.";
            }

        }

        protected void FeedbackSubmitButton_Click(object sender, EventArgs e)
        {

            string subjectTxt = "";
            subjectTxt = FeedbackSubjectTxtBx.Text;

            string descTxt = "";
            descTxt = FeedbackDescTxtBx.Text;

            if (subjectTxt == "" || descTxt == "")
            {
                ErrMsg2.Visible = true;
                ErrMsg2.ForeColor = System.Drawing.Color.Red;
                ErrMsg2.Text = "Please provide subject and description for feedback. Much appreciated! :)";
            }
            else
            {
                try
                {

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
                    createCMD.Parameters.AddWithValue("@feedbackrating", decimal.Parse(RatingRadioButtons.SelectedValue.ToString()));
                    createCMD.ExecuteNonQuery();

                    conn.Close();
                    Response.Redirect("userDashboard.aspx");
                }
                catch (Exception ex)
                {
                    ErrMsg2.Visible = true;
                    ErrMsg2.ForeColor = System.Drawing.Color.Red;
                    ErrMsg2.Text = "Feedback was not given successful!" + ex.ToString();
                }
            }
        }

    }
}