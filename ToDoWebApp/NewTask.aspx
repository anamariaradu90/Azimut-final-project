<%@ Page Title="" Language="C#" MasterPageFile="~/ToDoMasterpage.Master" AutoEventWireup="true" CodeBehind="NewTask.aspx.cs" Inherits="ToDoWebApp.NewTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceholder" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="300" src="images/tasks.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>New task</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Task name:" ></asp:Label> &nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Enabled="true" runat="server" ErrorMessage="Please enter the task name" ControlToValidate="TaskName" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    <asp:TextBox CssClass="form-control mt-1" ID="TaskName" runat="server" placeholder="Task Name"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Task description:"></asp:Label>
                                    <asp:RequiredFieldValidator Enabled="true" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter task desciption" ControlToValidate="TaskDescription"></asp:RequiredFieldValidator>
                                    <asp:TextBox CssClass="form-control mt-1" ID="TaskDescription" runat="server" placeholder="Task description"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Designated to:"></asp:Label>
                                    <asp:DropDownList CssClass="form-control mt-1" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="username" DataValueField="username"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:todoDBConnectionString %>" SelectCommand="SELECT [username] FROM [users]"></asp:SqlDataSource>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Status:"></asp:Label>
                                    <asp:DropDownList CssClass="form-control mt-1" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="type" DataValueField="type"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:todoDBConnectionString %>" SelectCommand="SELECT [type] FROM [task_type]"></asp:SqlDataSource>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-success btn-block" ID="SaveTask" runat="server" Text="Save" OnClick="SaveTask_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
