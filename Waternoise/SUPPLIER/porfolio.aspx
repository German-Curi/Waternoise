<%@ Page Title="" Language="C#" MasterPageFile="~/SUPPLIER/MasterPageSupplier.master" AutoEventWireup="true" CodeBehind="porfolio.aspx.cs" Inherits="Waternoise.porfolio" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="~/styles/portfolio-styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="form-title">Catálogo</h2>
        <a href="createportfolio.aspx" class="blue-btn">+ Crear Catálogo</a>  
    </div>
    <br/>
    <!-- Contenedor de Catálogos -->
    <asp:Repeater ID="rptPortfolios" runat="server" OnItemCommand="rptPortfolios_ItemCommand">
        <ItemTemplate>
            <div class="catalog-container">
                <h3><%# Eval("Title") %></h3>
                <p>Numero: <%# Eval("ID") %> &nbsp;&nbsp; Descripción: <%# Eval("Description") %> &nbsp;&nbsp; Fecha creación: <%# Eval("CreatedAt", "{0:dd/MM/yyyy}") %> &nbsp;&nbsp; Fecha Actualización: <%# Eval("UpdatedAt", "{0:dd/MM/yyyy}") %></p>
                <asp:LinkButton ID="btnViewCatalog" runat="server" Text="Visualizar" CssClass="btn-view"
                    CommandName="ViewCatalog" CommandArgument='<%# Eval("ID") %>' />
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <!-- Controles de Paginación -->
    <div class="pagination-controls">
        <asp:Button ID="btnPrevious" runat="server" Text="Anterior" OnClick="ChangePage" CommandArgument="Previous" CssClass="btn-pagination" />
        <asp:Label ID="lblPageInfo" runat="server" CssClass="page-info"></asp:Label>
        <asp:Button ID="btnNext" runat="server" Text="Siguiente" OnClick="ChangePage" CommandArgument="Next" CssClass="btn-pagination" />
    </div>
</asp:Content>
