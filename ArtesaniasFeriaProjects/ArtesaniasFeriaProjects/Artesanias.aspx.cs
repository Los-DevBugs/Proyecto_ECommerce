using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtesaniasFeriaProjects
{
    public partial class Artesanias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            using (BDVentasEntities Artesanias = new BDVentasEntities())
            {
                //Consulta LINQ to Entities
                var consulta = from C in Artesanias.TProducto
                               where (C.Nombre == txtBuscar.Text.Trim())
                               || (C.Descripcion == txtBuscar.Text.Trim())

                               select C;
                gvConsulta.DataSource = consulta.ToList();
                gvConsulta.DataBind();
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            // Tu lógica aquí
        }
    }
}