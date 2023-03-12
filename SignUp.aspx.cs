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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(formvalid())
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into tblUsers(Username, Email, Password,Usertype) Values('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + TextBox3.Text + "','User')", con);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Registration Sucessfully Done')</script>");
                    Response.Redirect("~/SignIn.aspx");
                    clr();
                    con.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('Registration Failed')</script>");
                lblMsg.Visible = true;
                lblMsg.Text = "All fields are mandatory";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
           

        }

        private bool formvalid()
        {
            if(TextBox1.Text=="")
            {
                Response.Write("<script>alert('Enter valid username')</script>");
                TextBox1.Focus();
                return false;
            }
            else if (TextBox2.Text == "")
            {
                Response.Write("<script>alert('Enter valid email')</script>");
                TextBox2.Focus();
                return false;
            }
            else if (TextBox3.Text == "")
            {
                Response.Write("<script>alert('Enter valid password')</script>");
                TextBox3.Focus();
                return false;
            }
            else if (TextBox3.Text != TextBox4.Text)
            {
                Response.Write("<script>alert('Password mismatch')</script>");
                TextBox4.Focus();
                return false;
            }
            else if (TextBox4.Text == "")
            {
                Response.Write("<script>alert('Enter valid password')</script>");
                TextBox4.Focus();
                return false;
            }
            return true;
        }
        private void clr()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }

    }
}