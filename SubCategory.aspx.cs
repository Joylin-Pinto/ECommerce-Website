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
    public partial class SubCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMainCat();
                BindRepeaterCat();

            }

        }

        private void BindRepeaterCat()
        {
           
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("select A.*,B.* from tblSubCategory A inner join tblCategory B on B.CatId = A.MainCatID", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            RepeaterSubCategory.DataSource = dt;
                            RepeaterSubCategory.DataBind();
                        }
                    }
            }
        }

        private void BindMainCat()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblCategory", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddlMainCat.DataSource = dt;
                    ddlMainCat.DataTextField = "CatName";
                    ddlMainCat.DataValueField = "CatID";
                    ddlMainCat.DataBind();
                    ddlMainCat.Items.Insert(0, new ListItem("-Select-", "0"));
                }
                

            }
        }

        protected void AddSubCatBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tblSubCategory(SubCatName, MainCatId) Values('" + TxtSubCat.Text + "','" + ddlMainCat.SelectedItem.Value +"')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Sub Category Added Sucessfully')</script>");

                TxtSubCat.Text = "";
                con.Close();
                ddlMainCat.ClearSelection();
                ddlMainCat.Items.FindByValue("0").Selected = true;
              
            }
            BindRepeaterCat();
        }
    }
}