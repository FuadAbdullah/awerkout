using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
            {
                greetLbl.Text = "Hello there, Admin " + Session["username"] + "!";
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

        protected void manageUserlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageUsers.aspx");
        }

        protected void adminCreateAdminAcclnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("registerAdminPage.aspx");
        }

        protected void adminCreateContentlnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("createContent.aspx");
        }
    }
}