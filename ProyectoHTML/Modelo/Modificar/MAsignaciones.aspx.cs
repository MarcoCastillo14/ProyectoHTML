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
    public partial class MAsignaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridAsignaciones inicio = new GridAsignaciones();
            inicio.LLenarGridAsignaciones(GridViewID);
            if (!IsPostBack)
            {
                LlenarDropList1();
                LlenarDropList2();
            }
        }

        protected void Buscar_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Buscar.Text))
            {
                Select select = new Select();
                select.SelectAsignacion(GridViewID, int.Parse(Buscar.Text));
            }
            else
            {
                GridAsignaciones inicio = new GridAsignaciones();
                inicio.LLenarGridAsignaciones(GridViewID);
            }
        }
        public void LlenarDropList1()
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
        public void LlenarDropList2()
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("DLTecnicos", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            sda.Fill(ds);
                            Tecnico.DataSource = ds;
                            Tecnico.DataTextField = "TecnicoID";
                            Tecnico.DataValueField = "TecnicoID";
                            Tecnico.DataBind();
                            Tecnico.Items.Insert(0, "");
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
            update.ModAsignacion(int.Parse(Buscar.Text), string.IsNullOrEmpty(Reparacion.SelectedItem.Text) ? (int?)null : int.Parse(Reparacion.SelectedItem.Text), string.IsNullOrEmpty(Tecnico.SelectedItem.Text) ? (int?)null : int.Parse(Tecnico.SelectedItem.Text), string.IsNullOrEmpty(Fecha.Text) ? (DateTime?)null : DateTime.Parse(Fecha.Text));
            Response.Redirect("../Principales/Inicio.aspx");
        }
    }
}