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

namespace awerkout
{
    public partial class createContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            generalErrorMsg.Visible = false;
            if (Session["username"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
            {
                // Do nothing
            }
            else
            {
                Response.Redirect("signInPage.aspx");
            }

            if (!Page.IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();

                string query = "select * from userData where username = '" +
                    Session["username"] + "'";
                SqlDataAdapter profileDataAdapter = new SqlDataAdapter(query, conn);
                DataTable profileDataTable = new DataTable();
                profileDataAdapter.Fill(profileDataTable);

                userIDLbl.Text = Session["usertype"].ToString().Trim() == "ADMIN" ? "ADMIN " + profileDataTable.Rows[0][0].ToString() : "USER " + profileDataTable.Rows[0][0].ToString();

                conn.Close();

            }
        }

        protected void contentCreatePostBtn_Click(object sender, EventArgs e)
        {
            string folderPathStr = "~/ContentPic/";

            // for file upload 
            string folderPath = Server.MapPath(folderPathStr);

            string contentdata;

            // check if dir exists
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath); // create one if not exist
            }

            // No banner pic was uploaded
            if (contentBannerFileUpload.FileName == "")
            {
                contentdata = "bannerPath=" + folderPathStr + "default.jpg;";
            }
            else // Banner pic attached
            {
                string fileExt = Path.GetExtension(contentBannerFileUpload.FileName);

                string newFileName = commonFunction.getRandomHexNumber(6);
                // save file to dir
                contentBannerFileUpload.SaveAs(folderPath + Path.GetFileName(newFileName) + fileExt);

                // display the pic in img control
                string bannerFileName = folderPathStr + Path.GetFileName(newFileName) + fileExt;

                contentdata = "bannerPath=" + bannerFileName + ";";
            }


            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConn"].ConnectionString);
                conn.Open();

                // Creating the record in the table called postData
                string createQuery = "insert into postData (userID, " +
                    "postTitle, " +
                    "postDescription, " +
                    "contentdata ) values (@userID," +
                    "@postTitle, " +
                    "@postDescription, " +
                    "@contentdata)";
                SqlCommand createCMD = new SqlCommand(createQuery, conn);

                createCMD.Parameters.AddWithValue("@userID", Session["userID"]);
                createCMD.Parameters.AddWithValue("@postTitle", Server.HtmlEncode(contentTitleTxtBx.Text.Trim()));
                createCMD.Parameters.AddWithValue("@postDescription", Server.HtmlEncode(contentTextTxtBx.Text.Trim()));
                createCMD.Parameters.AddWithValue("@contentdata", Server.HtmlEncode(contentdata));
                createCMD.ExecuteNonQuery();
                Response.Redirect("createContent.aspx");

                conn.Close();
            }
            catch (Exception ex)
            {
                generalErrorMsg.Visible = true;
                generalErrorMsg.ForeColor = System.Drawing.Color.Red;
                generalErrorMsg.Text = "Post creation failed!" + ex.ToString();
            }
        }

        protected void myDashboardlnk_Click(object sender, EventArgs e)
        {
            // Only admin has access to this site
            Response.Redirect("adminDashboard.aspx");

        }

        protected void signOutlnk_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Request.Cookies.Clear();

            Response.Redirect("signInPage.aspx");
        }

    }
}