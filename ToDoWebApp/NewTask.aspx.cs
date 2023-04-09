using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ToDoWebApp
{
    public partial class NewTask : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["todoDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveTask_Click(object sender, EventArgs e)
        {

            if (checkExistingTask())
            {
                Response.Write("<script>alert('task allready exists.');</script>");
            }
            else
            {
                createNewTask();

            }





        }
        protected void createNewTask()
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                SqlCommand command = new SqlCommand("INSERT INTO tasks(task_name, description,designated_for, status) VALUES(@task_name,@description,@designated_for, @status) ", connection);
                command.Parameters.AddWithValue("@task_name", TaskName.Text.Trim());
                command.Parameters.AddWithValue("@description", TaskDescription.Text.Trim());
                command.Parameters.AddWithValue("@designated_for", DropDownList1.SelectedValue);
                command.Parameters.AddWithValue("@status", DropDownList2.SelectedItem.Value);
                command.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        bool checkExistingTask()
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }

                SqlCommand command = new SqlCommand("SELECT * FROM tasks WHERE task_name='" + TaskName.Text.Trim() + "'", connection);
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