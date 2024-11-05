<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Waternoise.register" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .header {
            background-color: #2F96F4;
        }

        .logo {
            height: 50px;
        }

        .text {
            color: white;
            font-weight: 500;
            margin: 0;
        }

        .container {
            margin-top: 20px;
            display: flex;
            justify-content: space-around;
        }

        .card {
            width: 45%;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        .card h3 {
            font-size: 24px;
            font-weight: bold;
            color: #07447C;
            text-align: center;
        }

        .card ul {
            padding-left: 20px;
            list-style-type: none;
        }

        .card ul li {
            margin-bottom: 10px;
            font-size: 16px;
            color: #07447C;
        }

        .card p {
            font-size: 16px;
            margin-top: 20px;
            font-weight: bold;
            color: #07447C;
            text-align: center;
        }

        .btn-custom {
            background-color: #07447C;
            color: white;
            border-radius: 30px;
            padding: 10px 30px;
            border: none;
            display: block;
            margin: 0 auto;
            margin-top: 20px;
            text-decoration: none; /* Remueve el subrayado */
        }

        .btn-custom:hover {
            background-color: #2F96F4;
        }
    </style>
    <title>Waternoise | Selección de Perfil</title>
</head>
<body>

    <header class="header d-flex align-items-center justify-content-between p-3">
        <a href="index.aspx">
            <img src="..\images\logo2.png" alt="Waternoise Logo" class="logo">
        </a>
        <h2 class="text">Tratamiento de aguas y efluentes</h2>
    </header>  
    <div class="container">
        <div class="card">
            <h3>Empresa Solicitante</h3>
            <ul>
                <li>1. Como empresa solicitante, puedes crear un perfil detallado que te permitirá gestionar tus necesidades de tratamiento de aguas y efluentes de manera eficiente.</li>
                <li>2. Publica solicitudes especificando tus requisitos, presupuesto y plazos.</li>
                <li>3. Recibe propuestas personalizadas de proveedores especializados.</li>
                <li>4. Podrás revisar, comparar y seleccionar las mejores soluciones para tu empresa.</li>
            </ul>
            <p>Crea tu perfil hoy y comienza a optimizar tus procesos con la ayuda de expertos.</p>
            <a href="register-applicant.aspx" class="btn-custom"> + Registrar Empresa </a>
        </div>

        <div class="card">
            <h3>Proveedor</h3>
            <ul>
                <li>1. Como proveedor, puedes crear un perfil completo para mostrar tus servicios y capacidades, en la resolución de problemáticas de tratamiento de agua y efluentes.</li>
                <li>2. Accede a solicitudes activas de empresas que necesitan soluciones especializadas.</li>
                <li>3. Envía propuestas personalizadas adaptadas a sus necesidades.</li>
                <li>4. Gestiona tus propuestas y mantén un historial detallado de tus interacciones con las empresas solicitantes.</li>
            </ul>
            <p>Crea tu perfil hoy y conecta con empresas que buscan tus soluciones expertas.</p>
            <a href="register-supplier.aspx" class="btn-custom"> + Registrar Proveedor </a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN6jIeHz" crossorigin="anonymous"></script>
</body>
</html>