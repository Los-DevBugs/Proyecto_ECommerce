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
    
    public partial class TSubCategoria
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TSubCategoria()
        {
            this.TProducto = new HashSet<TProducto>();
        }
    
        public int SCId { get; set; }
        public string SCNombre { get; set; }
        public int CId { get; set; }
        public bool SCEstado { get; set; }
        public System.DateTime SCFCreacion { get; set; }
    
        public virtual TCategoria TCategoria { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TProducto> TProducto { get; set; }
    }
}
