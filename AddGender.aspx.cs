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
    public partial class AddGender : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGenderRepeater();
        }
        private void BindGenderRepeater()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblGender", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        RepeaterCGender.DataSource = dt;
                        RepeaterCGender.DataBind();
                    }
                }
            }
        }
        protected void AddGenBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tblGender(GenderName) Values('" + TxtGender.Text + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Gender Added Sucessfully')</script>");
                TxtGender.Text = "";
                con.Close();
                TxtGender.Focus();
            }
            BindGenderRepeater();
        }
    }
}