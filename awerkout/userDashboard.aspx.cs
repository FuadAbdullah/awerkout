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
    }
}