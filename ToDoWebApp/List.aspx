<%@ Page Title="" Language="C#" MasterPageFile="~/ToDoMasterpage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ToDoWebApp.List" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceholder" runat="server">

    <div class="container mb-2 mt-2">
        <ul class="navbar-nav me-auto mb-lg-0">
            <li class="nav-item">
                <button class="nav-item nav-link active mt-2" style="border:none;" onclick="print()" runat="server">
                    <img src="images/printer.png" style="width: 25px; height: 25px;" />
                </button>
            </li>
        </ul>
    </div>

    <div class="container">
        <asp:GridView ID="GridView1" CssClass="container table" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="task_id" DataSourceID="UserSessionData" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="task_name" HeaderText="Task name" SortExpression="task_name" />
                <asp:BoundField DataField="description" HeaderText="Task description" SortExpression="description" />
                <asp:BoundField DataField="designated_for" HeaderText="Designated to" SortExpression="designated_for" />
                <asp:TemplateField HeaderText="Status" SortExpression="status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="TaskType" DataTextField="type" DataValueField="type" SelectedValue='<%# Bind("status") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="TaskType" runat="server" ConnectionString="<%$ ConnectionStrings:todoDBConnectionString %>" SelectCommand="SELECT [type] FROM [task_type]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
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

        <asp:SqlDataSource ID="UserSessionData" runat="server" ConnectionString="<%$ ConnectionStrings:todoDBConnectionString %>" DeleteCommand="DELETE FROM [tasks] WHERE [task_id] = @task_id" InsertCommand="INSERT INTO [tasks] ([task_name], [description], [designated_for], [status]) VALUES (@task_name, @description, @designated_for, @status)" SelectCommand="SELECT * FROM [tasks] WHERE designated_for=@username and (status='in progress' or status='pending')" UpdateCommand="UPDATE [tasks] SET [status] = @status WHERE [task_id] = @task_id">
            <DeleteParameters>
                <asp:Parameter Name="task_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="task_name" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="designated_for" Type="String" />
                <asp:Parameter Name="status" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="username" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="task_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
