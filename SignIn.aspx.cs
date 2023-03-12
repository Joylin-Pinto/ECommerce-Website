using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Project
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.Cookies["UNAME"]!=null && Request.Cookies["UPWD"]!=null)
                {
                    TextBox1.Text = Request.Cookies["UNAME"].Value;
                    TextBox3.Text = Request.Cookies["UPWD"].Value;
                    CheckBox1.Checked = true;

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString)) 
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblUsers where Username=@user and Password=@pwd", con);
                cmd.Parameters.AddWithValue("@user", TextBox1.Text);
                cmd.Parameters.AddWithValue("@pwd", TextBox3.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count !=0)
                {
                        Session["USERID"] = dt.Rows[0]["Uid"].ToString();
                        Session["USEREMAIL"] = dt.Rows[0]["Email"].ToString();
                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);

                    if (CheckBox1.Checked)
                    {
                        Response.Cookies["UNAME"].Value = TextBox1.Text;
                        Response.Cookies["UPWD"].Value = TextBox3.Text;

                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(100);
                        Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(100);
                    }
                    else
                    {
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);
                    }

                    string Utype;
                    Utype = dt.Rows[0][4].ToString().Trim();
                    if (Utype == "User")
                    {
                        Session["Username"] = TextBox1.Text;
                        Response.Redirect("~/UserHome.aspx");
                    }
                    else if(Utype=="Admin")
                    {
                        Session["Username"] = TextBox1.Text;
                        Response.Redirect("~/AdminHome.aspx");
                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Invalid Crendetials";
                }
                
                clr();
                con.Close();
            }
        }

        private void clr()
        {
            TextBox1.Text = "";
            TextBox3.Text = "";
            TextBox1.Focus();
        }
    }
}