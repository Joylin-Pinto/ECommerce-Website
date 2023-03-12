using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Project
{
    public partial class User : System.Web.UI.MasterPage

    {
        public static string CS = ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                //lblSuccess.Text = "Login Success, Welcome <b>" + Session["Username"].ToString() + "</b>";
                Button1.Visible = true;
                Button2.Visible = false;
                //BindCartNumber22();
                Button1.Text = "Welcome: " + Session["Username"].ToString().ToUpper();

            }
            else
            {
                Button1.Visible = false;
                Button2.Visible = true;
                //Response.Redirect("~/Default.aspx");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn.aspx");
            Session["Username"] = null;
        }
        public void BindCartNumber()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] ProductArray = CookiePID.Split(',');
                int ProductCount = ProductArray.Length;
                pCount.InnerText = ProductCount.ToString();
            }
            else
            {
                pCount.InnerText = 0.ToString();

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn.aspx");
        }
        public void BindCartNumber22()
        {
            if (Session["USERID"] != null)
            {
                string UserIDD = Session["USERID"].ToString();
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@UserID", UserIDD);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                            pCount.InnerText = CartQuantity;

                        }
                        else
                        {
                            pCount.InnerText = 0.ToString();
                        }
                    }
                }
            }
        }
    }
}