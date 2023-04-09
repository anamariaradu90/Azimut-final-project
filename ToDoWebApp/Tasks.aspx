<%@ Page Title="" Language="C#" MasterPageFile="~/ToDoMasterpage.Master" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="ToDoWebApp.Tasks" %>

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
                <a class="nav-item nav-link active mt-2" href="NewTask.aspx">
                    <img src="images/new-file.png" width="25" height="25" />&nbsp;New task</a>
            </li>
        </ul>
    </div>

    <div class="container">
        <asp:GridView CssClass="container table" ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="task_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="task_name" HeaderText="Task name" SortExpression="task_name" />
                <asp:BoundField DataField="description" HeaderText="Task description" SortExpression="description" />
                <asp:TemplateField HeaderText="Designated to" SortExpression="designated_for">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="username" DataValueField="username" SelectedValue='<%# Bind("designated_for") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:todoDBConnectionString %>" SelectCommand="SELECT [username] FROM [users]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("designated_for") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="type" DataValueField="type" SelectedValue='<%# Bind("status") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:todoDBConnectionString %>" SelectCommand="SELECT [type] FROM [task_type]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("status") %>'></asp:Label>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:todoDBConnectionString %>" DeleteCommand="DELETE FROM [tasks] WHERE [task_id] = @task_id" InsertCommand="INSERT INTO [tasks] ([task_name], [description], [designated_for], [status]) VALUES (@task_name, @description, @designated_for, @status)" SelectCommand="SELECT * FROM [tasks]" UpdateCommand="UPDATE [tasks] SET [task_name] = @task_name, [description] = @description, [designated_for] = @designated_for, [status] = @status WHERE [task_id] = @task_id">
            <DeleteParameters>
                <asp:Parameter Name="task_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="task_name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="designated_for" Type="String" />
                <asp:Parameter Name="status" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="task_name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="designated_for" Type="String" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="task_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
