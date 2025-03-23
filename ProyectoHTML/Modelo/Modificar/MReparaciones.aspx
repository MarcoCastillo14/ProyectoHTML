﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MReparaciones.aspx.cs" Inherits="ProyectoHTML.Modelo.Modificar.MReparaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Vistas/Funciones.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sistema Administrador</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Principal">
            <div class="lateral">
                <h1>Tablas</h1>
                <a href="../Principales/Inicio.aspx" class="TablaLink">Inicio</a>
                <br />
                <a href="../Principales/PUsuarios.aspx" class="TablaLink">Usuarios</a>
                <br />
                <a href="../Principales/PTecnicos.aspx" class="TablaLink">Tecnicos</a>
                <br />
                <a href="../Principales/PEquipos.aspx" class="TablaLink">Equipos</a>
                <br />
                <a href="../Principales/PReparaciones.aspx" class="TablaLink">Reparaciones</a>
                <br />
                <a href="../Principales/PDetalles.aspx" class="TablaLink">Detalles</a>
                <br />
                <a href="../Principales/PAsignaciones.aspx" class="TablaLink">Asignaciones</a>
                <br />
                <a href="../Login.aspx" class="TablaLink">Salir</a>
                <br />
            </div>
            <div class="Grid">
                <div class="grid-container">
                    <asp:GridView ID="GridViewID" runat="server" CssClass="datagrid">
                    </asp:GridView>
                </div>
                <div class="input-group">
                    <label class="input-label">Buscar </label>
                    <asp:TextBox Required="" type="Number" AutoPostBack="true" ID="Buscar"  runat="server" CssClass="textbox" placeholder="ReparacionID" OnTextChanged="Buscar_TextChanged"></asp:TextBox>
                </div>
                <div class="form-container">
                    <div class="input-group">
                        <label class="input-label">Equipo ID</label>
                        <asp:DropDownList ID="Equipo" runat="server" CssClass="textbox"  OnSelectedIndexChanged="Equipo_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="input-group">
                        <label class="input-label">Fecha Solicitud</label>
                        <asp:TextBox ID="Fecha" runat="server" CssClass="textbox" type="date"  OnTextChanged="Fecha_TextChanged"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <label class="input-label">Estado</label>
                        <asp:DropDownList ID="Estado" runat="server" CssClass="textbox"  OnSelectedIndexChanged="Unnamed2_SelectedIndexChanged">
                            <asp:ListItem Text="" />
                            <asp:ListItem Text="Por Asignar" />
                            <asp:ListItem Text="Pendiente" />
                            <asp:ListItem Text="Completada" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="button-container">
                    <asp:Button ID="BtnConfirmar" runat="server" Text="Modificar" CssClass="btn-confirmar" OnClick="BtnConfirmar_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
