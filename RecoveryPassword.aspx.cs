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
    public partial class RecoveryPassword : System.Web.UI.Page
    {
        String GUIDValue;
        DataTable dt = new DataTable();
        int Uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                GUIDValue = Request.QueryString["id"];
                if (GUIDValue != null)
                {
                    SqlCommand cmd = new SqlCommand("select * from ForgotPass where Id=@id", con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@id", GUIDValue);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    if (dt.Rows.Count!=0)
                    {
                        Uid = Convert.ToInt32(dt.Rows[0][1]);
                    }
                    else
                    {
                        LblMsg.Visible = true;
                        LblMsg.Text = "Your Password Reset link is Expired or Invalid.";
                    }
                   
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }

            }
            if (!IsPostBack)
            {

                if (dt.Rows.Count != 0)
                {
                    TextCPass.Visible = true;

                    Button2.Visible = true;
                    TextNewPass.Visible = true;
                    Rest.Visible = true;
                }
                else
                {
                    LblMsg.Visible = true;
                    LblMsg.Text = "Your Password Reset link is Expired or Invalid.";
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextNewPass.Text!="" && TextCPass.Text!="" && TextNewPass.Text==TextCPass.Text)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("Update tblUsers set Password=@pwd where Uid= @Uid", con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@pwd", TextNewPass.Text);
                    cmd.Parameters.AddWithValue("@Uid", Uid);



                    SqlCommand cmd2 = new SqlCommand("delete from ForgotPass where Uid='" + Uid + "'", con);
                    cmd2.ExecuteNonQuery();
                    Response.Write("<script>alert ('Sucessfully Reset Password')</script>");
                    Response.Redirect("~/SignIn.aspx");
                }
            }
        }
    }
}
    

