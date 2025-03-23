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
    public partial class AEquipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridEquipos inicio = new GridEquipos();
            inicio.LLenarGridEquipos(GridViewID);

            GridUsuarios inicio1 = new GridUsuarios();
            inicio1.LLenarGridUsuariosID(GridView1);

            {
                if (!IsPostBack)
                {
                    LlenarDropList();
                }
            }
        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Add add = new Add();
            add.AgregarEquipo(int.Parse(User.SelectedItem.Text), Tipo.SelectedItem.Text, Modelo.Text);
            Response.Redirect("../Principales/Inicio.aspx");

        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Unnamed2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public void LlenarDropList()
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("DLUser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            sda.Fill(ds);
                            User.DataSource = ds;
                            User.DataTextField = "UsuarioID";
                            User.DataValueField = "UsuarioID";
                            User.DataBind();
                            User.Items.Insert(0, "");
                        }
                    }
                }
            }
        }
    }
}