using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Datos;
using ProyectoHTML.Logica.Funciones;
using ProyectoHTML.Logica.Grids;
using ProyectoHTML.Logica.Grids.Delete;
using ProyectoHTML.Logica.Grids.ModSelect;

namespace ProyectoHTML.Modelo.Eliminar
{
    public partial class EUsuarios : System.Web.UI.Page
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
                SearchFK searchFK = new SearchFK();
                searchFK.SUserFKEquipo(GridView1, int.Parse(Buscar.Text));
                SearchFK searchFK1 = new SearchFK();
                searchFK1.SUserFKReparacion(GridView2, int.Parse(Buscar.Text));
                SearchFK searchFK2 = new SearchFK();
                searchFK2.SUserFKAsignacion(GridView3, int.Parse(Buscar.Text));
                SearchFK searchFK3 = new SearchFK();
                searchFK3.SUserFKDetalles(GridView4, int.Parse(Buscar.Text));
            }
            else
            {
                GridUsuarios inicio = new GridUsuarios();
                inicio.LLenarGridUsuarios(GridViewID);
                GridView1.DataSource = null;
                GridView1.DataBind();
                GridView2.DataSource = null;
                GridView2.DataBind();
                GridView3.DataSource = null;
                GridView3.DataBind();
                GridView4.DataSource = null;
                GridView4.DataBind();
            }
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Delete delete = new Delete();
            delete.BorUsuario(int.Parse(Buscar.Text));
            Response.Redirect("../Principales/Inicio.aspx");
        }
    }
}