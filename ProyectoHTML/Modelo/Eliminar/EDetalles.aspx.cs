using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Funciones;
using ProyectoHTML.Logica.Grids;
using ProyectoHTML.Logica.Grids.Delete;
using ProyectoHTML.Logica.Grids.ModSelect;

namespace ProyectoHTML.Modelo.Eliminar
{
    public partial class EDetalles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridDetalles inicio = new GridDetalles();
            inicio.LLenarGridDetalles(GridViewID);
        }

        protected void Buscar_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Buscar.Text))
            {
                Select select = new Select();
                select.SelectDetalle(GridViewID, int.Parse(Buscar.Text));
            }
            else
            {
                GridDetalles inicio = new GridDetalles();
                inicio.LLenarGridDetalles(GridViewID);
            }
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Delete delete = new Delete();
            delete.BorDetalle(int.Parse(Buscar.Text));
            Response.Redirect("../Principales/Inicio.aspx");
        }
    }
}