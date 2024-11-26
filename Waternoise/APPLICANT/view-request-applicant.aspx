<%@ Page Title="" Language="C#" MasterPageFile="~/APPLICANT/MasterPageApplicant.Master" AutoEventWireup="true" CodeBehind="view-request-applicant.aspx.cs" Inherits="Waternoise.view_request_applicant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col px-4 py-5">
        <h2 class="form-title" style="text-align: left;">
            <a href="requestsapplicant.aspx">Solicitudes</a> &rarr; Ver Solicitud
        </h2>
        <div class="catalog-container">
            <h3 class="form-title" style="text-align: left;">Datos de la Solicitud</h3>
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:Label ID="lblTituloSolicitud" runat="server" Text="Título de la Solicitud" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtTituloSolicitud" runat="server" CssClass="form-control" Enabled="false" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblProblemType" runat="server" Text="Tipo de Problemática" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtProblemType" runat="server" CssClass="form-control" Enabled="false" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label ID="lblDescription" runat="server" Text="Descripción" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Enabled="false" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label ID="lblTechnicalFeatures" runat="server" Text="Características Técnicas" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtTechnicalFeatures" runat="server" CssClass="form-control" TextMode="MultiLine" Enabled="false" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:Label ID="lblAffectedWater" runat="server" Text="Agua Afectada" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlAffectedWater" runat="server" CssClass="form-control" Enabled="false">
                        <asp:ListItem Text="Agua Potable" Value="Agua Potable" />
                        <asp:ListItem Text="Agua Residual" Value="Agua Residual" />
                        <asp:ListItem Text="Agua Industrial" Value="Agua Industrial" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblLocation" runat="server" Text="Ubicación" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" Enabled="false" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4">
                    <asp:Label ID="lblMoneda" runat="server" Text="Moneda" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlMoneda" runat="server" CssClass="form-control" Enabled="false">
                        <asp:ListItem Text="Dólar" Value="Dólar" />
                        <asp:ListItem Text="Peso" Value="Peso" />
                        <asp:ListItem Text="Real" Value="Real" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblMinPrice" runat="server" Text="Precio Mínimo" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtMinPrice" runat="server" CssClass="form-control" TextMode="Number" Enabled="false" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblMaxPrice" runat="server" Text="Precio Máximo" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtMaxPrice" runat="server" CssClass="form-control" TextMode="Number" Enabled="false" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>