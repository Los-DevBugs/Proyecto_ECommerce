using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtesaniasWeb
{
    public partial class consulta : System.Web.UI.Page
    {

        private void Listar()
        {
            using (BDArtesanalEntities producto = new BDArtesanalEntities())
            {
                //Consulta LINQ to Entities
                var Consulta = from C in producto.Producto
                               select C;
                gvConsulta.DataSource = Consulta.ToList();
                gvConsulta.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // solo carga la primera vez
            if (!Page.IsPostBack)
            {
                Listar();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            using (BDArtesanalEntities producto = new BDArtesanalEntities())
            {
                //Consulta LINQ to Entities
                var consulta = from C in producto.Producto
                               where (C.Nombre == txtBuscar.Text.Trim())
                               || (C.Descripcion == txtBuscar.Text.Trim())
                               select C;
                gvConsulta.DataSource = consulta.ToList();
                gvConsulta.DataBind();
            }
        }
    }
}