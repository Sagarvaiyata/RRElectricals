using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RRElectricals
{
    public partial class ProductsManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Products",con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ProductsRepeater.DataSource = dt;
            ProductsRepeater.DataBind();
        }

        protected void AddProduct_Click(object sender, EventArgs e)
        {
            if (SelectCategory.SelectedIndex == 0)
                return;
            if(!ProductImage.HasFile && !(ProductImage.FileName.EndsWith(".jpg") || ProductImage.FileName.EndsWith(".png")))
            {
                Response.Write("<script>alert('Please Upload Image of format .jpg and .png');</script>");
                return;
            }
            else
            {
                try
                {
                    ProductImage.SaveAs(Server.MapPath("~/ProductImages/") + ProductImage.FileName);
                }                
                catch(Exception)
                {
                    Response.Write("<script>alert('catch block');</script>");
                }
            }
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("INSERT INTO Products VALUES(@CompanyName,@Type,@ImgUrl,@Description);", con);
            cmd.Parameters.AddWithValue("@CompanyName", CompanyName.Text);
            cmd.Parameters.AddWithValue("@Type",SelectCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@ImgUrl",ProductImage.FileName);
            cmd.Parameters.AddWithValue("@Description",Description.Text);
            
            if (con.State != ConnectionState.Open)
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Product Added');</script>");
            Response.Redirect("ProductManager.aspx");
        }

        protected void View_Command(object sender, CommandEventArgs e)
        {

        }
                      

        protected void Delete_Command(object sender, CommandEventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE Id=@Id", con);
            cmd.Parameters.AddWithValue("@Id", e.CommandArgument.ToString());
            if (con.State != ConnectionState.Open)
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Product Deleted');</script>");
            Response.Redirect("ProductsManager.aspx");
        }
    }
}