using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout
{
    public partial class WorkoutPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                greetLbl.Text = "Hello there, " + Session["username"] + "!";
                myProfilelnk.Visible = true;
                signOutlnk.Visible = true;
                signinlnk.Visible = false;
            }
            else
            {
                myProfilelnk.Visible = false;
                signOutlnk.Visible = false;
                greetLbl.Visible = false;
                signinlnk.Visible = true;
            }
        }
        protected void myProfilelnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("userProfile.aspx");
        }

        protected void signOutlnk_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Request.Cookies.Clear();

            Response.Redirect("signInPage.aspx");
        }

        protected void signInlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("signInPage.aspx");
        }

        protected void BeginnerBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Beginner.aspx");
        }

        protected void IntermediateBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Intermediate.aspx");
        }

        protected void AdvancedBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Advanced.aspx");
        }
    }
}