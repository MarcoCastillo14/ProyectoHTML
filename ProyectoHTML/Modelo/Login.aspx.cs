using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyectoHTML.Logica;

namespace ProyectoHTML.Modelo
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Iniciar_Click(object sender, EventArgs e)
        {
            string usuario = Request.Form["iusuario"];
            string contra = Request.Form["icontra"];

            Login_logic inicio = new Login_logic();
            inicio.Validar(this, usuario, contra);

        }
    }
}