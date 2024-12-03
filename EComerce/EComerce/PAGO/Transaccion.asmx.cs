using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace PAGO
{
    /// <summary>
    /// Descripción breve de Transaccion
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class Transaccion : System.Web.Services.WebService
    {
        [WebMethod(Description = "cobrar")]
        public string cobrar(string numTarjeta, string fecha, string ccv, float monto)
        {
            try
            {
                // Instancia del contexto de la base de datos
                using (var tarjetaContext = new BDPagosEntities2())
                {
                    // Obtener la tarjeta correspondiente
                    var tarjeta = tarjetaContext.tarjetas.FirstOrDefault(t => t.numTarjeta == numTarjeta && t.fecha == fecha && t.ccv == ccv);

                    // Validar si se encontró la tarjeta
                    if (tarjeta != null)
                    {
                        // Actualizar el monto de la tarjeta o hacer el procesamiento que sea necesario
                        tarjeta.monto -= monto;

                        // Guardar los cambios
                        tarjetaContext.SaveChanges();

                        // Retornar el mensaje típico de una compra en línea
                        return $"Compra exitosa! Tarjeta terminada en {numTarjeta.Substring(numTarjeta.Length - 4)}. Total cobrado: S/{monto}. El saldo restante es: S/{tarjeta.monto}.";
                    }
                    else
                    {
                        return "Datos de tarjeta incorrectos o no encontrados.";
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejo de errores
                return $"Error: {ex.Message}";
            }
        }

    }
}
