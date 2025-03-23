using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Funciones;
using ProyectoHTML.Logica.Grids;
using ProyectoHTML.Logica.Grids.ModSelect;

namespace ProyectoHTML.Modelo.Modificar
{
    public partial class MTecnicos : System.Web.UI.Page
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
            }
            else
            {
                GridTecnicos inicio = new GridTecnicos();
                inicio.LLenarGridTecnicos(GridViewID);
            }
        }

        protected void Nombre_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Unnamed2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Update update = new Update();
            update.ModTecnico(int.Parse(Buscar.Text), Nombre.Text, Especialidad.SelectedItem.Text);
            Response.Redirect("../Principales/Inicio.aspx");
        }
    }
}