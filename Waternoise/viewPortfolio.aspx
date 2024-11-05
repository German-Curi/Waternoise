<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSupplier.master" AutoEventWireup="true" CodeBehind="viewPortfolio.aspx.cs" Inherits="Waternoise.viewPortfolio" %>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col px-4 py-5">
        <h2 class="form-title" style="text-align: left;">
            <a href="porfolio.aspx">Catálogo</a> &rarr; Crear Catálogo
        </h2>
        <div class="catalog-container">
            <h3 class="form-title" style="text-align: left;">Datos del Catálogo</h3>
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:Label ID="lblTitulo" runat="server" Text="Nombre de Catálogo" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" Enabled="false" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripción" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" Enabled="false" />               
                </div>
            </div>
        </div>

        <div class="catalog-container">
            <h3 class="form-title" style="text-align: left;">Grilla Productos</h3>
            <asp:GridView ID="GridViewProductos" runat="server" CssClass="table table-striped mt-4" AutoGenerateColumns="False" EmptyDataText="No hay productos agregados al catálogo.">
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
</asp:Content>
