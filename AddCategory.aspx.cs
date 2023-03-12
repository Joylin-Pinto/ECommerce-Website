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
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCategory();
        }

        private void BindCategory()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from tblCategory", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        RepeaterCategory.DataSource = dt;
                        RepeaterCategory.DataBind();
                    }
                }

            }
        }

        protected void AddCategoryBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tblCategory(CatName) Values('" + TxtCategory.Text + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Category Added Sucessfully')</script>");
                TxtCategory.Text = "";
                con.Close();
                TxtCategory.Focus();
            }
            BindCategory();
        }
    }
}