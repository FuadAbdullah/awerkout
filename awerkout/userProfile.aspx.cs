using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace awerkout
{
    public partial class userProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userIDLbl.Visible = false;
            //userUsernameErrMsg.Visible = false;
            //userFirstNameErrMsg.Visible = false;
            //userLastNameErrMsg.Visible = false;
            //userEmailErrMsg.Visible = false;
            //userPhoneNumberErrMsg.Visible = false;
            //userWeightErrMsg.Visible = false;
            //userHeightErrMsg.Visible = false;
            //userDoBErrMsg.Visible = false;
            //userGenderErrMsg.Visible = false;
            //userPasswordErrMsg.Visible = false;
            //userRPasswordErrMsg.Visible = false;
            generalErrorMsg.Visible = false;

            userUsernameTxtBx.Enabled = false;

            if (Session["username"] != null)
            {
                if (Session["usertype"].ToString().Trim() == "ADMIN")
                {
                    userUsernameTxtBx.Enabled = true;
                }
            }
            else
            {
                Response.Redirect("signInPage.aspx");
            }

            if (!Page.IsPostBack)
            {
                // Gender initializer
                ListItem[] genderList = new ListItem[3];
                ListItem undefinedGender = new ListItem();
                ListItem maleGender = new ListItem();
                ListItem femaleGender = new ListItem();
                undefinedGender.Text = "U";
                undefinedGender.Value = "U";
                maleGender.Text = "M";
                maleGender.Value = "M";
                femaleGender.Text = "F";
                femaleGender.Value = "F";
                genderList.SetValue(undefinedGender, 0);
                genderList.SetValue(maleGender, 1);
                genderList.SetValue(femaleGender, 2);
                userGenderDropDown.Items.AddRange(genderList);
                userGenderDropDown.SelectedIndex = 0;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();

                string query = "select * from userData where username = '" +
                    Session["username"] + "'";
                SqlDataAdapter profileDataAdapter = new SqlDataAdapter(query, conn);
                DataTable profileDataTable = new DataTable();
                profileDataAdapter.Fill(profileDataTable);

                userIDLbl.Text = Session["usertype"].ToString().Trim() == "ADMIN" ? "ADMIN " + profileDataTable.Rows[0][0].ToString() : "USER " + profileDataTable.Rows[0][0].ToString();

                userUsernameTxtBx.Text = profileDataTable.Rows[0][1].ToString();
                userFirstNameTxtBx.Text = profileDataTable.Rows[0][4].ToString();
                userLastNameTxtBx.Text = profileDataTable.Rows[0][5].ToString();
                userEmailTxtBx.Text = profileDataTable.Rows[0][6].ToString();
                userPPImg.ImageUrl = profileDataTable.Rows[0][8].ToString();
                userPPImg.AlternateText = profileDataTable.Rows[0][8].ToString();
                userLocationTxtBx.Text = profileDataTable.Rows[0][9].ToString();
                userAboutMeTxtBx.Text = profileDataTable.Rows[0][10].ToString();
                userLikesTxtBx.Text = profileDataTable.Rows[0][11].ToString();
                userDislikesTxtBx.Text = profileDataTable.Rows[0][12].ToString();
                userPhoneNumberTxtBx.Text = profileDataTable.Rows[0][13].ToString();
                userWeightTxtBx.Text = profileDataTable.Rows[0][14].ToString();
                userHeightTxtBx.Text = profileDataTable.Rows[0][15].ToString();
                userDoBTxtBx.Text = DateTime.Parse(profileDataTable.Rows[0][16].ToString()).ToString("yyyy-MM-dd");
                userCreationDateLbl.Text = "Account Creation Date: " + DateTime.Parse(profileDataTable.Rows[0][18].ToString()).ToString("dd-MM-yyyy hh:mm:ss");
                userUpdatedOnLbl.Text = "Latest Changes Made On: " + DateTime.Parse(profileDataTable.Rows[0][19].ToString()).ToString("dd-MM-yyyy hh:mm:ss");

                userGenderDropDown.ClearSelection();
                // Trim is needed because apparently there is a whitespace somewhere
                userGenderDropDown.Items.FindByText(profileDataTable.Rows[0][7].ToString().Trim()).Selected = true;

                conn.Close();

            }
        }

        protected void signOutlnk_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Request.Cookies.Clear();

            Response.Redirect("signInPage.aspx");
        }

        protected void userUpdateProfileBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string folderPathStr = "~/ProfilePic/";

                // for file upload 
                string folderPath = Server.MapPath(folderPathStr);

                // check if dir exists
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath); // create one if not exist
                }

                string fileName = userPPImg.AlternateText;
                string fileExt = Path.GetExtension(userPPUpload.FileName);

                if (fileName == "") // assuming no img existed or stored
                {
                    string newFileName = commonFunction.getRandomHexNumber(6);
                    // save file to dir
                    userPPUpload.SaveAs(folderPath + Path.GetFileName(newFileName) + fileExt);

                    // display the pic in img control
                    userPPImg.ImageUrl = folderPathStr + Path.GetFileName(newFileName) + fileExt;
                }
                else // Got pic ady
                {
                    if (userPPUpload.FileName == "") // Not upload pic
                        userPPImg.ImageUrl = userPPImg.AlternateText;
                    else // change existing pic
                    {
                        string newFileName = commonFunction.getRandomHexNumber(6);
                        commonFunction.debugMessage(newFileName);
                        userPPUpload.SaveAs(folderPath + Path.GetFileName(newFileName) + fileExt);
                        userPPImg.ImageUrl = "~/ProfilePic/" + Path.GetFileName(newFileName) + fileExt;
                    }
                }

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();


                string query = "";

                if (Regex.IsMatch(userFirstNameTxtBx.Text.Trim(), "['\";]+") ||
                    Regex.IsMatch(userLastNameTxtBx.Text.Trim(), "['\";]+") ||
                    Regex.IsMatch(userEmailTxtBx.Text.Trim(), "['\";]+") ||
                    Regex.IsMatch(userPasswordTxtBx.Text.Trim(), "['\";]+") ||
                    Regex.IsMatch(userLocationTxtBx.Text.Trim(), "['\";]+") ||
                    Regex.IsMatch(userAboutMeTxtBx.Text.Trim(), "['\";]+") ||
                    Regex.IsMatch(userLikesTxtBx.Text.Trim(), "['\";]+") ||
                    Regex.IsMatch(userDislikesTxtBx.Text.Trim(), "['\";]+") ||
                    Regex.IsMatch(userPhoneNumberTxtBx.Text.Trim(), "['\";]+") ||
                    Regex.IsMatch(userWeightTxtBx.Text.Trim(), "['\";]+") ||
                    Regex.IsMatch(userHeightTxtBx.Text.Trim(), "['\";]+"))
                {
                    generalErrorMsg.Visible = true;
                    generalErrorMsg.Text = "Special Characters are not allowed";
                }
                else
                {
                    if (userAboutMeTxtBx.Text.Trim().Equals(""))
                    {
                        userAboutMeTxtBx.Text = "Unspecified";
                    }
                    if (userLocationTxtBx.Text.Trim().Equals(""))
                    {
                        userLocationTxtBx.Text = "Unspecified";
                    }
                    if (userLikesTxtBx.Text.Trim().Equals(""))
                    {
                        userLikesTxtBx.Text = "Unspecified";
                    }
                    if (userDislikesTxtBx.Text.Trim().Equals(""))
                    {
                        userDislikesTxtBx.Text = "Unspecified";
                    }

                    // If no new password was provided, retain old password
                    if (userPasswordTxtBx.Text == "")
                    {
                        query = "update userData set firstname = '" +
                        userFirstNameTxtBx.Text.Trim() + "', lastname = '" +
                        userLastNameTxtBx.Text.Trim() + "', username = '" +
                        userUsernameTxtBx.Text.Trim() + "', emailaddress = '" +
                        userEmailTxtBx.Text.Trim() + "', gender = '" +
                        userGenderDropDown.SelectedValue.Trim() + "', profileimg = '" +
                        userPPImg.ImageUrl.Trim() + "', location = '" +
                        userLocationTxtBx.Text.Trim() + "', aboutme = '" +
                        userAboutMeTxtBx.Text.Trim() + "', likes = '" +
                        userLikesTxtBx.Text.Trim() + "', dislikes = '" +
                        userDislikesTxtBx.Text.Trim() + "', phonenumber = '" +
                        userPhoneNumberTxtBx.Text.Trim() + "', weight = '" +
                        userWeightTxtBx.Text.Trim() + "', height = '" +
                        userHeightTxtBx.Text.Trim() + "', dateofbirth = '" +
                        userDoBTxtBx.Text.Trim() + "', updatedAt = '" +
                        DateTime.UtcNow.ToString("yyyy-MM-dd hh:mm:ss") + "' where username = '" +
                        Session["username"] + "'";
                    }
                    else // Otherwise, a new password is provided and should be updated. Remember to handle validation for new password insertion
                    {
                        query = "update userData set firstname = '" +
                        userFirstNameTxtBx.Text.Trim() + "', lastname = '" +
                        userLastNameTxtBx.Text.Trim() + "', username = '" +
                        userUsernameTxtBx.Text.Trim() + "', emailaddress = '" +
                        userEmailTxtBx.Text.Trim() + "', gender = '" +
                        userGenderDropDown.SelectedValue.Trim() + "', profileimg = '" +
                        userPPImg.ImageUrl.Trim() + "', location = '" +
                        userLocationTxtBx.Text.Trim() + "', aboutme = '" +
                        userAboutMeTxtBx.Text.Trim() + "', likes = '" +
                        userLikesTxtBx.Text.Trim() + "', dislikes = '" +
                        userDislikesTxtBx.Text.Trim() + "', phonenumber = '" +
                        userPhoneNumberTxtBx.Text.Trim() + "', weight = '" +
                        userWeightTxtBx.Text.Trim() + "', height = '" +
                        userHeightTxtBx.Text.Trim() + "', dateofbirth = '" +
                        userDoBTxtBx.Text.Trim() + "', password = '" +
                        userPasswordTxtBx.Text.Trim() + "', updatedAt = '" +
                        DateTime.UtcNow.ToString("yyyy-MM-dd hh:mm:ss") + "' where username = '" +
                        Session["username"] + "'";
                    }

                    SqlCommand updateCmd = new SqlCommand(query, conn);
                    updateCmd.ExecuteNonQuery();

                    conn.Close();
                    Response.Redirect("userProfile.aspx");

                }
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

        protected void PasswordFormat(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length < 8)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
        protected void PasswordInserted(object source, ServerValidateEventArgs args)
        {
            if (!string.IsNullOrEmpty(userPasswordTxtBx.Text))
            {
                args.IsValid = args.Value == userRPasswordTxtBx.Text;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void PhoneNumberRegex(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Equals("Unspecified"))
            {
                args.IsValid = true;

            }
            else if (!Regex.IsMatch(args.Value, "^(\\+?6?01)[0-46-9]-*[0-9]{7,8}$"))
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

    }
}