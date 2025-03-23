using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Agregar;
using ProyectoHTML.Logica.Datos;
using ProyectoHTML.Logica.Grids;
using ProyectoHTML.Logica.Grids.ModSelect;
using ProyectoHTML.Logica.Funciones;

namespace ProyectoHTML.Modelo.Modificar
{
    public partial class MUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridUsuarios inicio = new GridUsuarios();
            inicio.LLenarGridUsuarios(GridViewID);
        }

        protected void Buscar_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Buscar.Text))
            {
                Select select = new Select();
                select.SelectUser(GridViewID, int.Parse(Buscar.Text));
            }
            else
            {
                GridUsuarios inicio = new GridUsuarios();
                inicio.LLenarGridUsuarios(GridViewID);
            }
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Update update = new Update();
            update.ModUsuario(int.Parse(Buscar.Text), Nombre.Text, Correo.Text, Telefono.Text);
            Response.Redirect("../Principales/Inicio.aspx");
        }

        protected void Nombre_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Correo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Telefono_TextChanged(object sender, EventArgs e)
        {

        }
    }
}