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
    public partial class MEquipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridEquipos inicio = new GridEquipos();
            inicio.LLenarGridEquipos(GridViewID);
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
                select.SelectEquipos(GridViewID, int.Parse(Buscar.Text));
            }
            else
            {
                GridEquipos inicio = new GridEquipos();
                inicio.LLenarGridEquipos(GridViewID);
            }
        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Unnamed2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Modelo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnConfirmar_Click(object sender, EventArgs e)
        {
            Update update = new Update();
            update.ModEquipo(int.Parse(Buscar.Text), string.IsNullOrEmpty(User.SelectedItem.Text)? (int?)null : int.Parse(User.SelectedItem.Text), Tipo.SelectedItem.Text, Modelo.Text);
            Response.Redirect("../Principales/Inicio.aspx");
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