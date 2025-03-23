<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PAsignaciones.aspx.cs" Inherits="ProyectoHTML.Modelo.Principales.PAsignaciones1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Vistas/Principales.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sistema Administrador</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Principal">
            <div class="lateral">
                <h1>Tablas</h1>
                <a href="Inicio.aspx" class="TablaLink">Inicio</a>
                <br />
                <a href="PUsuarios.aspx" class="TablaLink">Usuarios</a>
                <br />
                <a href="PTecnicos.aspx" class="TablaLink">Tecnicos</a>
                <br />
                <a href="PEquipos.aspx" class="TablaLink">Equipos</a>
                <br />
                <a href="PReparaciones.aspx" class="TablaLink">Reparaciones</a>
                <br />
                <a href="PDetalles.aspx" class="TablaLink">Detalles</a>
                <br />
                <a href="PAsignaciones.aspx" class="TablaLink">Asignaciones</a>
                <br />
                <a href="../Login.aspx" class="TablaLink">Salir</a>
                <br />
            </div>
            <div class="top">
                <a href="../Agregar/AAsignaciones.aspx" class="TopLink">Agregar</a>
                <a href="../Modificar/MAsignaciones.aspx" class="TopLink">Modificar</a>
                <a href="../Eliminar/EAsignaciones.aspx" class="TopLink">Eliminar</a>
            </div>
            <div class="Grid">
                <div class="input-group">
                    <label class="input-label">Buscar </label>
                    <asp:TextBox type="Number" AutoPostBack="true" ID="Buscar" runat="server" CssClass="textbox" placeholder="ReparacionID" OnTextChanged="Buscar_TextChanged"></asp:TextBox>
                </div>
                <asp:GridView ID="GridViewID" runat="server" CssClass="datagrid">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
