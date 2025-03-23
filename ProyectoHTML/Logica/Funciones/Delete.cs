using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using ProyectoHTML.Logica.Datos;

namespace ProyectoHTML.Logica.Funciones
{
    public class Delete
    {
        public void BorUsuario(int id)
        {
            SUser.UsuarioID = id;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DelUsuario", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@UsuarioID", SUser.UsuarioID));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public void BorTecnico(int id)
        {
            STecnicos.TecnicoID = id;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DelTecnico", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@TecnicoID", STecnicos.TecnicoID));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public void BorEquipo(int id)
        {
            SEquipos.EquipoID = id;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DelEquipo", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@EquipoID", SEquipos.EquipoID));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public void BorReparacion(int id)
        {
            SReparaciones.ReparacionID = id;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DelReparacion", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ReparacionID", SReparaciones.ReparacionID));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public void BorDetalle(int id)
        {
            SDetalles.DetalleID = id;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DelDetalle", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@DetalleID", SDetalles.DetalleID));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public void BorAsignacion(int id)
        {
            SAsignaciones.AsignacionID = id;
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DelAsignacion", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@AsignacionID", SAsignaciones.AsignacionID));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}