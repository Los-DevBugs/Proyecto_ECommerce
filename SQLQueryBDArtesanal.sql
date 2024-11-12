use master 
go

--crear BDVentas
IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='BDVentas')
	DROP DATABASE BDVentas;
GO

create database BDVentas
go

 use BDVentas
go

-- Tabla de Categorías
CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255)
);

-- Tabla de Productos
CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255),
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

-- Tabla de Usuarios
CREATE TABLE Usuario (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Correo NVARCHAR(100) NOT NULL UNIQUE,
    Contraseña NVARCHAR(255) NOT NULL,
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(15)
);


-- Tabla de Pedidos
CREATE TABLE Pedido (
    PedidoID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT,
    FechaPedido DATETIME DEFAULT GETDATE(),
    Estado NVARCHAR(50) NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID)
);

-- Detalle del Pedido
CREATE TABLE PedidoDetalle (
    PedidoDetalleID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT,
    ProductoID INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Tabla de Pagos
CREATE TABLE Pago (
    PagoID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT,
    Monto DECIMAL(10, 2) NOT NULL,
    FechaPago DATETIME DEFAULT GETDATE(),
    MetodoPago NVARCHAR(50) NOT NULL,
    Estado NVARCHAR(50) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID)
);

-- Tabla de Envíos
CREATE TABLE Envio (
    EnvioID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT,
    DireccionEnvio NVARCHAR(255) NOT NULL,
    FechaEnvio DATETIME,
    Estado NVARCHAR(50) NOT NULL,
    MetodoEnvio NVARCHAR(50) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID)
);

-- Tabla para almacenar las imágenes de los productos
CREATE TABLE ProductoImagen (
    ImagenID INT PRIMARY KEY IDENTITY(1,1),
    ProductoID INT,
    URLImagen NVARCHAR(255) NOT NULL,  -- Ruta o URL de la imagen
    EsPortada BIT NOT NULL DEFAULT 0,   -- Indica si es la imagen principal del producto
    FechaCreacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);