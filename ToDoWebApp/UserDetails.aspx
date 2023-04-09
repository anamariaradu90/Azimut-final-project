<%@ Page Title="" Language="C#" MasterPageFile="~/ToDoMasterpage.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="ToDoWebApp.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceholder" runat="server">
    <section class="vh-100">
        <div class="container py-5 h-75">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-lg-6 mb-4 mb-lg-0">
                    <div class="card mb-3" style="border-radius: .5rem;">
                        <div class="row g-0">
                            <div class="col-md-4 gradient-custom text-center text-white"
                                style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                <asp:Image ID="Image1" runat="server" alt="Avatar" class="img-fluid my-5" Style="width: 130px;" Height="110" ImageUrl="*" />
                                
                                <br />
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/image-gallery.png" Width="20" Height="20" OnClick="ImageButton1_Click" />
                            </div>
                            <div class="col-md-8">
                                <div class="card-body p-4">
                                    <h6>About</h6>
                                    <hr class="mt-0 mb-4">
                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6>Last name</h6>
                                            <p class="text-muted">
                                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                            </p>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6>First name</h6>
                                            <p class="text-muted">
                                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                            </p>
                                        </div>
                                    </div>

                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6>Role</h6>
                                            <p class="text-muted">
                                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                            </p>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6>Username</h6>
                                            <p class="text-muted">
                                                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                            </p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
