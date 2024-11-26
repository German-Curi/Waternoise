<%@ Page Title="" Language="C#" MasterPageFile="~/SUPPLIER/MasterPageSupplier.master" AutoEventWireup="true" CodeBehind="create-suscription.aspx.cs" Inherits="Waternoise.SUPPLIER.create_suscription" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="form-title" style="text-align: left;">Suscripción &rarr; Pago de Suscripción</h2>
    <div id="main_subs" class="catalog-container" runat="server">
        <div class="mb-3">
            <label for="nombreTarjeta" class="form-label">Nombre en la tarjeta</label>
            <asp:TextBox ID="txtNombreTarjeta" CssClass="form-control" runat="server" placeholder="Nombre del titular"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombreTarjeta" runat="server" ControlToValidate="txtNombreTarjeta" ErrorMessage="Campo requerido" ForeColor="Red" Display="Dynamic" />
        </div>

        <div class="mb-3">
            <label for="numeroTarjeta" class="form-label">Número de la tarjeta</label>
            <asp:TextBox ID="txtNumeroTarjeta" CssClass="form-control" runat="server" placeholder="0000 0000 0000 0000"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNumeroTarjeta" runat="server" ControlToValidate="txtNumeroTarjeta" ErrorMessage="Campo requerido" ForeColor="Red" Display="Dynamic" />
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="fechaExpiracion" class="form-label">Fecha de expiración</label>
                <asp:TextBox ID="txtFechaExpiracion" CssClass="form-control" runat="server" placeholder="MM/AA"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFechaExpiracion" runat="server" ControlToValidate="txtFechaExpiracion" ErrorMessage="Campo requerido" ForeColor="Red" Display="Dynamic" />
            </div>

            <div class="col-md-6 mb-3">
                <label for="codigoCVV" class="form-label">Código CVV</label>
                <asp:TextBox ID="txtCodigoCVV" CssClass="form-control" runat="server" placeholder="123"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCodigoCVV" runat="server" ControlToValidate="txtCodigoCVV" ErrorMessage="Campo requerido" ForeColor="Red" Display="Dynamic" />
            </div>            
        </div>

        <div class="mb-3">
            <label for="cantidadMeses" class="form-label">Cantidad de meses</label>
            <asp:DropDownList ID="ddlCantidadMeses" CssClass="form-select" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCantidadMeses_SelectedIndexChanged">
                <asp:ListItem Value="0" Text="Seleccionar una opción" />
                <asp:ListItem Value="1" Text="1 mes ($300,000)" />
                <asp:ListItem Value="2" Text="2 meses ($600,000)" />
                <asp:ListItem Value="3" Text="3 meses ($810,000 con 10% descuento)" />
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label for="totalSuscripcion" class="form-label">Total Suscripción</label>
            <asp:TextBox ID="txtTotalSuscripcion" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="d-flex justify-content-end">
            <asp:Button ID="btnPagar" runat="server" Text="Pagar" CssClass="btn-custom" OnClick="btnPagar_Click" />
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
    <asp:Label ID="subscription_ready" runat="server" Text="" class="form-label" ></asp:Label>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var mostrarModal = '<%= hdnMostrarModal.ClientID %>';
            if (document.getElementById(mostrarModal).value === "true") {
                // Mostrar el modal
                var modal = new bootstrap.Modal(document.getElementById('modalConfirmacion'));
                modal.show();

                // Redirigir al hacer clic en el botón "Aceptar"
                document.getElementById('btnAceptar').addEventListener('click', function () {
                    window.location.href = 'create-suscription.aspx';
                });
            }
        });
    </script>
</asp:Content>
