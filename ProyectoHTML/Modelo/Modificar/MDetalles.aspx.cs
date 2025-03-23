using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Grids.ModSelect;
using ProyectoHTML.Logica.Grids;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using ProyectoHTML.Logica.Funciones;

namespace ProyectoHTML.Modelo.Modificar
{
    public partial class MDetalles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridDetalles inicio = new GridDetalles();
            inicio.LLenarGridDetalles(GridViewID);
            if (!IsPostBack)
            {
                LlenarDropList();
            }
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
        public void LlenarDropList()
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("DLReparacion", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            sda.Fill(ds);
                            Reparacion.DataSource = ds;
                            Reparacion.DataTextField = "ReparacionID";
                            Reparacion.DataValueField = "ReparacionID";
                            Reparacion.DataBind();
                            Reparacion.Items.Insert(0, "");
                        }
                    }
                }
            }
        }

        protected void Equipo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Fecha_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Update update = new Update();
            update.ModDetalle(int.Parse(Buscar.Text), string.IsNullOrEmpty(Reparacion.SelectedItem.Text) ? (int?)null : int.Parse(Reparacion.SelectedItem.Text), Descripcion.Text, string.IsNullOrEmpty(FechaInicio.Text) ? (DateTime?)null : DateTime.Parse(FechaInicio.Text), string.IsNullOrEmpty(FechaFin.Text) ? (DateTime?)null : DateTime.Parse(FechaFin.Text));
            Response.Redirect("../Principales/Inicio.aspx");
        }
    }
}

