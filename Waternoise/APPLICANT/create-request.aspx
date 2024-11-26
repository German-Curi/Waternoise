<%@ Page Title="" Language="C#" MasterPageFile="~/APPLICANT/MasterPageApplicant.Master" AutoEventWireup="true" CodeBehind="create-request.aspx.cs" Inherits="Waternoise.create_request" %>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col px-4 py-5">
        <h2 class="form-title" style="text-align: left;">
            <a href="requestsapplicant.aspx">Solicitudes</a> &rarr; Crear Solicitud
        </h2>
        <div class="catalog-container">
            <h3 class="form-title" style="text-align: left;">Datos de la Solicitud</h3>
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:Label ID="lblTituloSolicitud" runat="server" Text="Título de la Solicitud" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtTituloSolicitud" runat="server" CssClass="form-control" placeholder="ejemplo" />
                    <asp:RequiredFieldValidator ID="rfvTituloSolicitud" runat="server" ControlToValidate="txtTituloSolicitud" ErrorMessage="Título de la solicitud requerido." CssClass="text-danger" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblProblemType" runat="server" Text="Tipo de Problemática" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtProblemType" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvProblemType" runat="server" ControlToValidate="txtProblemType" ErrorMessage="Tipo de problemática requerido." CssClass="text-danger" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label ID="lblDescription" runat="server" Text="Descripción" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Descripción requerida." CssClass="text-danger" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <asp:Label ID="lblTechnicalFeatures" runat="server" Text="Características Técnicas" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtTechnicalFeatures" runat="server" CssClass="form-control" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="rfvTechnicalFeatures" runat="server" ControlToValidate="txtTechnicalFeatures" ErrorMessage="Características técnicas requeridas." CssClass="text-danger" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:Label ID="lblAffectedWater" runat="server" Text="Agua Afectada" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlAffectedWater" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Seleccione" Value="" />
                        <asp:ListItem Text="Agua Potable" Value="Agua Potable" />
                        <asp:ListItem Text="Agua Residual" Value="Agua Residual" />
                        <asp:ListItem Text="Agua Industrial" Value="Agua Industrial" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvAffectedWater" runat="server" ControlToValidate="ddlAffectedWater" InitialValue="" ErrorMessage="Seleccione un tipo de agua afectada." CssClass="text-danger" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblLocation" runat="server" Text="Ubicación" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocation" ErrorMessage="Ubicación requerida." CssClass="text-danger" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4">
                    <asp:Label ID="lblMoneda" runat="server" Text="Moneda" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlMoneda" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Seleccione" Value="" />
                        <asp:ListItem Text="Dólar" Value="Dólar" />
                        <asp:ListItem Text="Peso" Value="Peso" />
                        <asp:ListItem Text="Real" Value="Real" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvMoneda" runat="server" ControlToValidate="ddlMoneda" InitialValue="" ErrorMessage="Seleccione una moneda." CssClass="text-danger" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblMinPrice" runat="server" Text="Precio Mínimo" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtMinPrice" runat="server" CssClass="form-control" TextMode="Number" />
                    <asp:RangeValidator ID="rvMinPrice" runat="server" ControlToValidate="txtMinPrice" MinimumValue="0" MaximumValue="1000000" Type="Double" ErrorMessage="El precio mínimo debe ser mayor a 0." CssClass="text-danger" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblMaxPrice" runat="server" Text="Precio Máximo" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtMaxPrice" runat="server" CssClass="form-control" TextMode="Number" />
                    <asp:RequiredFieldValidator ID="rfvMaxPrice" runat="server" ControlToValidate="txtMaxPrice" ErrorMessage="Precio máximo requerido." CssClass="text-danger" />
                    <asp:RangeValidator ID="rvMaxPrice" runat="server" ControlToValidate="txtMaxPrice" MinimumValue="0" MaximumValue="1000000" Type="Double" ErrorMessage="El precio máximo debe ser mayor a 0." CssClass="text-danger" />
                </div>
            </div>
            <!-- Submit button -->

        </div>
        <div class="d-flex justify-content-end">
            <asp:Button ID="btnSubmit" runat="server" Text="Guardar Solicitud" CssClass="btn-custom" OnClick="GuardarSolicitud_Click" />
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
                    window.location.href = 'requestsapplicant.aspx';
                });
            }
        });
    </script>
</asp:Content>
