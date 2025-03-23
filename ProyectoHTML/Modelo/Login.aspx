<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoHTML.Modelo.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../Vistas/Login.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sistema Administrador</title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="Login">
            <h1>Login</h1>
            <div class="Usuario">
                <label>Usuario</label>
                <br />
                <input class="user" type="text" name="iusuario" id="iusuario" value="" required placeholder="Digite su nombre de usuario" />
                <br />
            </div>
            <div class="Contrasena">
                <label>Contraseña</label>
                <br />
                <input class="contra" type="password" name="icontra" id="icontra" value="" required placeholder="Digite su contraseña" />
                <br />
                <br />
            </div>
             <asp:Button CssClass="btn" ID="Iniciar" runat="server" Text="INGRESAR" OnClick="Iniciar_Click" />
        </div>
    </form>
</body>
</html>
