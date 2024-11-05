<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register-applicant.aspx.cs" Inherits="Waternoise.register_applicant" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles/global-styles.css" />
    <title>Waternoise | Registro</title>  
</head>
<body>
    <header class="header">
        <a href="index.aspx">
            <img src="..\images\logo2.png" alt="Waternoise Logo" class="logo">
        </a>
        <h2 class="text">Tratamiento de aguas y efluentes</h2>
    </header>  

    <div class="content-box">
        <h2 class="form-title">Registro de Empresa Solicitante</h2>
        <form runat="server">
            <!-- Campo Nombre de la Empresa -->
            <div class="mb-3">
                <label for="name" class="form-label">Nombre de la Empresa</label>
                <asp:TextBox ID="name" runat="server" CssClass="form-control" placeholder="Nombre completo"></asp:TextBox>
                <asp:RequiredFieldValidator ID="nameRequired" runat="server" ControlToValidate="name" ErrorMessage="El nombre de la empresa es obligatorio" CssClass="text-danger" Display="Dynamic" />
            </div>

            <!-- Campo Correo Electrónico -->
            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="email@ejemplo.com" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="emailRequired" runat="server" ControlToValidate="email" ErrorMessage="El correo electrónico es obligatorio" CssClass="text-danger" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="emailFormat" runat="server" ControlToValidate="email" ErrorMessage="Formato de correo inválido" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" CssClass="text-danger" Display="Dynamic" />
            </div>

            <!-- Campo Contraseña -->
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="********" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="passwordRequired" runat="server" ControlToValidate="password" ErrorMessage="La contraseña es obligatoria" CssClass="text-danger" Display="Dynamic" />               
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

            <!-- Botón de registro -->
            <asp:Button ID="registrarEmpresa" runat="server" CssClass="blue-btn" Text="Registrar" OnClick="registrarEmpresa_Click" />
            <asp:HiddenField ID="hdnMostrarModal" runat="server" Value="false" />
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var mostrarModal = '<%= hdnMostrarModal.ClientID %>';
            if (document.getElementById(mostrarModal).value === "true") {
                // Mostrar el modal
                var modal = new bootstrap.Modal(document.getElementById('modalConfirmacion'));
                modal.show();

                // Redirigir al hacer clic en el botón "Aceptar"
                document.getElementById('btnAceptar').addEventListener('click', function () {
                    window.location.href = 'index.aspx';
                });
            }
        });
    </script>
</body>
</html>