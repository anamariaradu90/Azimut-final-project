using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToDoWebApp
{
    public partial class ImageUpload : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["todoDBConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void FileUpload1_DataBinding(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FileUpload();
        }
        protected void FileUpload()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            if (FileUpload1.HasFile)
            {
                connection.Open();
                FileUpload1.SaveAs(Server.MapPath(".") + "/images/" + FileUpload1.FileName);
                string username = Session["username"].ToString();
                string updateString = @"UPDATE users SET imageUrl = @txtFile WHERE username='" + username + "'";
                SqlCommand command = new SqlCommand(updateString, connection);
                
                command.Parameters.AddWithValue("@username", username.ToString());
                command.Parameters.AddWithValue("@txtFile", FileUpload1.FileName);
                command.ExecuteNonQuery();
                
                Server.Transfer("UserDetails.aspx");

            }
        }
    }
}