//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ArtesaniasWeb
{
    using System;
    using System.Collections.Generic;
    
    public partial class Envio
    {
        public int EnvioID { get; set; }
        public Nullable<int> PedidoID { get; set; }
        public string DireccionEnvio { get; set; }
        public Nullable<System.DateTime> FechaEnvio { get; set; }
        public string Estado { get; set; }
        public string MetodoEnvio { get; set; }
    
        public virtual Pedido Pedido { get; set; }
    }
}
