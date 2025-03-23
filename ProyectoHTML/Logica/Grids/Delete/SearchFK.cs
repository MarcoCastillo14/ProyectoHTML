using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ProyectoHTML.Logica.Grids.Delete
{
    public class SearchFK
    {
        public void SUserFKEquipo(GridView grid, int usuarioID)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
                    SELECT * FROM Equipos WHERE UsuarioID = @UsuarioID;";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UsuarioID", usuarioID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
        public void SUserFKReparacion(GridView grid, int usuarioID)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
                    SELECT * FROM Reparaciones WHERE EquipoID IN 
                        (SELECT EquipoID FROM Equipos WHERE UsuarioID = @UsuarioID);";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UsuarioID", usuarioID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
        public void SUserFKAsignacion(GridView grid, int usuarioID)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
                    SELECT * FROM Asignaciones WHERE ReparacionID IN 
                        (SELECT ReparacionID FROM Reparaciones WHERE EquipoID IN 
                            (SELECT EquipoID FROM Equipos WHERE UsuarioID = @UsuarioID));";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UsuarioID", usuarioID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
        public void SUserFKDetalles(GridView grid, int usuarioID)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
                    SELECT * FROM DetallesReparacion WHERE ReparacionID IN 
                        (SELECT ReparacionID FROM Reparaciones WHERE EquipoID IN 
                            (SELECT EquipoID FROM Equipos WHERE UsuarioID = @UsuarioID));";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UsuarioID", usuarioID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
        public void STenicoFKAsignacion(GridView grid, int usuarioID)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
                    SELECT * FROM Asignaciones WHERE TecnicoID = @TecnicoID;";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TecnicoID", usuarioID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
        public void SEquipoFKReparacion(GridView grid, int usuarioID)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
                    SELECT * FROM Reparaciones WHERE EquipoID = @EquipoID;";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EquipoID", usuarioID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
        public void SEquipoFKDetalles(GridView grid, int usuarioID)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
                    SELECT * FROM DetallesReparacion WHERE ReparacionID IN 
                        (SELECT ReparacionID FROM Reparaciones WHERE EquipoID = @EquipoID);";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EquipoID", usuarioID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
        public void SEquipoFKAsignaciones(GridView grid, int usuarioID)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
                    SELECT * FROM Asignaciones WHERE ReparacionID IN 
                        (SELECT ReparacionID FROM Reparaciones WHERE EquipoID = @EquipoID);";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EquipoID", usuarioID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
        public void SReparacionFKDetalles(GridView grid, int usuarioID)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
                    SELECT * FROM DetallesReparacion WHERE ReparacionID = @ReparacionID;";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ReparacionID", usuarioID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
        public void SReparacionFKAsignaciones(GridView grid, int usuarioID)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
                    SELECT * FROM Asignaciones WHERE ReparacionID = @ReparacionID;";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ReparacionID", usuarioID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
    }
}