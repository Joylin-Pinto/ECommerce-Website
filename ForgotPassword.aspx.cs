using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;

namespace Project
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblUsers where Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", TextBox1.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    String myGUID = Guid.NewGuid().ToString();
                    int Uid = Convert.ToInt32(dt.Rows[0][0]);
                    SqlCommand cmd1 = new SqlCommand("insert into ForgotPass(Id, Uid,RequestDateTime) values('" + myGUID + "','" + Uid + "', GETDATE())",con);
                    cmd1.ExecuteNonQuery();
                    //Send Recovery Link
                    String ToEmailAdress = dt.Rows[0][2].ToString();
                    String Username = dt.Rows[0][1].ToString();
                    String EmailBody = "Hi, " + Username + " ," + "<br/><br/>Click the link below to reset your password<br/> http://localhost:4197/RecoveryPassword.aspx?id="+myGUID;

                    MailMessage PassRecMail = new MailMessage("ssportshubb@gmail.com", ToEmailAdress);
                    PassRecMail.Body = EmailBody;
                    PassRecMail.IsBodyHtml = true;
                    PassRecMail.Subject = "Reset Password";
                    using (SmtpClient client = new SmtpClient())
                    {
                        client.EnableSsl = true;
                        client.UseDefaultCredentials = false;
                        client.Credentials = new NetworkCredential("ssportshubb@gmail.com", "wtrnxwuvxwsitted");
                        client.Host = "smtp.gmail.com";
                        client.Port = 587;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.Send(PassRecMail);
                    }

                    lblReset.Text = "Reset link sent, Please check your email";
                    lblReset.ForeColor = System.Drawing.Color.LightGreen;
                    TextBox1.Text = "";
                }
                else
                {
                    lblReset.Text = "Oops! this password does not exit!";
                    lblReset.ForeColor = System.Drawing.Color.Red;
                    TextBox1.Text = "";
                    TextBox1.Focus();
                }
            }
        }
    }
}