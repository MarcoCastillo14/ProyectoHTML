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
    public partial class EReparaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridReparaciones inicio = new GridReparaciones();
            inicio.LLenarGridReparaciones(GridViewID);
        }

        protected void Buscar_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Buscar.Text))
            {
                Select select = new Select();
                select.SelectReparacion(GridViewID, int.Parse(Buscar.Text));
                SearchFK searchFK = new SearchFK();
                searchFK.SReparacionFKDetalles(GridView1, int.Parse(Buscar.Text));
                SearchFK searchFK1 = new SearchFK();
                searchFK1.SReparacionFKAsignaciones(GridView2, int.Parse(Buscar.Text));
                SearchFK searchFK2 = new SearchFK();
            }
            else
            {
                GridReparaciones inicio = new GridReparaciones();
                inicio.LLenarGridReparaciones(GridViewID);
                GridView1.DataSource = null;
                GridView1.DataBind();
                GridView2.DataSource = null;
                GridView2.DataBind();
            }
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Delete delete = new Delete();
            delete.BorReparacion(int.Parse(Buscar.Text));
            Response.Redirect("../Principales/Inicio.aspx");
        }
    }
}