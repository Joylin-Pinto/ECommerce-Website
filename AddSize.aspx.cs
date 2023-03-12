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
    public partial class AddSize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGender();
                BindBrand();
                BindMainCategory();
                BindRepeaterSize();

            }
        }

        private void BindRepeaterSize()
        {
           
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.*,D.*,E.* from tblSize A inner join tblCategory B on B.CatId=A.CategoryId inner join tblBrands C on C.BrandId=A.BrandID inner join tblSubCategory D on D.SubCatID=A.SubCategory inner join tblGender E on E.GenderID = A.GenderId", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            RepeaterSize.DataSource = dt;
                            RepeaterSize.DataBind();
                        }
                    
                }
            }
        }

        private void BindMainCategory()
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
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatId";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                }


            }
        }
        private void BindBrand()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblBrands", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddlBrand.DataSource = dt;
                    ddlBrand.DataTextField = "Name";
                    ddlBrand.DataValueField = "BrandId";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));
                }


            }
        }

        private void BindGender()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblGender with(nolock)", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddlGender.DataSource = dt;
                    ddlGender.DataTextField = "GenderName";
                    ddlGender.DataValueField = "GenderID";
                    ddlGender.DataBind();
                    ddlGender.Items.Insert(0, new ListItem("-Select-", "0"));
                }


            }
        }
        protected void AddSizetBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblSize(SizeName, BrandID, CategoryId, SubCategory, GenderId) Values('" + TxtSize .Text + "', '" + ddlBrand .SelectedItem.Value + "', '" + ddlCategory .SelectedItem.Value + "', '" + ddlSubCategory .SelectedItem.Value + "', '" + ddlGender .SelectedItem.Value + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Size Added Sucessfully')</script>");
                TxtSize.Text = "";
                con.Close();
                ddlBrand.ClearSelection();
                ddlBrand.Items.FindByValue("0").Selected = true;

                ddlCategory.ClearSelection();
                ddlCategory.Items.FindByValue("0").Selected = true;

                ddlSubCategory.ClearSelection();
                ddlSubCategory.Items.FindByValue("0").Selected = true;

                ddlGender.ClearSelection();
                ddlGender.Items.FindByValue("0").Selected = true;
            }
            BindRepeaterSize();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MainCategoryId = Convert.ToInt32(ddlCategory.SelectedItem.Value);
           
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatId = '" + ddlCategory.SelectedItem.Value +"'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        ddlSubCategory.DataSource = dt;
                    ddlSubCategory.DataTextField = "SubCatName";
                    ddlSubCategory.DataValueField = "SubCatID";
                    ddlSubCategory.DataBind();
                    ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                    }
            }
        }
    }
}