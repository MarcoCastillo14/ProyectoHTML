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
    public partial class PrincipalTecnicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridTecnicos inicio = new GridTecnicos();
            inicio.LLenarGridTecnicos(GridViewID);
        }

        protected void Buscar_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Buscar.Text))
            {
                Search search = new Search();
                search.SearchTecnico(GridViewID, Buscar.Text);
            }
            else
            {
                GridTecnicos inicio = new GridTecnicos();
                inicio.LLenarGridTecnicos(GridViewID);
            }
        }
    }
}