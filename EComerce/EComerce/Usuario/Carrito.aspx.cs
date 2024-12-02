using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EComerce.Usuario
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Código para inicializar la página si es necesario.
            }
        }

        protected void btnApplyCoupon_Click(object sender, EventArgs e)
        {
            // Lógica para aplicar el cupón.
            // Puedes verificar el código del cupón desde el control txtCoupon.Text.
            string couponCode = txtCoupon.Text;

            if (string.IsNullOrWhiteSpace(couponCode))
            {
                lblMsg.Text = "Por favor, ingrese un código de cupón.";
                lblMsg.CssClass = "text-danger";
                return;
            }

            // Supongamos que "DESCUENTO10" es un cupón válido.
            if (couponCode == "DESCUENTO10")
            {
                lblMsg.Text = "Cupón aplicado con éxito. Descuento del 10% aplicado.";
                lblMsg.CssClass = "text-success";
            }
            else
            {
                lblMsg.Text = "El cupón ingresado no es válido.";
                lblMsg.CssClass = "text-danger";
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Lógica para proceder al pago.
            // Por ejemplo, puedes redirigir al usuario a una página de pago:
            Response.Redirect("~/Usuario/Pago.aspx");
        }


    }
}
