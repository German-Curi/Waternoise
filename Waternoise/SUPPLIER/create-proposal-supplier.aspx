<%@ Page Title="" Language="C#" MasterPageFile="~/SUPPLIER/MasterPageSupplier.master" AutoEventWireup="true" CodeBehind="create-proposal-supplier.aspx.cs" Inherits="Waternoise.create_proposal_supplier" %>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col px-4 py-5">
        <h2 class="form-title" style="text-align: left;">
            <a href="view-request-supplier.aspx">Solicitudes</a> &rarr; Crear Propuesta
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
<!-- Nueva sección: Selección de Portafolio y Detalles de Propuesta -->
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label ID="lblPortafolio" runat="server" Text="Seleccionar Portafolio:" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlPortafolios" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPortafolios_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvPortafolio" runat="server" ControlToValidate="ddlPortafolios" InitialValue="" ErrorMessage="Debe seleccionar un portafolio." CssClass="text-danger"/>
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
                            <asp:BoundField DataField="Price" HeaderText="Precio"/>
                            <asp:BoundField DataField="WarrantyPeriod" HeaderText="Período de Garantía" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:Label ID="lblTotalPrecio" runat="server" Text="Total de la Propuesta (Conversión a Pesos):" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtTotalPrecio" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblDetallesPropuesta" runat="server" Text="Detalles de la Propuesta:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDetallesPropuesta" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDetallesPropuesta" runat="server" ControlToValidate="txtDetallesPropuesta" ErrorMessage="Debe ingresar los detalles de la propuesta." CssClass="text-danger"/>
                </div>
            </div>
        <div class="d-flex justify-content-end">
            <asp:Button ID="btnSubmit" runat="server" Text="Enviar Propuesta" CssClass="btn-custom" OnClick="EnviarPropuesta_Click" />
        </div>
        <div class="modal fade" id="modalConfirmacion" tabindex="-1" aria-labelledby="modalConfirmacionLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="font-family: 'Inter', sans-serif;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalConfirmacionLabel">Registro Exitoso</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Su registro ha sido completado exitosamente.</p>
                    </div>
                    <div class="modal-footer">
                        <!-- Botón de Aceptar con estilo personalizado -->
                        <button type="button" class="btn blue-btn" id="btnAceptar" data-bs-dismiss="modal">Aceptar</button>
                        <asp:HiddenField ID="hdnMostrarModal" runat="server" Value="false" />
                    </div>
                </div>
            </div>
        </div>
    </div>
        <script>
        document.addEventListener("DOMContentLoaded", function () {
            var mostrarModal = '<%= hdnMostrarModal.ClientID %>';
            if (document.getElementById(mostrarModal).value === "true") {
                // Mostrar el modal
                var modal = new bootstrap.Modal(document.getElementById('modalConfirmacion'));
                modal.show();

                // Redirigir al hacer clic en el botón "Aceptar"
                document.getElementById('btnAceptar').addEventListener('click', function () {
                    window.location.href = 'view-request-supplier.aspx';
                });
            }
        });
    </script>
</asp:Content>
