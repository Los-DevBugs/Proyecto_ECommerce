//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EComerce
{
    using System;
    using System.Collections.Generic;
    
    public partial class TPedido
    {
        public int PedDetalleId { get; set; }
        public Nullable<int> PedNumero { get; set; }
        public int PId { get; set; }
        public Nullable<int> PedCantidad { get; set; }
        public int UId { get; set; }
        public Nullable<bool> PedEstado { get; set; }
        public int PagId { get; set; }
        public System.DateTime PedFecha { get; set; }
        public bool PedCancelado { get; set; }
    
        public virtual TPago TPago { get; set; }
        public virtual TProducto TProducto { get; set; }
        public virtual TUsuario TUsuario { get; set; }
    }
}
