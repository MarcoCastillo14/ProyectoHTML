using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Datos;
using ProyectoHTML.Logica.Grids;

namespace ProyectoHTML.Modelo.Principales
{
    public partial class PReparaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridReparaciones inicio = new GridReparaciones();
            inicio.LLenarGridReparaciones(GridViewID);
        }

        protected void Unnamed2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Buscar.SelectedItem.Text))
            {
                Search search = new Search();
                search.SearchReparacion(GridViewID, Buscar.SelectedItem.Text);
            }
            else
            {
                GridReparaciones inicio = new GridReparaciones();
                inicio.LLenarGridReparaciones(GridViewID);
            }
        }
    }
}