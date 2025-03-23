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
    public partial class ETecnicos : System.Web.UI.Page
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
                Select select = new Select();
                select.SelectTecnicos(GridViewID, int.Parse(Buscar.Text));
                SearchFK searchFK = new SearchFK();
                searchFK.STenicoFKAsignacion(GridView1, int.Parse(Buscar.Text));
            }
            else
            {
                GridTecnicos inicio = new GridTecnicos();
                inicio.LLenarGridTecnicos(GridViewID);
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Delete delete = new Delete();
            delete.BorTecnico(int.Parse(Buscar.Text));
            Response.Redirect("../Principales/Inicio.aspx");
        }
    }
}