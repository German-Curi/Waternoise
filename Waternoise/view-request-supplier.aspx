<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSupplier.master" AutoEventWireup="true" CodeBehind="view-request-supplier.aspx.cs" Inherits="Waternoise.view_request_supplier" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="~/styles/portfolio-styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="form-title">Solicitudes de Proveedor</h2>
    </div>
    <br/>

    <!-- Filtros para fecha, orden y ubicación -->
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

    <asp:Repeater ID="rptRequests" runat="server" OnItemCommand="rptRequests_ItemCommand">
        <ItemTemplate>
            <div class="catalog-container">
                <h3><%# Eval("NameRequest") %></h3>
                <p>
                    Número: <%# Eval("ID") %> |
                    Estado: <%# Eval("Status") %> |
                    Tipo de Problema: <%# Eval("ProblemType") %> |
                    Fecha de Creación: <%# Eval("CreatedAt", "{0:dd/MM/yyyy}") %> |
                    Fecha de Actualización: <%# Eval("UpdatedAt", "{0:dd/MM/yyyy}") %>
                </p>
                <asp:LinkButton ID="btnPropose" runat="server" Text="Proponer" CssClass="btn-propose"
                    CommandName="ProposeRequest" CommandArgument='<%# Eval("ID") %>' />
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <div class="pagination-controls">
        <asp:Button ID="btnPrevious" runat="server" Text="Anterior" OnClick="ChangePage" CommandArgument="Previous" CssClass="btn-pagination" />
        <asp:Label ID="lblPageInfo" runat="server" CssClass="page-info"></asp:Label>
        <asp:Button ID="btnNext" runat="server" Text="Siguiente" OnClick="ChangePage" CommandArgument="Next" CssClass="btn-pagination" />
    </div>
</asp:Content>
