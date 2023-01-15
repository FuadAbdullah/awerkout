using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace awerkout
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void homelnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("Awerkout.aspx");
        }

        protected void planslnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("WorkoutPlan.aspx");
        }

        protected void guideslnk_Click(object sender, EventArgs e)
        {
            Response.Redirect("guide.aspx");
        }
    }
}