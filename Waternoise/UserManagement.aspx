<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="Waternoise.UserManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Gestión de Usuarios</h2>
    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="Username" HeaderText="Nombre de Usuario" />
            <asp:BoundField DataField="Email" HeaderText="Correo Electrónico" />
            <asp:BoundField DataField="LoginRetries" HeaderText="Intentos de Inicio de Sesión" />
            <asp:BoundField DataField="IsBlocked" HeaderText="Bloqueado" DataFormatString="{0:Sí;No}" />
            <asp:BoundField DataField="LastLogin" HeaderText="Último Inicio de Sesión" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="CompanyID" HeaderText="ID de Empresa" />
        </Columns>
    </asp:GridView>
</asp:Content>
