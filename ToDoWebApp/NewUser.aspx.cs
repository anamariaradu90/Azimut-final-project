using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ToDoWebApp
{
    public partial class NewUser : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["todoDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveUser_Click(object sender, EventArgs e)
        {
            if (checkExistingUser())
            {
                Response.Write("<script>alert('user allready exists. try new username');</script>");
            }
            else
            {
                addNewUser();
            }
        }

        protected void addNewUser()
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                SqlCommand command = new SqlCommand("INSERT INTO users(username,first_name,last_name,role,password) VALUES(@username,@first_name,@last_name,@role,@password)", connection);
                command.Parameters.AddWithValue("@username", Username.Text.Trim());
                command.Parameters.AddWithValue("@first_name", FirstName.Text.Trim());
                command.Parameters.AddWithValue("@last_name", LastName.Text.Trim());
                command.Parameters.AddWithValue("@role", DropDownList1.SelectedItem.Value);
                command.Parameters.AddWithValue("@password", Password.Text.Trim());
                command.ExecuteNonQuery();
                connection.Close();
                //Response.Write("<script>alert('user successfully created');</script>");\
                Response.Redirect("Users.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        bool checkExistingUser()
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }

                SqlCommand command = new SqlCommand("SELECT * FROM users WHERE username='" + Username.Text.Trim() + "'", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
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