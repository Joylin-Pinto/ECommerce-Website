using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contact.aspx");
            string message = "Please call us at 1-800-123-4567";
            string script = "alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, GetType(), "CallMessage", script, true);

        }
    }
}