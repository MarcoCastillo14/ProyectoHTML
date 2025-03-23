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
using ProyectoHTML.Logica.Agregar;

namespace ProyectoHTML.Modelo.Agregar
{
    public partial class AAsignaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridAsignaciones inicio = new GridAsignaciones();
            inicio.LLenarGridAsignaciones(GridViewID);
            GridReparaciones inicio1 = new GridReparaciones();
            inicio1.LLenarGridReparacionesID(GridView1);
            GridTecnicos inicio2 = new GridTecnicos();
            inicio2.LLenarGridTecnicos(GridView2);
            if (!IsPostBack)
            {
                LlenarDropList1();
                LlenarDropList2();
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
            Add add = new Add();
            add.AgregarAsignacion(int.Parse(Reparacion.SelectedItem.Text), int.Parse(Tecnico.SelectedItem.Text), DateTime.Parse(Fecha.Text));
            Response.Redirect("../Principales/Inicio.aspx");
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
    }
}