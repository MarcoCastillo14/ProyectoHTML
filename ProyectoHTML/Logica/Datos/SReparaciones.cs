using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoHTML.Logica.Datos
{
    public class SReparaciones
    {
        public static int ReparacionID { get; set; }
        public static int EquipoID { get; set; }
        public static DateTime FechaSolicitud { get; set; }
        public static string Estado { get; set; }
    }
}