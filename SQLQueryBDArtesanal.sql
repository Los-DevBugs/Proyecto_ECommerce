USE master;
GO

-- Crear BDVentas
IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='BDArtesanal')
    DROP DATABASE BDArtesanal;
GO

CREATE DATABASE BDArtesanal;
GO

USE BDArtesanal;
GO

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
    Precio DECIMAL(10, 2) NOT NULL CHECK (Precio >= 0), -- Validación de precio positivo
    Stock INT NOT NULL CHECK (Stock >= 0),             -- Validación de stock positivo
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

-- Tabla de Usuarios
CREATE TABLE Usuario (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Correo NVARCHAR(100) NOT NULL UNIQUE,
    Contrasenia NVARCHAR(255) NOT NULL,
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(15)
);

-- Tabla de Pedidos
CREATE TABLE Pedido (
    PedidoID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT,
    FechaPedido DATETIME DEFAULT GETDATE(),
    Estado NVARCHAR(50) NOT NULL CHECK (Estado IN ('Pendiente', 'Completado', 'Cancelado')),
    Total DECIMAL(10, 2) NOT NULL CHECK (Total >= 0),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID)
);

-- Detalle del Pedido
CREATE TABLE PedidoDetalle (
    PedidoDetalleID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT,
    ProductoID INT,
    Cantidad INT NOT NULL CHECK (Cantidad > 0), -- Validación de cantidad positiva
    PrecioUnitario DECIMAL(10, 2) NOT NULL CHECK (PrecioUnitario >= 0),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Tabla TipoDePago
CREATE TABLE TipoDePago (
    TipoPagoID INT PRIMARY KEY IDENTITY(1,1), -- Nuevo ID para estandarizar claves primarias
    Tipo NVARCHAR(50) NOT NULL,               -- Nombre del tipo de pago (e.g., Tarjeta de Crédito, PayPal)
    Descripcion NVARCHAR(255)                 -- Descripción opcional del tipo de pago
);

-- Tabla de Pagos
CREATE TABLE Pago (
    PagoID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT,
    Monto DECIMAL(10, 2) NOT NULL CHECK (Monto >= 0),
    FechaPago DATETIME DEFAULT GETDATE(),
    MetodoPago NVARCHAR(50) NOT NULL,
    Estado NVARCHAR(50) NOT NULL CHECK (Estado IN ('Pendiente', 'Completado', 'Fallido')),
    TipoPagoID INT, -- Relación con TipoDePago
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    FOREIGN KEY (TipoPagoID) REFERENCES TipoDePago(TipoPagoID)
);

-- Tabla de Envíos
CREATE TABLE Envio (
    EnvioID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT,
    DireccionEnvio NVARCHAR(255) NOT NULL,
    FechaEnvio DATETIME,
    Estado NVARCHAR(50) NOT NULL CHECK (Estado IN ('Pendiente', 'Enviado', 'Entregado', 'Cancelado')),
    MetodoEnvio NVARCHAR(50) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID)
);

-- Tabla para almacenar las imágenes de los productos
CREATE TABLE ProductoImagen (
    ImagenID INT PRIMARY KEY IDENTITY(1,1),
    ProductoID INT,
    URLImagen NVARCHAR(255) NOT NULL,            -- Relación con TipoImagen
    EsPortada BIT NOT NULL DEFAULT 0,           -- Indica si es la imagen principal
    FechaCreacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID),
    CONSTRAINT CK_EsPortada CHECK (EsPortada IN (0, 1)) -- Validación de valor booleano
);