using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Grids;

namespace ProyectoHTML.Modelo.Principales
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridInicio inicio = new GridInicio();
            inicio.GridAsignadas(GridViewID);
        }

        protected void Asignar_Click(object sender, EventArgs e)
        {
            GridInicio inicio = new GridInicio();
            inicio.GridAsignadas(GridViewID);
        }

        protected void PorAsignar_Click(object sender, EventArgs e)
        {
            GridInicio inicio = new GridInicio();
            inicio.GridPorAsignar(GridViewID);
        }

        protected void Pendiente_Click(object sender, EventArgs e)
        {
            GridInicio inicio = new GridInicio();
            inicio.GridPendientes(GridViewID);
        }

        protected void Completada_Click(object sender, EventArgs e)
        {
            GridInicio inicio = new GridInicio();
            inicio.GridCompletadas(GridViewID);
        }
    }
}