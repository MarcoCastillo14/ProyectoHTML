using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using ProyectoHTML.Logica.Datos;

namespace ProyectoHTML.Logica
{
    public class Login_logic
    {
        public void Message(Page pag, string Mensaje)
        {
            ScriptManager.RegisterStartupScript(pag, GetType(), "alert", $"alert('{Mensaje}');", true);
        }
        public void Validar(Page pag, string user, string passw)
        {
            Logindt.SesionID = user;
            Logindt.Contrasena = passw;
            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("logins", connection))
                {
                    connection.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;                   
                    cmd.Parameters.Add(new SqlParameter("@SesionID", Logindt.SesionID));
                    cmd.Parameters.Add(new SqlParameter("@Contrasena", Logindt.Contrasena));

                    SqlDataReader aux = cmd.ExecuteReader();
                    if (aux.HasRows)
                    {                        
                        pag.Response.Redirect("Principales/Inicio.aspx");
                    }
                    else
                    {
                        Message(pag, "Usuario y/o contraseñas incorrectas.");
                    }
                };

            }
        }
    }
}