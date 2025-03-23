using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Grids;
using ProyectoHTML.Logica.Agregar;

namespace ProyectoHTML.Modelo.Agregar
{
    public partial class AUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridUsuarios inicio = new GridUsuarios();
            inicio.LLenarGridUsuarios(GridViewID);
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Add add = new Add();
            add.AgregarUsuario(Nombre.Text, Correo.Text, Telefono.Text);
            Response.Redirect("../Principales/Inicio.aspx");
        }
    }
}