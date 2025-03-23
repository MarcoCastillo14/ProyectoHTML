using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica.Grids;
using ProyectoHTML.Modelo.Principales;
using ProyectoHTML.Logica.Agregar;

namespace ProyectoHTML.Modelo.Agregar
{
    public partial class ADetalles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridDetalles inicio = new GridDetalles();
            inicio.LLenarGridDetalles(GridViewID);
            GridReparaciones inicio1 = new GridReparaciones();
            inicio1.LLenarGridReparacionesID(GridView1);
            if (!IsPostBack)
            {
                LlenarDropList();
            }
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Add add = new Add();
            add.AgregarDetalle(int.Parse(Reparacion.SelectedItem.Text), Descripcion.Text, DateTime.Parse(FechaInicio.Text), string.IsNullOrEmpty(FechaFin.Text) ? (DateTime?)null : DateTime.Parse(FechaFin.Text));
            Response.Redirect("../Principales/Inicio.aspx");
        }

        protected void Equipo_SelectedIndexChanged(object sender, EventArgs e)
        {

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

        protected void Fecha_TextChanged(object sender, EventArgs e)
        {

        }
    }
}