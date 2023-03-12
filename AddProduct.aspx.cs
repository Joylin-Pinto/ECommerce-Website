using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Project
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrand();
                BindGender();
                BindMainCategory();
                ddlSubCategory.Enabled = false;
                ddlGender.Enabled = false;
                //BindSize();

            }
        }

        private void BindSize()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblSize", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddlBrand.DataSource = dt;
                    ddlBrand.DataTextField = "SizeName";
                    ddlBrand.DataValueField = "SizeID";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));
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
       
        protected void BtnAdd_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                
                
                SqlCommand cmd = new SqlCommand("sp_InsertProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PName",TextBox1.Text);
                cmd.Parameters.AddWithValue("@PPrice",TxtPrice.Text);
                cmd.Parameters.AddWithValue("@PsellPrice",TxtSPrice.Text);
                cmd.Parameters.AddWithValue("@PBrandID",ddlBrand.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PCategoryID",ddlCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PSubCatID",ddlSubCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PGender", ddlGender.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PDescription", TextArea1.InnerText);
                cmd.Parameters.AddWithValue("@PProductDetails", PdDetails.Text);
                cmd.Parameters.AddWithValue("@PMaterialCare", txtMatCare.Text);
                if(chFd.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@FreeDelivery", 1.ToString());
                }
                else
                        {
                        cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());

                }

                if (chret.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@30DayRet", 1.ToString());
                }
                else
                {
                    
                        cmd.Parameters.AddWithValue("@30DayRet", 0.ToString());

                }
                if (cbCod.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@COD", 1.ToString());
                }
                else
                {

                    cmd.Parameters.AddWithValue("@COD", 0.ToString());

                }
                con.Open();
                Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

                for (int i = 0; i < cblSize.Items.Count; i++)
                {
                    if (cblSize.Items[i].Selected == true)
                    {
                        Int64 SizeID = Convert.ToInt64(cblSize.Items[i].Value);
                        int Quantity = Convert.ToInt32(TxtQty.Text);

                        SqlCommand cmd2 = new SqlCommand("insert into tblProductQuantity(PID,SizeID,Quantity) values(@PID,@SizeID,@Quantity)", con);
                        cmd2.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                        cmd2.Parameters.AddWithValue("@SizeID", Convert.ToInt32(SizeID));
                        cmd2.Parameters.AddWithValue("@Quantity", Convert.ToInt32(Quantity));
                        cmd2.ExecuteNonQuery();
                    }
                }
                if (Fuimg01.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    String Extension = Path.GetExtension(Fuimg01.PostedFile.FileName);
                    Fuimg01.SaveAs(SavePath + "\\" + TextBox1.Text.ToString().Trim() + "01" + Extension);
                    SqlCommand cmd3 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + TextBox1.Text.ToString().Trim() + "01" + "','" + Extension + "')", con);
                    cmd3.ExecuteNonQuery();
                }

                if (Fuimg02.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    String Extension = Path.GetExtension(Fuimg02.PostedFile.FileName);
                    Fuimg02.SaveAs(SavePath + "\\" + TextBox1.Text.ToString().Trim() + "02" + Extension);
                    SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + TextBox1.Text.ToString().Trim() + "02" + "','" + Extension + "')", con);
                    cmd4.ExecuteNonQuery();
                }
                if (Fuimg04.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    String Extension = Path.GetExtension(Fuimg04.PostedFile.FileName);
                    Fuimg04.SaveAs(SavePath + "\\" + TextBox1.Text.ToString().Trim() + "03" + Extension);
                    SqlCommand cmd5 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + TextBox1.Text.ToString().Trim() + "03" + "','" + Extension + "')", con);
                    cmd5.ExecuteNonQuery();
                }
                if (Fuimg05.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    String Extension = Path.GetExtension(Fuimg05.PostedFile.FileName);
                    Fuimg05.SaveAs(SavePath + "\\" + TextBox1.Text.ToString().Trim() + "04" + Extension);
                    SqlCommand cmd6 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + TextBox1.Text.ToString().Trim() + "04" + "','" + Extension + "')", con);
                    cmd6.ExecuteNonQuery();
                }
                Response.Write("<script>alert('Product Added Successfully!')</script>");
                Prodclear();
                Response.Redirect("~/AddProduct.aspx");

            }
        }

        private void Prodclear()
        {
            TextBox1.Text = "";
            TxtPrice.Text = "";
            TxtQty.Text = "";
            txtMatCare.Text = "";
            cblSize.SelectedItem.Value = "--Select--";
            chFd.Checked = false;
            chret.Checked = false;
            ddlBrand.SelectedItem.Value = "--Select--";
            ddlCategory.SelectedItem.Value = "--Select--";
            ddlSubCategory.Enabled = false;
            ddlGender.Enabled=false;
            TxtSPrice.Text = "";
            PdDetails.Text = "";
            
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MainCategoryId = Convert.ToInt32(ddlCategory.SelectedItem.Value);
            ddlSubCategory.Enabled = true;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatId = '" + ddlCategory.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlSubCategory.DataSource = dt;
                    ddlSubCategory.DataTextField = "SubCatName";
                    ddlSubCategory.DataValueField = "SubCatID";
                    ddlSubCategory.DataBind();
                    ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
        { 
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblSize where BrandId = '" + ddlBrand.SelectedItem.Value + "' and CategoryId = '" + ddlCategory.SelectedItem.Value + "' and SubCategory = '" + ddlSubCategory.SelectedItem.Value + "' and GenderId = '" + ddlGender.SelectedItem.Value + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                cblSize.DataSource = dt;
                cblSize.DataTextField = "SizeName";
                cblSize.DataValueField = "SizeID";
                cblSize.DataBind();
            }
        }

    }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSubCategory.SelectedIndex != 0)
            {
                ddlGender.Enabled = true;
            }
            else
            {
                ddlGender.Enabled = false;
            }
        }
    }
}
