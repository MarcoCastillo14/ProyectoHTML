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
    public partial class EEquipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridEquipos inicio = new GridEquipos();
            inicio.LLenarGridEquipos(GridViewID);
        }

        protected void Buscar_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Buscar.Text))
            {
                Select select = new Select();
                select.SelectEquipos(GridViewID, int.Parse(Buscar.Text));
                SearchFK searchFK = new SearchFK();
                searchFK.SEquipoFKReparacion(GridView1, int.Parse(Buscar.Text));
                SearchFK searchFK1 = new SearchFK();
                searchFK1.SEquipoFKDetalles(GridView2, int.Parse(Buscar.Text));
                SearchFK searchFK2 = new SearchFK();
                searchFK2.SEquipoFKAsignaciones(GridView3, int.Parse(Buscar.Text));
            }
            else
            {
                GridEquipos inicio = new GridEquipos();
                inicio.LLenarGridEquipos(GridViewID);
                GridView1.DataSource = null;
                GridView1.DataBind();
                GridView2.DataSource = null;
                GridView2.DataBind();
                GridView3.DataSource = null;
                GridView3.DataBind();
            }
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Delete delete = new Delete();
            delete.BorEquipo(int.Parse(Buscar.Text));
            Response.Redirect("../Principales/Inicio.aspx");
        }
    }
}