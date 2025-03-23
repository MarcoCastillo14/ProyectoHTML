using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Datos;
using ProyectoHTML.Logica.Grids;

namespace ProyectoHTML.Modelo
{
    public partial class WebForm1 : System.Web.UI.Page
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
                Search search = new Search();
                search.SearchUser(GridViewID, Buscar.Text);
            }
            else
            {
                GridUsuarios inicio = new GridUsuarios();
                inicio.LLenarGridUsuarios(GridViewID);
            }

        }
    }
}