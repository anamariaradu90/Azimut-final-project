using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ToDoWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["todoDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_Click(object sender, EventArgs e)
        {

            if (checkUserLogin())
            {
                Response.Redirect("Home.aspx");
            }
            else if (checkAdminLogin())
            {
                Response.Redirect("Home.aspx");
            }
            else
            {

                TextBox2.Visible = true;
            }

        }

        // user
        protected bool checkUserLogin()
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM users WHERE username='" + Username.Text.Trim() + "' AND password='" + Password.Text.Trim() + "' AND role='user'", connection);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Session["username"] = reader.GetValue(1).ToString();
                        Session["first_name"] = reader.GetValue(2).ToString();
                        Session["role"] = reader.GetValue(4).ToString();

                    }
                    return true;

                }
                else
                {
                    return false;
                }



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        // admin
        protected bool checkAdminLogin()
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM users WHERE username='" + Username.Text.Trim() + "' AND password='" + Password.Text.Trim() + "' AND role='admin'", connection);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Session["username"] = reader.GetValue(1).ToString();
                        Session["first_name"] = reader.GetValue(2).ToString();
                        Session["role"] = reader.GetValue(4).ToString();
                    }
                    return true;
                }
                else
                {
                    return false;
                }



            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

    }
}