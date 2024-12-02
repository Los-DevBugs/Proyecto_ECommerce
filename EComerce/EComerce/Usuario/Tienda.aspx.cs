using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EComerce.Usuario
{
    public partial class Tienda : System.Web.UI.Page
    {
        public List<dynamic> Products { get; set; } // Usamos un tipo dinámico para incluir datos combinados

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            using (BDEComerceEntities1 ventas = new BDEComerceEntities1())
            {
                // Obtener productos con sus imágenes predeterminadas
                Products = (from p in ventas.TProducto
                            join img in ventas.TImagenProducto on p.PId equals img.PId
                            where p.PActivo == true && img.IPPredeterminado == true
                            select new
                            {
                                p.PId,
                                p.PNombre,
                                p.PPprecio,
                                img.IPUrl
                            }).ToList<dynamic>();
            }
        }

    }
}