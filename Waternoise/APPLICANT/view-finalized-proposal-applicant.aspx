<%@ Page Title="" Language="C#" MasterPageFile="~/APPLICANT/MasterPageApplicant.Master" AutoEventWireup="true" CodeBehind="view-finalized-proposal-applicant.aspx.cs" Inherits="Waternoise.APPLICANT.view_finalized_proposal_applicant" %>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col px-1 py-1">
        <h2 class="form-title" style="text-align: left;">
            <a href="finalized-proposals-applicant.aspx">Propuestas Finalizadas</a> &rarr; Visualizar Propuesta
        </h2>
        <div class="catalog-container">
            <h3 class="form-title" style="text-align: left;">Datos de la Propuesta</h3>
            <!-- Información de la solicitud -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:Label ID="lblTituloSolicitud" runat="server" Text="Título de la Solicitud:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblTitulo" runat="server" CssClass="form-label" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblProblemType" runat="server" Text="Tipo de Problemática:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblTipoProblema" runat="server" CssClass="form-label" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label ID="lblDescription" runat="server" Text="Descripción:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblDescripcion" runat="server" CssClass="form-label" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label ID="lblTechnicalFeatures" runat="server" Text="Características Técnicas:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblCaracteristicasTecnicas" runat="server" CssClass="form-label" />
                </div>
            </div>
            <div class="row mb-6">
                <div class="col-md-3">
                    <asp:Label ID="lblAffectedWater" runat="server" Text="Agua Afectada:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblAguaAfectada" runat="server" CssClass="form-label" />
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblLocation" runat="server" Text="Ubicación:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblUbicacion" runat="server" CssClass="form-label" />
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblMoneda" runat="server" Text="Moneda:" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblMonedaValor" runat="server" CssClass="form-label" />
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblMinPrice" runat="server" Text="Precio Min: $" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblPrecioMinimo" runat="server" CssClass="form-label" />
                </div>
                <div class="col-md-2">
                    <asp:Label ID="lblMaxPrice" runat="server" Text="Precio Max: $" CssClass="form-label"></asp:Label>
                    <asp:Label ID="lblPrecioMaximo" runat="server" CssClass="form-label" />
                </div>
            </div>
        </div>
        <!-- Catálogo y productos -->
        <div class="row mb-3">
            <div class="col-md-12">
                <asp:Label ID="lblCatalog" runat="server" Text="Catálogo:" CssClass="form-label"></asp:Label>
                <asp:Label ID="lblCatalogName" runat="server" CssClass="form-label" />
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-12">
                <asp:GridView ID="grvProductos" runat="server" CssClass="table table-striped" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Nombre del Producto" />
                        <asp:BoundField DataField="ProblemType" HeaderText="Tipo de Problemática" />
                        <asp:BoundField DataField="TechnicalFeatures" HeaderText="Características Técnicas" />
                        <asp:BoundField DataField="Currency" HeaderText="Moneda" />
                        <asp:BoundField DataField="Price" HeaderText="Precio" />
                        <asp:BoundField DataField="WarrantyPeriod" HeaderText="Período de Garantía" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <!-- Total y descripción -->
        <div class="row mb-3">
            <div class="col-md-12">
                <asp:Label ID="lblDescripcionPropuesta" runat="server" Text="Descripción de la Propuesta:" CssClass="form-label"></asp:Label>
                <asp:Label ID="lblPropuestaDescripcion" runat="server" CssClass="form-label" />
            </div>
        </div>
        <div class="row mb-3 align-items-center">
            <!-- Columna para los Labels -->
            <div class="col-md-6">
                <asp:Label ID="lblTotal" runat="server" Text="Total de la Propuesta: $" CssClass="form-label"></asp:Label>
                <asp:Label ID="lblPropuestaTotal" runat="server" CssClass="form-label"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
