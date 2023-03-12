using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCartNumber();
            if (Session["Username"] != null)
            {
                SignUpBtn.Visible = false;
                SignIntBtn.Visible = false;
                btnlogout.Visible = true;
            }
            else
            {
                SignUpBtn.Visible = true;
                SignIntBtn.Visible = true;
                btnlogout.Visible = false;
                //Response.Redirect("~/SignIn.aspx");
            }
            BindCartNumber();
        }
        public void BindCartNumber()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] ProductArray = CookiePID.Split(',');
                int ProductCount = ProductArray.Length;
            }
            else
            {
                pCount.InnerText = 0.ToString();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("~/Default.aspx");
            
        }
    }
}