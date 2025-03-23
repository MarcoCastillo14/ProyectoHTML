using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using ProyectoHTML.Logica.Datos;
using ProyectoHTML.Logica.Funciones;

namespace ProyectoHTML.Logica.Agregar
{
    public class Add
    {
        public void AgregarUsuario(string nombre, string correo, string telefono)
        {
            SUser.Nombre = nombre;
            SUser.Correo = correo;
            SUser.Telefono = telefono;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("AdiUser", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Nombre", SUser.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Correo", SUser.Correo));
                    cmd.Parameters.Add(new SqlParameter("@Telefono", SUser.Telefono));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public void AgregarTecnico(string nombre, string especialidad)
        {
            STecnicos.Nombre = nombre;
            STecnicos.Especialidad = especialidad;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("AdiTecnico", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Nombre", STecnicos.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Especialidad", STecnicos.Especialidad));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public void AgregarEquipo(int usuarioID, string tipoEquipo, string modelo)
        {
            SEquipos.UsuarioID = usuarioID;
            SEquipos.TipoEquipo = tipoEquipo;
            SEquipos.Modelo = modelo;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("AdiEquipo", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@UsuarioID", SEquipos.UsuarioID));
                    cmd.Parameters.Add(new SqlParameter("@TipoEquipo", SEquipos.TipoEquipo));
                    cmd.Parameters.Add(new SqlParameter("@Modelo", SEquipos.Modelo));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public void AgregarReparacion(int equipoID, DateTime fechaSolicitud, string estado)
        {
            SReparaciones.EquipoID = equipoID;
            SReparaciones.FechaSolicitud = fechaSolicitud;
            SReparaciones.Estado = estado;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("AdiReparacion", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@EquipoID", SReparaciones.EquipoID));
                    cmd.Parameters.Add(new SqlParameter("@FechaSolicitud", SReparaciones.FechaSolicitud));
                    cmd.Parameters.Add(new SqlParameter("@Estado", SReparaciones.Estado));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public void AgregarDetalle(int reparacionID, string descripcion, DateTime fechaInicio, DateTime? fechaFin)
        {
            var parametros = new Dictionary<string, object>
    {
        {"@ReparacionID", reparacionID},
        {"@Descripcion", string.IsNullOrEmpty(descripcion) ? null : descripcion},
        {"@FechaInicio", fechaInicio},
        {"@FechaFin", fechaFin}
    };

            Update.ModParametros("AdiDetalle", parametros);
        }
        public void AgregarAsignacion(int reparacionID, int tecnicoID, DateTime fechaAsignacion)
        {
            SAsignaciones.ReparacionID = reparacionID;
            SAsignaciones.TecnicoID = tecnicoID;
            SAsignaciones.FechaAsignacion = fechaAsignacion;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("AdiAsignacion", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ReparacionID", SAsignaciones.ReparacionID));
                    cmd.Parameters.Add(new SqlParameter("@TecnicoID", SAsignaciones.TecnicoID));
                    cmd.Parameters.Add(new SqlParameter("@FechaAsignacion", SAsignaciones.FechaAsignacion));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}
