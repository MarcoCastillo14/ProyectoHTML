<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AAsignaciones.aspx.cs" Inherits="ProyectoHTML.Modelo.Agregar.AAsignaciones" %>

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
                <div class="form-container">
                    <div class="input-group">
                        <label class="input-label">Reparacion ID</label>
                        <asp:DropDownList required="" ID="Reparacion" runat="server" CssClass="textbox" OnSelectedIndexChanged="Equipo_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="input-group">
                        <label class="input-label">Tecnico ID</label>
                        <asp:DropDownList required="" ID="Tecnico" runat="server" CssClass="textbox" OnSelectedIndexChanged="Equipo_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="input-group">
                        <label class="input-label">Fecha</label>
                        <asp:TextBox ID="Fecha" runat="server" CssClass="textbox" type="date" required="" OnTextChanged="Fecha_TextChanged"></asp:TextBox>
                    </div>
                </div>
                <div class="button-container">
                    <asp:Button ID="BtnConfirmar" runat="server" Text="Agregar" CssClass="btn-confirmar" OnClick="BtnConfirmar_Click" />
                </div>
                <div class="secondgrid">
                    <div class="sgrid">
                        <h3 class="grid-heading">Reparaciones</h3>
                        <asp:GridView ID="GridView1" runat="server" CssClass="datagrid">
                        </asp:GridView>
                    </div>
                    <div class="sgrid">
                        <h3 class="grid-heading">Tecnicos</h3>
                        <asp:GridView ID="GridView2" runat="server" CssClass="datagrid">
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
