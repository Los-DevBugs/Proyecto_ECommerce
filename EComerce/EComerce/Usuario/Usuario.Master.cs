using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EComerce.Usuario
{
    public partial class Usuario : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Url.AbsoluteUri.ToString().Contains("Predeterminado.aspx"))
            {
                // Carga el control
                Control controlDiapositiva = (Control)Page.LoadControl("UsuarioControlDeslizador.ascx");
                panelControlUD.Controls.Add(controlDiapositiva);
            }
        }
    }
}