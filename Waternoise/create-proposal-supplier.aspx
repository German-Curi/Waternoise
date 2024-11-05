<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSupplier.master" AutoEventWireup="true" CodeBehind="create-proposal-supplier.aspx.cs" Inherits="Waternoise.create_proposal_supplier" %>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col px-4 py-5">
        <h2 class="form-title" style="text-align: left;">
            <a href="requestsapplicant.aspx">Solicitudes</a> &rarr; Crear Propuesta
        </h2>
        <div class="catalog-container">
            <h3 class="form-title" style="text-align: left;">Datos de la Propuesta</h3>
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:Label ID="lblTituloSolicitud" runat="server" Text="Título de la Solicitud:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblTitulo" runat="server" CssClass="form-label" Text='<%# Bind("Titulo") %>' />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblProblemType" runat="server" Text="Tipo de Problemática:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblTipoProblema" runat="server" CssClass="form-label" Text='<%# Bind("TipoProblema") %>' />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label ID="lblDescription" runat="server" Text="Descripción:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblDescripcion" runat="server" CssClass="form-label" Text='<%# Bind("Descripcion") %>' TextMode="MultiLine" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label ID="lblTechnicalFeatures" runat="server" Text="Características Técnicas:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblCaracteristicasTecnicas" runat="server" CssClass="form-label" Text='<%# Bind("CaracteristicasTecnicas") %>' TextMode="MultiLine" />
                </div>
            </div>
            <div class="row mb-6">
                <div class="col-md-3">
                    <asp:Label ID="lblAffectedWater" runat="server" Text="Agua Afectada:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblAguaAfectada" runat="server" CssClass="form-label" Text='<%# Bind("AguaAfectada") %>' />
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblLocation" runat="server" Text="Ubicación:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblUbicacion" runat="server" CssClass="form-label" Text='<%# Bind("Ubicacion") %>' />
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblMoneda" runat="server" Text="Moneda:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblMonedaValor" runat="server" CssClass="form-label" Text='<%# Bind("Moneda") %>' />
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblMinPrice" runat="server" Text="Precio Min: $" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblPrecioMinimo" runat="server" CssClass="form-label" Text='<%# Bind("PrecioMinimo") %>' />
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblMaxPrice" runat="server" Text="Precio Max: $" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblPrecioMaximo" runat="server" CssClass="form-label" Text='<%# Bind("PrecioMaximo") %>' />
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-end">
            <asp:Button ID="btnSubmit" runat="server" Text="Enviar Propuesta" CssClass="btn-custom" OnClick="EnviarPropuesta_Click" />
        </div>
    </div>
</asp:Content>
