using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ProyectoHTML.Logica.Funciones
{
    public class Update
    {
       static public void ModParametros(string spName, Dictionary<string, object> parametros)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(spName, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    foreach (var param in parametros)
                    {
                        if (param.Value != null)
                        {
                            cmd.Parameters.Add(new SqlParameter(param.Key, param.Value));
                        }
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public void ModUsuario(int usuarioID, string nombre, string correo, string telefono)
        {
            var parametros = new Dictionary<string, object>
    {
        {"@UsuarioID", usuarioID},
        {"@Nombre", string.IsNullOrEmpty(nombre) ? null : nombre},
        {"@Correo", string.IsNullOrEmpty(correo) ? null : correo},
        {"@Telefono", string.IsNullOrEmpty(telefono) ? null : telefono}
    };

            ModParametros("UpdateUsuario", parametros);
        }
        public void ModTecnico(int tecnicoID, string nombre, string especialidad)
        {
            var parametros = new Dictionary<string, object>
    {
        {"@TecnicoID", tecnicoID},
        {"@Nombre", string.IsNullOrEmpty(nombre) ? null : nombre},
        {"@Especialidad", string.IsNullOrEmpty(especialidad) ? null : especialidad}
    };

            ModParametros("UpdateTecnico", parametros);
        }
        public void ModEquipo(int equipoID, int? usuarioID, string tipoEquipo, string modelo)
        {
            var parametros = new Dictionary<string, object>
    {
        {"@EquipoID", equipoID},
        {"@UsuarioID", usuarioID},
        {"@TipoEquipo", string.IsNullOrEmpty(tipoEquipo) ? null : tipoEquipo},
        {"@Modelo", string.IsNullOrEmpty(modelo) ? null : modelo}
    };

            ModParametros("UpdateEquipo", parametros);
        }
        public void ModReparacion(int reparacionID, int? equipoID, DateTime? fechaSolicitud, string estado)
        {
            var parametros = new Dictionary<string, object>
    {
        {"@ReparacionID", reparacionID},
        {"@EquipoID", equipoID},
        {"@FechaSolicitud", fechaSolicitud},
        {"@Estado", string.IsNullOrEmpty(estado) ? null : estado}
    };

            ModParametros("UpdateReparacion", parametros);
        }
        public void ModDetalle(int detalleID, int? reparacionID, string descripcion, DateTime? fechaInicio, DateTime? fechaFin)
        {
            var parametros = new Dictionary<string, object>
    {
        {"@DetalleID", detalleID},
        {"@ReparacionID", reparacionID},
        {"@Descripcion", string.IsNullOrEmpty(descripcion) ? null : descripcion},
        {"@FechaInicio", fechaInicio},
        {"@FechaFin", fechaFin}
    };

            ModParametros("UpdateDetalle", parametros);
        }
        public void ModAsignacion(int asignacionID, int? reparacionID, int? tecnicoID, DateTime? fechaAsignacion)
        {
            var parametros = new Dictionary<string, object>
    {
        {"@AsignacionID", asignacionID},
        {"@ReparacionID", reparacionID},
        {"@TecnicoID", tecnicoID},
        {"@FechaAsignacion", fechaAsignacion}
    };

            ModParametros("UpdateAsignacion", parametros);
        }

    }
}