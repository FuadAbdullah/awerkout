using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout
{
    public partial class registerUserPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Error messages are hidden at first
            userUsernameErrMsgLbl.Visible = false;
            userFirstNameErrMsgLbl.Visible = false;
            userLastNameErrMsgLbl.Visible = false;
            userEmailErrMsgLbl.Visible = false;
            userPasswordErrMsgLbl.Visible = false;
            userRPasswordErrMsgLbl.Visible = false;
            debugMessage("Hello World!");
        }

        protected void userUsernameTxtBx_TextChanged(object sender, EventArgs e)
        {
            debugMessage("Username Text Box value changed!");
            debugMessage(userUsernameTxtBx.Text.Length.ToString());
            if (userUsernameTxtBx.Text.Length == 0)
            {
                showErrorMessage(userUsernameErrMsgLbl, "Your username cannot be empty!");
            }
        }

        protected void debugMessage(string debugmsg)
        {
            System.Diagnostics.Debug.WriteLine(debugmsg);
        }

        protected void showErrorMessage(Label lbl, string message = "Ambiguous error") {
            lbl.Visible = true;
            lbl.Text = message;
        }

        protected void hideErrorMessage(Label lbl)
        {
            lbl.Visible = false;
            lbl.Text = "";
        }
    }
}