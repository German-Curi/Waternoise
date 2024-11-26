<%@ Page Title="" Language="C#" MasterPageFile="~/SUPPLIER/MasterPageSupplier.master" AutoEventWireup="true" CodeBehind="finalized-proposals-supplier.aspx.cs" Inherits="Waternoise.SUPPLIER.finalized_proposals_supplier" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="~/styles/proposal-styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="form-title">Propuestas Finalizadas</h2>
    </div>
    <br/>

    <!-- Filtros -->
    <div class="filter-controls">
        <label>Desde:</label>
        <asp:TextBox ID="txtFromDate" runat="server" CssClass="date-input" TextMode="Date" />
        
        <label>Hasta:</label>
        <asp:TextBox ID="txtToDate" runat="server" CssClass="date-input" TextMode="Date" />

        <label>Ubicación:</label>
        <asp:TextBox ID="txtLocation" runat="server" CssClass="location-input" />

        <label>Orden:</label>
        <asp:DropDownList ID="ddlOrderByOrder" runat="server" CssClass="dropdown">
            <asp:ListItem Text="Ascendente" Value="ASC" />
            <asp:ListItem Text="Descendente" Value="DESC" />
        </asp:DropDownList>

        <asp:Button ID="btnFilter" runat="server" Text="Filtrar" OnClick="btnFilter_Click" CssClass="btn-filter" />
    </div>
    <br/>

    <!-- Repeater para mostrar propuestas -->
    <asp:Repeater ID="rptProposals" runat="server" OnItemCommand="rptProposals_ItemCommand">
        <ItemTemplate>
            <div class="catalog-container">
                <h3>Propuesta: #<%# Eval("ID") %></h3>
                <p>
                    Solicitud: #<%# Eval("RequestID") %> |
                    Precio Total: $<%# Eval("TotalPrice") %> |
                    Estado: <%# Eval("Status") %> |
                    Fecha de Envío: <%# Eval("CreatedAt", "{0:dd/MM/yyyy}") %>
                </p>
                <asp:LinkButton ID="btnView" runat="server" Text="Visualizar" CssClass="btn-view"
                    CommandName="ViewProposal" CommandArgument='<%# Eval("ID") %>' />
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <!-- Controles de paginación -->
    <div class="pagination-controls">
        <asp:Button ID="btnPrevious" runat="server" Text="Anterior" OnClick="ChangePage" CommandArgument="Previous" CssClass="btn-pagination" />
        <asp:Label ID="lblPageInfo" runat="server" CssClass="page-info"></asp:Label>
        <asp:Button ID="btnNext" runat="server" Text="Siguiente" OnClick="ChangePage" CommandArgument="Next" CssClass="btn-pagination" />
    </div>
</asp:Content>
