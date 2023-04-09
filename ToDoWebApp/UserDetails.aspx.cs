using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ToDoWebApp
{
    public partial class UserDetails : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["todoDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionVar())
            {
                Label1.Text = Session["first_name"].ToString();
                Label2.Text = Session["last_name"].ToString();
                Label3.Text = Session["role"].ToString();
                Label4.Text = Session["username"].ToString();
                Image1.ImageUrl ="~/images/"+Session["imageUrl"].ToString();
                
            }


        }
        protected bool SessionVar()
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT username, first_name, last_name, role, imageUrl FROM users WHERE username = '" + Session["username"] + "'", connection);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {

                    Session["username"] = reader["username"];
                    Session["first_name"] = reader["first_name"];
                    Session["last_name"] = reader["last_name"];
                    Session["role"] = reader["role"];
                    Session["imageUrl"] = reader["imageUrl"];


                }
                reader.Close();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ImageUpload.aspx");
        }
    }
}