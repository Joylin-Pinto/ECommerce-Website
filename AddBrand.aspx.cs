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
    public partial class AddBrand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrandRepeater();

            }

        }

        private void BindBrandRepeater()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblBrands", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        RepeaterBrands.DataSource = dt;
                        RepeaterBrands.DataBind();
                    }
                }
            }
        }

        protected void AddBrandBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tblBrands(Name) Values('" + TxtBrand.Text + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Brand Added Sucessfully')</script>");
                
                TxtBrand.Text = "";
                con.Close();
                TxtBrand.Focus();
            }
            BindBrandRepeater();
        }
    }
}
