<%@ Page Title="" Language="C#" MasterPageFile="~/ToDoMasterpage.Master" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" Inherits="ToDoWebApp.NewUser" %>

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
                                    <img width="300" src="images/user.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mt-1">
                                <center>
                                    <h4>New user</h4>
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
                                    <asp:Label ID="Label1" runat="server" Text="First name:"></asp:Label>&nbsp;
                                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter first name!" ControlToValidate="FirstName"></asp:RequiredFieldValidator>
                                    <asp:TextBox CssClass="form-control" ID="FirstName" runat="server" placeholder="First name"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" Text="Last name:"></asp:Label>&nbsp;
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" ErrorMessage="Please enter last name!" ControlToValidate="LastName"></asp:RequiredFieldValidator>
                                    <asp:TextBox CssClass="form-control" ID="LastName" runat="server" placeholder="Last name"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" Text="Username:"></asp:Label>&nbsp;
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" ErrorMessage="Please enter username!" ControlToValidate="Username"></asp:RequiredFieldValidator>
                                    <asp:TextBox CssClass="form-control" ID="Username" runat="server" placeholder="Username"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" Text="Password:"></asp:Label>&nbsp;
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" ErrorMessage="Please enter password!" ControlToValidate="Password"></asp:RequiredFieldValidator>
                                    <asp:TextBox CssClass="form-control" ID="Password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" Text="Role:"></asp:Label>&nbsp;
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:todoDBConnectionString %>" SelectCommand="SELECT [role] FROM [users]"></asp:SqlDataSource>
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="role" DataValueField="role"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-success btn-block" ID="SaveUser" runat="server" Text="Save" OnClick="SaveUser_Click"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
