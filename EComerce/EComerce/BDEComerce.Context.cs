﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BDEComerceEntities1 : DbContext
    {
        public BDEComerceEntities1()
            : base("name=BDEComerceEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TCarrito> TCarrito { get; set; }
        public virtual DbSet<TCategoria> TCategoria { get; set; }
        public virtual DbSet<TContacto> TContacto { get; set; }
        public virtual DbSet<TImagenProducto> TImagenProducto { get; set; }
        public virtual DbSet<TListaDeseos> TListaDeseos { get; set; }
        public virtual DbSet<TPago> TPago { get; set; }
        public virtual DbSet<TPedido> TPedido { get; set; }
        public virtual DbSet<TProducto> TProducto { get; set; }
        public virtual DbSet<TReseniaProducto> TReseniaProducto { get; set; }
        public virtual DbSet<TRoles> TRoles { get; set; }
        public virtual DbSet<TSubCategoria> TSubCategoria { get; set; }
        public virtual DbSet<TUsuario> TUsuario { get; set; }
    }
}