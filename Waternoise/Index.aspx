<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Waternoise.Index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
        }

        .background-image {
            background-image: url("images/background.png");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
        }

        .content-box {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin-left: 50px;
            z-index: 1;
        }

        .blue-btn {
            background-color: #07447C;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-weight: 500;
            color: white;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .blue-btn:hover {
            background-color: #2F96F4;
        }

        .blue-text {
            color: #07447C;
            font-weight: 700;
        }

        .logo {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }

        .display-6 {
            font-size: 24px;
            font-weight: 700;
        }

        .fs-5 {
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 10px;
        }

        /* Modal Styles */
        .modal-background {
            position: fixed;
            top: 50%;
            left: 70%; /* Moved more to the right */
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            width: 30%;
            display: none;
            z-index: 3; /* Higher than the background */
        }

        .form-label {
            font-weight: 500;
            color: #07447C;
        }

        .form-control {
            border: 2px solid #07447C;
            border-radius: 10px;
            font-size: 14px;
            padding: 10px;
            color: #07447C;
        }

        .login-title {
            background-color: #07447C;
            padding: 15px;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            color: white;
            font-weight: 700;
            text-align: center;
            margin: -30px -30px 30px -30px;
        }

        /* Disable background when modal is active */
        .disable-background {
            pointer-events: none;
            opacity: 0.5;
        }

        /* Ensure that the background gets disabled */
        #main-content.disable-background {
            filter: blur(2px); /* Optional blur for added effect */
        }

    </style>
    <title>Waternoise | Bienvenido</title>
</head>
<body>
    <form id="loginForm" runat="server">
    <section class="background-image d-flex align-items-center" id="main-content">
        <div class="container">
            <div class="content-box">
                    <img src="..\images\logo.png" alt="Waternoise Logo" class="logo">
                    <h2 class="blue-text display-6">Transforma tus necesidades de tratamiento de aguas y efluentes.</h2>
                    <p class="blue-text fs-5">¿Eres una empresa que necesita servicios de tratamiento de aguas y efluentes o un proveedor que ofrece soluciones especializadas?</p>
                    <p class="blue-text fs-5">¡Regístrate ahora para empezar a conectar con tus futuros socios!</p>
                    <asp:Button ID="register" class="blue-btn btn" runat="server" Text="Quiero registrarme" OnClick="register_Click" />
                    <button type="button" class="blue-btn btn" id="open-login">Iniciar Sesión</button>
            </div>
        </div>
    </section>
<!-- Modal for login -->
    <div class="modal-background" id="login-modal">
        <div class="login-title">Inicio de Sesión</div>
        <p class="form-label">Iniciar sesión con tu cuenta empresa o proveedor</p>
        
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="username"/>
            </div>
        
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="password" />
            </div>
            <asp:Label ID="error" runat="server" Text=""></asp:Label>
            <div class="d-flex justify-content-between">                
                <asp:Button ID="btnLogin" runat="server" CssClass="blue-btn btn" Text="Ingresar" OnClick="btnLogin_Click" />
                <button type="button" class="blue-btn btn" id="cancel-btn">Cancelar</button>
            </div>
            
    </div>
    </form>
    <script>
        document.getElementById('open-login').addEventListener('click', function() {
            // Show modal and disable background
            document.getElementById('login-modal').style.display = 'block';
            document.getElementById('main-content').classList.add('disable-background');
        });

        document.getElementById('cancel-btn').addEventListener('click', function() {
            // Close the modal and re-enable background
            document.getElementById('login-modal').style.display = 'none';
            document.getElementById('main-content').classList.remove('disable-background');
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

