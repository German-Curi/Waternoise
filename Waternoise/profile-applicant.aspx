<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageApplicant.Master" AutoEventWireup="true" CodeBehind="profile-applicant.aspx.cs" Inherits="Waternoise.profile_applicant" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="form-title" style="text-align: left;">Configuración del Perfil</h2>
    <div class="catalog-container">             
        <div class="mb-3">
            <label for="txtUsername" class="form-label">Username</label>
            <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
        </div>
        
        <div class="mb-3">
            <label for="txtEmail" class="form-label">Email</label>
            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"  Enabled="false"></asp:TextBox>
        </div>
        
        <div class="mb-3">
            <label for="txtCreacion" class="form-label">Dirección</label>
            <asp:TextBox ID="txtCreacion" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
        </div>     
    </div>
</asp:Content>

