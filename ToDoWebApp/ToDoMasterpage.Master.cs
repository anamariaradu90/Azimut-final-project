using System;

namespace ToDoWebApp
{
    public partial class ToDoMasterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LoginBtn.Visible = true;
                    LogoutBtn.Visible = false;
                    ListBtn.Visible = false;
                    UsersBtn.Visible = false;
                    TaskBtn.Visible = false;
                    HelloUserBtn.Visible = false;
                    HelloUserBtn.OnClientClick = null;
                    Clock.Visible = true;
                    Clock.Text = DateTime.Now.ToLongDateString();

                }
                else if (Session["role"].Equals("user"))
                {
                    LoginBtn.Visible = false;
                    LogoutBtn.Visible = true;
                    ListBtn.Visible = true;
                    UsersBtn.Visible = false;
                    TaskBtn.Visible = false;
                    HelloUserBtn.Visible = true;
                    HelloUserBtn.Text = "Hello " + Session["first_name"].ToString();
                    Clock.Text = DateTime.Now.ToLongDateString();
                }
                else if (Session["role"].Equals("admin"))
                {
                    LoginBtn.Visible = false;
                    LogoutBtn.Visible = true;
                    ListBtn.Visible = true;
                    UsersBtn.Visible = true;
                    TaskBtn.Visible = true;
                    HelloUserBtn.Visible = true;
                    HelloUserBtn.Text = "Hello " + Session["first_name"].ToString();
                    Clock.Text = DateTime.Now.ToLongDateString();
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }

        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Home.aspx");

        }
        protected void HelloUser(object sender, EventArgs e)
        {

        }

        protected void Tasks(object sender, EventArgs e)
        {
            Server.Transfer("Tasks.aspx");
        }

        protected void List(object sender, EventArgs e)
        {
            Server.Transfer("List.aspx");
        }
        protected void Users(object sender, EventArgs e)
        {
            Server.Transfer("Users.aspx");
        }

        protected void Login(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }

        protected void HelloUserBtn_Click(object sender, EventArgs e)
        {
            Server.Transfer("UserDetails.aspx");
        }
    }
}