<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Subscription-Management.aspx.cs" Inherits="Waternoise.Subscription_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Suscripciones</h2>
    <asp:GridView ID="gvSubscriptions" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
        <Columns>
            <asp:BoundField DataField="CardholderName" HeaderText="Titular de la Tarjeta" />
            <asp:BoundField DataField="CardNumber" HeaderText="Número de Tarjeta" />
            <asp:BoundField DataField="ExpirationDate" HeaderText="Fecha de Expiración" DataFormatString="{0:MM/yyyy}" />
            <asp:BoundField DataField="SubscriptionDuration" HeaderText="Duración (meses)" />
            <asp:BoundField DataField="SubscriptionTotal" HeaderText="Total" DataFormatString="{0:C}" />
            <asp:BoundField DataField="CreatedAt" HeaderText="Fecha de Creación" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="UpdatedAt" HeaderText="Última Actualización" DataFormatString="{0:dd/MM/yyyy}" />
        </Columns>
    </asp:GridView>
</asp:Content>
