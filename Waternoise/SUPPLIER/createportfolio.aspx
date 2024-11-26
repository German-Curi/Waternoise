<%@ Page Title="" Language="C#" MasterPageFile="~/SUPPLIER/MasterPageSupplier.master" AutoEventWireup="true" CodeBehind="createportfolio.aspx.cs" Inherits="Waternoise.createportfolio" %>
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
                    <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" placeholder="ejemplo" />
                    <asp:RequiredFieldValidator ID="rfvTitulo" runat="server" ControlToValidate="txtTitulo" ErrorMessage="Nombre de catálogo requerido." CssClass="text-danger" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripción" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeholder="ejemplo" />
                    <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Descripción requerida." CssClass="text-danger" />
                </div>
            </div>
        </div>

        <div class="catalog-container">
            <h3 class="form-title" style="text-align: left;">Datos del Producto</h3>
            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblNombreProducto" runat="server" Text="Nombre del Producto" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control" placeholder="ejemplo" />
                    <asp:RequiredFieldValidator ID="rfvNombreProducto" runat="server" ControlToValidate="txtNombreProducto" ErrorMessage="Nombre del producto requerido." CssClass="text-danger" />
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lblTipoProblematica" runat="server" Text="Tipo de Problemática" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtTipoProblematica" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvTipoProblematica" runat="server" ControlToValidate="txtTipoProblematica" ErrorMessage="Tipo de problemática requerido." CssClass="text-danger" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblCaracteristicasTecnicas" runat="server" Text="Características Técnicas" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtCaracteristicasTecnicas" runat="server" CssClass="form-control" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="rfvCaracteristicasTecnicas" runat="server" ControlToValidate="txtCaracteristicasTecnicas" ErrorMessage="Características técnicas requeridas." CssClass="text-danger" />
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lblMoneda" runat="server" Text="Moneda" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlMoneda" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Seleccione" Value="" />
                        <asp:ListItem Text="Dólar" Value="Dólar" />
                        <asp:ListItem Text="Peso" Value="Peso" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvMoneda" runat="server" ControlToValidate="ddlMoneda" InitialValue="" ErrorMessage="Seleccione una moneda." CssClass="text-danger" />
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lblPrecio" runat="server" Text="Precio" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" TextMode="Number" />
                    <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio" ErrorMessage="Precio requerido." CssClass="text-danger" />
                    <asp:RangeValidator ID="rvPrecio" runat="server" ControlToValidate="txtPrecio" MinimumValue="0" MaximumValue="1000000" Type="Double" ErrorMessage="El precio debe ser mayor a 0." CssClass="text-danger" />
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lblPeriodoGarantia" runat="server" Text="Período de Garantía" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtPeriodoGarantia" runat="server" CssClass="form-control" TextMode="Date"  />
                    <asp:RequiredFieldValidator ID="rfvPeriodoGarantia" runat="server" ControlToValidate="txtPeriodoGarantia" ErrorMessage="Fecha de garantía requerida." CssClass="text-danger" />
                    <asp:CompareValidator ID="cvPeriodoGarantia" runat="server" ControlToValidate="txtPeriodoGarantia" Operator="DataTypeCheck" Type="Date" ErrorMessage="Fecha inválida." CssClass="text-danger" />
                </div>
            </div>

            <!-- Botón para agregar productos a la grilla -->
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Producto" CssClass="btn-custom" OnClick="btnAgregar_Click" />
        </div>

        <div class="catalog-container">
            <h3 class="form-title" style="text-align: left;">Grilla Productos</h3>
            <asp:GridView ID="GridViewProductos" runat="server" CssClass="table table-striped mt-4" AutoGenerateColumns="False" EmptyDataText="No hay productos agregados al catálogo." OnRowDeleting="GridViewProductos_RowDeleting1">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Nombre del Producto" />
                    <asp:BoundField DataField="ProblemType" HeaderText="Tipo de Problemática" />
                    <asp:BoundField DataField="TechnicalFeatures" HeaderText="Características Técnicas" />
                    <asp:BoundField DataField="Currency" HeaderText="Moneda" />
                    <asp:BoundField DataField="Price" HeaderText="Precio" />
                    <asp:BoundField DataField="WarrantyPeriod" HeaderText="Período de Garantía" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>

        <!-- Botón para guardar el catálogo -->
        <div class="d-flex justify-content-end">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn-custom" OnClick="GuardarCatalogo_Click" />
            <asp:HiddenField ID="hdnMostrarModal" runat="server" Value="false" />
        </div>
        <!-- Modal de confirmación -->
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
                    window.location.href = 'porfolio.aspx';
                });
            }
        });
    </script>
</asp:Content>