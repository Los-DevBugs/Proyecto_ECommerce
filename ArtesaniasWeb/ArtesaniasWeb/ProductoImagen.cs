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
    
    public partial class ProductoImagen
    {
        public int ImagenID { get; set; }
        public Nullable<int> ProductoID { get; set; }
        public string URLImagen { get; set; }
        public bool EsPortada { get; set; }
        public Nullable<System.DateTime> FechaCreacion { get; set; }
    
        public virtual Producto Producto { get; set; }
    }
}
