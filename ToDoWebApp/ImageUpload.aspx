<%@ Page Title="" Language="C#" MasterPageFile="~/ToDoMasterpage.Master" AutoEventWireup="true" CodeBehind="ImageUpload.aspx.cs" Inherits="ToDoWebApp.ImageUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceholder" runat="server">
    <section class="vh-100">
        <div class="container py-5 h-75">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-lg-6 mb-4 mb-lg-0">
                    <div class="card mb-3" style="border-radius: .5rem;">
                        <div class="row g-5">
                            
                            &nbsp;&nbsp;&nbsp;
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="w-75 m-5 container" OnDataBinding="FileUpload1_DataBinding" />
                            <br />
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" CssClass="btn btn-outline-secondary container w-75" />
                            <br />
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Nu ati selectat un fisier pentru upload!" ControlToValidate="FileUpload1" CssClass="alert alert-danger container text-center w-75 mt-2"> </asp:RequiredFieldValidator>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
