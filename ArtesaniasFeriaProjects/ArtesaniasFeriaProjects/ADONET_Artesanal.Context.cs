﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ArtesaniasFeriaProjects
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BDArtesanalEntities1 : DbContext
    {
        public BDArtesanalEntities1()
            : base("name=BDArtesanalEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Categoria> Categoria { get; set; }
        public virtual DbSet<Envio> Envio { get; set; }
        public virtual DbSet<Pago> Pago { get; set; }
        public virtual DbSet<Pedido> Pedido { get; set; }
        public virtual DbSet<PedidoDetalle> PedidoDetalle { get; set; }
        public virtual DbSet<Producto> Producto { get; set; }
        public virtual DbSet<ProductoImagen> ProductoImagen { get; set; }
        public virtual DbSet<TipoDePago> TipoDePago { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
    }
}