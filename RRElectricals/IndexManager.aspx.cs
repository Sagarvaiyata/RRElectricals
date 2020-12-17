using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RRElectricals
{
    public partial class IndexManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM CompanyDetails", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    AimTextbox.Text = dr[0].ToString();
                    Numberofprojects.Text = dr[1].ToString();
                    Numberofhappyclients.Text = dr[2].ToString();
                    Numberofcertifications.Text = dr[3].ToString();
                    Numberofcountries.Text = dr[4].ToString();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO CompanyDetails VALUES('Enter a Caption Line',0,0,0,0)",con);
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            } 
        }

        protected void AimButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("UPDATE CompanyDetails SET CaptionLine=@CaptionLine", con);
            cmd.Parameters.AddWithValue("@CaptionLine", AimTextbox.Text);
            if (con.State != ConnectionState.Open)
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void ImageSave_Click(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFile)
                return;
            if(FileUpload1.FileName.EndsWith(".jpg") || FileUpload1.FileName.EndsWith(".png"))
            {
                try
                {
                    if(FileUpload1.FileName.EndsWith(".jpg"))
                        FileUpload1.SaveAs(Server.MapPath("~/BannerImages/") + SelectBanner.SelectedValue + ".jpg");
                    else
                        FileUpload1.SaveAs(Server.MapPath("~/BannerImages/") + SelectBanner.SelectedValue + ".png");
                }
                catch(Exception)
                {
                    Response.Write("<script>alert('Error while uploading you image');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('File Format not Supported');</script>");
            }

        }

        protected void SaveNumberofprojects_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Update CompanyDetails SET NumOfProjects=@NumOfProjects", con);
            cmd.Parameters.AddWithValue("@NumOfProjects", Numberofprojects.Text);
            if (con.State != ConnectionState.Open)
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void SaveNumberofcertifications_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Update CompanyDetails SET NumOfCertification=@NumOfCertification", con);
            cmd.Parameters.AddWithValue("@NumOfCertification", Numberofcertifications.Text);
            if (con.State != ConnectionState.Open)
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void SaveNumberofhappyclients_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Update CompanyDetails SET NumOfHappyClients=@NumOfHappyClients", con);
            cmd.Parameters.AddWithValue("@NumOfHappyClients", Numberofhappyclients.Text);
            if (con.State != ConnectionState.Open)
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }


        protected void SaveNumberofcountries_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Update CompanyDetails SET NumOfCountries=@NumOfCountries", con);
            cmd.Parameters.AddWithValue("@NumOfCountries", Numberofcountries.Text);
            if (con.State != ConnectionState.Open)
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}