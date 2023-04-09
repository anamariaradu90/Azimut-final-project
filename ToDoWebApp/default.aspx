<%@ Page Title="" Language="C#" MasterPageFile="~/ToDoMasterpage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ToDoWebApp.Home" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContentPlaceholder" runat="server">

    <div class="container card mt-3 w-50">
        <img src="/images/image.jpeg" class="container mt-3" alt="logo">

        <div class="card-body start-50">
            <p class="card-text ">Wellcome to my ToDo project! :)</p>
        </div>
    </div>

</asp:Content>
