<%@ Page Title="" Language="C#" MasterPageFile="~/SUPPLIER/MasterPageSupplier.master" AutoEventWireup="true" CodeBehind="profile-supplier.aspx.cs" Inherits="Waternoise.profile_supplier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Perfil del Proveedor
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="form-title" style="text-align: left;">Configuración del Perfil</h2>
    <div class="catalog-container">             
        <div class="mb-3">
            <label for="txtRazonSocial" class="form-label">Razón Social</label>
            <asp:TextBox ID="txtRazonSocial" CssClass="form-control" runat="server" placeholder="Ingrese la razón social"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvRazonSocial" runat="server" ControlToValidate="txtRazonSocial" ErrorMessage="Campo requerido" ForeColor="Red" Display="Dynamic" />
        </div>
        
        <div class="mb-3">
            <label for="txtEmail" class="form-label">Email</label>
            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Ingrese su email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Campo requerido" ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ErrorMessage="Formato de email inválido" ForeColor="Red" Display="Dynamic" />
        </div>
        
        <div class="mb-3">
            <label for="txtDireccion" class="form-label">Dirección</label>
            <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server" placeholder="Ingrese su dirección"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Campo requerido" ForeColor="Red" Display="Dynamic" />
        </div>
        
        <div class="mb-3">
            <label for="txtNumeroContacto" class="form-label">Número de Contacto</label>
            <asp:TextBox ID="txtNumeroContacto" CssClass="form-control" runat="server" placeholder="Ingrese su número de contacto"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNumeroContacto" runat="server" ControlToValidate="txtNumeroContacto" ErrorMessage="Campo requerido" ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revNumeroContacto" runat="server" ControlToValidate="txtNumeroContacto" ValidationExpression="^\d{10}$" ErrorMessage="El número debe tener 10 dígitos" ForeColor="Red" Display="Dynamic" />
        </div>        
    </div>
        <div style="text-align: right;">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="blue-btn" style="text-align: right;" Visible="true" OnClick="btnGuardar_Click" />
            <asp:Button ID="btmActualizar" runat="server" Text="Actualizar" CssClass="blue-btn" style="text-align: right;" Visible="false" OnClick="btmActualizar_Click"/>
            <asp:HiddenField ID="hdnMostrarModal" runat="server" Value="false" />
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
                    window.location.href = 'profile-supplier.aspx';
                });
            }
        });
    </script>
</asp:Content>


