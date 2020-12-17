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
    public partial class ReviewsManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Reviews", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ReviewsRepeater.DataSource=dt;
            ReviewsRepeater.DataBind();
        }

        protected void SubmitReview_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("INSERT INTO Reviews VALUES(@Review,@OwnerName,@CompanyName);", con);
            cmd.Parameters.AddWithValue("@CompanyName", CompanyName.Text);
            cmd.Parameters.AddWithValue("@OwnerName", OwnerName.Text);
            cmd.Parameters.AddWithValue("@Review", Review.Text);            

            if (con.State != ConnectionState.Open)
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Review Registered');</script>");
            Response.Redirect("ProductManager.aspx");
        }

        protected void Delete_Command(object sender, CommandEventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("DELETE FROM Reviews WHERE Id=@Id", con);
            cmd.Parameters.AddWithValue("@Id", e.CommandArgument.ToString());
            if (con.State != ConnectionState.Open)
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Review Deleted');</script>");
            Response.Redirect("ReviewsManager.aspx");
        }
    }
}