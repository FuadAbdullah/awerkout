using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout
{
    public partial class Intermediate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                greetLbl.Text = "Hello there, " + Session["username"] + "!";
                myDashboardlnk.Visible = true;
                signOutlnk.Visible = true;
                signinlnk.Visible = false;
            }
            else
            {
                myDashboardlnk.Visible = false;
                signOutlnk.Visible = false;
                greetLbl.Visible = false;
                signinlnk.Visible = true;
            }
        }
        protected void myDashboardlnk_Click(object sender, EventArgs e)
        {
            // Redirect admin to adminDashboard.aspx
            if (Session["usertype"].ToString().Trim() == "ADMIN")
            {
                Response.Redirect("adminDashboard.aspx");
            }
            // Redirect member to memberDashboard.aspx
            else if (Session["usertype"].ToString().Trim() == "USER")
            {
                Response.Redirect("userDashboard.aspx");
            }
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

    }
}