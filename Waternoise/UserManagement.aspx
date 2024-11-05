<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="Waternoise.UserManagement" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-left">Gestión de Usuarios</h2>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Fecha de Creación</th>
                    <th>Activado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>user1@example.com</td>
                    <td>user1</td>
                    <td>2024-01-01</td>
                    <td>
                        <input class="form-check-input" type="checkbox" checked>
                    </td>
                    <td>
                        <button class="btn-custom-secondary"><i class="fa fa-edit"></i> Editar</button>
                    </td>
                </tr>
                <tr>
                    <td>user2@example.com</td>
                    <td>user2</td>
                    <td>2024-01-02</td>
                    <td>
                        <input class="form-check-input" type="checkbox">
                    </td>
                    <td>
                        <button class="btn-custom-secondary"><i class="fa fa-edit"></i> Editar</button>
                    </td>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>
    <!-- Pagination -->
    <div class="d-flex justify-content-between align-items-center mt-3">
        <nav>
            <ul class="pagination">
                <li class="page-item disabled">
                    <span class="page-link">Anterior</span>
                </li>
                <li class="page-item active">
                    <span class="page-link">1</span>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">Siguiente</a>
                </li>
            </ul>
        </nav>
        <button class="btn-custom" style="margin-left: auto;"><i class="fa fa-download"></i> Descargar Listado</button>
    </div>
</asp:Content>
