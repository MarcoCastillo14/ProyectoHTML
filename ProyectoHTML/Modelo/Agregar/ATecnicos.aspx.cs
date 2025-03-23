using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Agregar;
using ProyectoHTML.Logica.Grids;

namespace ProyectoHTML.Modelo.Agregar
{
    public partial class Agregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridTecnicos inicio = new GridTecnicos();
            inicio.LLenarGridTecnicos(GridViewID);
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Add add = new Add();
            add.AgregarTecnico(Nombre.Text, Especialidad.SelectedItem.Text);
            Response.Redirect("../Principales/Inicio.aspx");
        }

        protected void Unnamed2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}