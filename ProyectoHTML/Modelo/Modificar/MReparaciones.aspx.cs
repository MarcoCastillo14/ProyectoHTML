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
using ProyectoHTML.Logica.Grids.ModSelect;
using ProyectoHTML.Logica.Funciones;

namespace ProyectoHTML.Modelo.Modificar
{
    public partial class MReparaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridReparaciones inicio = new GridReparaciones();
            inicio.LLenarGridReparaciones(GridViewID);

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
                select.SelectReparacion(GridViewID, int.Parse(Buscar.Text));
            }
            else
            {
                GridReparaciones inicio = new GridReparaciones();
                inicio.LLenarGridReparaciones(GridViewID);
            }
        }
        public void LlenarDropList()
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("DLEquipo", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            sda.Fill(ds);
                            Equipo.DataSource = ds;
                            Equipo.DataTextField = "EquipoID";
                            Equipo.DataValueField = "EquipoID";
                            Equipo.DataBind();
                            Equipo.Items.Insert(0, "");
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

        protected void Unnamed2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Update update = new Update();
            update.ModReparacion(int.Parse(Buscar.Text), string.IsNullOrEmpty(Equipo.SelectedItem.Text) ? (int?)null : int.Parse(Equipo.SelectedItem.Text), string.IsNullOrEmpty(Fecha.Text) ? (DateTime?)null : DateTime.Parse(Fecha.Text), Estado.SelectedItem.Text);
            Response.Redirect("../Principales/Inicio.aspx");
        }
    }
}
