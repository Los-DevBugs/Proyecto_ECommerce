USE BDArtesanal;
GO

-- Insertar Categor�as
INSERT INTO Categoria (Nombre, Descripcion)
VALUES 
    ('Textiles', 'Tejidos tradicionales hechos a mano'),
    ('Cer�mica', 'Productos cer�micos decorativos y utilitarios'),
    ('Joyer�a', 'Accesorios hechos con plata y piedras locales'),
    ('Tallados', 'Esculturas en madera y piedra t�picas de la regi�n');

-- Insertar Productos
INSERT INTO Producto (Nombre, Descripcion, Precio, Stock, CategoriaID)
VALUES
    ('Poncho Andino', 'Poncho tejido a mano con lana de alpaca', 150.00, 20, 1),
    ('Chullo de Alpaca', 'Gorro tradicional de lana con dise�os incas', 50.00, 30, 1),
    ('Vasija Decorativa', 'Cer�mica pintada con dise�os cusque�os', 75.00, 15, 2),
    ('Taza Inca', 'Taza de cer�mica con motivos incas', 25.00, 50, 2),
    ('Pulsera de Plata', 'Pulsera artesanal con piedras de los Andes', 120.00, 10, 3),
    ('Collar de Plata', 'Collar decorado con motivos cusque�os', 200.00, 5, 3),
    ('Escultura de Madera', 'Tallado de madera en forma de llama', 80.00, 12, 4),
    ('M�scara Ceremonial', 'M�scara de madera decorada con pintura', 150.00, 8, 4),
    ('Bufanda de Alpaca', 'Bufanda tejida a mano con lana de alpaca', 60.00, 25, 1),
    ('Jarr�n de Cer�mica', 'Jarr�n decorado con figuras tradicionales', 90.00, 10, 2),
    ('Anillo de Plata', 'Anillo con grabados inspirados en la cultura inca', 180.00, 7, 3),
    ('Estatua de C�ndor', 'Escultura en madera de un c�ndor andino', 250.00, 3, 4);

-- Insertar Usuarios
INSERT INTO Usuario (Nombre, Correo, Contrasenia, Direccion, Telefono)
VALUES
    ('Juan P�rez', 'juan.perez@example.com', 'contrasenia123', 'Calle Principal 123, Cusco', '987654321'),
    ('Mar�a G�mez', 'maria.gomez@example.com', 'contrasegura456', 'Avenida del Sol 456, Cusco', '987123456'),
    ('Carlos Quispe', 'carlos.quispe@example.com', 'password789', 'Plaza Mayor 789, Cusco', '998765432'),
    ('Ana Huam�n', 'ana.huaman@example.com', 'clavefuerte321', 'Barrio San Blas 321, Cusco', '976543219');

-- Insertar Pedidos
INSERT INTO Pedido (UsuarioID, Estado, Total)
VALUES
    (1, 'Pendiente', 275.00),
    (2, 'Completado', 600.00),
    (3, 'Pendiente', 150.00),
    (4, 'Completado', 450.00);

-- Insertar Detalles de Pedido
INSERT INTO PedidoDetalle (PedidoID, ProductoID, Cantidad, PrecioUnitario)
VALUES
    (1, 1, 1, 150.00), -- Juan P�rez compra un Poncho
    (1, 9, 2, 60.00),  -- Juan P�rez compra dos bufandas
    (2, 5, 1, 120.00), -- Mar�a G�mez compra una pulsera
    (2, 6, 2, 200.00), -- Mar�a G�mez compra dos collares
    (3, 8, 1, 150.00), -- Carlos Quispe compra una m�scara
    (4, 7, 3, 80.00);  -- Ana Huam�n compra tres esculturas

-- Insertar Tipos de Pago
INSERT INTO TipoDePago (Tipo, Descripcion)
VALUES
    ('Tarjeta de Cr�dito', 'Pago con tarjeta de cr�dito'),
    ('Transferencia Bancaria', 'Pago a trav�s de transferencia bancaria');

-- Insertar Pagos
INSERT INTO Pago (PedidoID, Monto, MetodoPago, Estado, TipoPagoID)
VALUES
    (1, 275.00, 'Tarjeta de Cr�dito', 'Pendiente', 1),
    (2, 600.00, 'Transferencia Bancaria', 'Completado', 2),
    (3, 150.00, 'Tarjeta de Cr�dito', 'Completado', 1),
    (4, 450.00, 'Tarjeta de Cr�dito', 'Completado', 1);

-- Insertar Env�os
INSERT INTO Envio (PedidoID, DireccionEnvio, FechaEnvio, Estado, MetodoEnvio)
VALUES
    (2, 'Avenida del Sol 456, Cusco', '2024-11-15', 'Entregado', 'Motocicleta'),
    (4, 'Barrio San Blas 321, Cusco', '2024-11-16', 'Enviado', 'Motocicleta');

-- Insertar Im�genes de Productos
INSERT INTO ProductoImagen (ProductoID, URLImagen, EsPortada)
VALUES
    (1, 'https://example.com/images/poncho.jpg', 1),
    (2, 'https://example.com/images/chullo.jpg', 1),
    (3, 'https://example.com/images/vasija.jpg', 1),
    (4, 'https://example.com/images/taza.jpg', 1),
    (5, 'https://example.com/images/pulsera.jpg', 1),
    (6, 'https://example.com/images/collar.jpg', 1),
    (7, 'https://example.com/images/escultura.jpg', 1),
    (8, 'https://example.com/images/mascara.jpg', 1),
    (9, 'https://example.com/images/bufanda.jpg', 1),
    (10, 'https://example.com/images/jarron.jpg', 1),
    (11, 'https://example.com/images/anillo.jpg', 1),
    (12, 'https://example.com/images/condor.jpg', 1);

-- Consultas para verificar datos
SELECT * FROM Usuario;
SELECT * FROM PedidoDetalle;
SELECT * FROM Producto;
SELECT * FROM Pago;
