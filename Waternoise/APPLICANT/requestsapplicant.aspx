<%@ Page Title="" Language="C#" MasterPageFile="~/APPLICANT/MasterPageApplicant.Master" AutoEventWireup="true" CodeBehind="requestsapplicant.aspx.cs" Inherits="Waternoise.requestsapplicant" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="~/styles/portfolio-styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="form-title">Solicitudes</h2>
        <a href="create-request.aspx" class="blue-btn">+ Crear Solicitud</a>  
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
                <asp:LinkButton ID="btnViewRequest" runat="server" Text="Visualizar" CssClass="btn-view"
                    CommandName="ViewRequest" CommandArgument='<%# Eval("ID") %>' />
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <div class="pagination-controls">
        <asp:Button ID="btnPrevious" runat="server" Text="Anterior" OnClick="ChangePage" CommandArgument="Previous" CssClass="btn-pagination" />
        <asp:Label ID="lblPageInfo" runat="server" CssClass="page-info"></asp:Label>
        <asp:Button ID="btnNext" runat="server" Text="Siguiente" OnClick="ChangePage" CommandArgument="Next" CssClass="btn-pagination" />
    </div>
</asp:Content>
