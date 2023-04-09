<%@ Page Title="" Language="C#" MasterPageFile="~/ToDoMasterpage.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="ToDoWebApp.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceholder" runat="server">

    <div class="container mb-2">
        <ul class="navbar-nav me-auto mb-lg-0">
            <li class="nav-item">
                <a class="nav-item nav-link active mt-2" href="NewUser.aspx">
                    <img src="images/new-file.png" width="25" height="25" />&nbsp;New user</a>
            </li>
        </ul>
    </div>

    <div class="container">
        <asp:GridView CssClass="container table" ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="user_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="first_name" HeaderText="First name" SortExpression="first_name" />
                <asp:BoundField DataField="last_name" HeaderText="Last name" SortExpression="last_name" />
                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                <asp:TemplateField HeaderText="Role" SortExpression="role">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="user_role" DataValueField="user_role" SelectedValue='<%# Bind("role") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:todoDBConnectionString %>" SelectCommand="SELECT [user_role] FROM [user_role]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("role") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="Options" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:todoDBConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [users] ([username], [first_name], [last_name], [role], [password]) VALUES (@username, @first_name, @last_name, @role, @password)" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE [users] SET [username] = @username, [first_name] = @first_name, [last_name] = @last_name, [role] = @role, [password] = @password WHERE [user_id] = @user_id">
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="first_name" Type="String" />
                <asp:Parameter Name="last_name" Type="String" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="first_name" Type="String" />
                <asp:Parameter Name="last_name" Type="String" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
