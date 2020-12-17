using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace RRElectricals
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("Select * from CompanyDetails", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataRow dr = dt.Rows[0];
            Aim.Text = dr[0].ToString();
            NoOfProjects.Text = dr[1].ToString();
            NoOfClients.Text = dr[2].ToString();
            NoOfCertificates.Text = dr[3].ToString();
            NoOfCountries.Text = dr[4].ToString();
        }
    }
}