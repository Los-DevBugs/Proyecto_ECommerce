USE ECommerceArtesaniasCusco;
GO

-- Insertar categorías de artesanías
INSERT INTO Categoria (Nombre, Descripcion) VALUES 
('Textiles', 'Tejidos tradicionales hechos a mano con lana de alpaca y oveja'),
('Cerámica', 'Artículos de cerámica decorativa y utilitaria'),
('Joyería', 'Joyas elaboradas con técnicas artesanales y materiales locales'),
('Escultura en Piedra', 'Esculturas hechas a mano usando piedra andina'),
('Instrumentos Musicales', 'Instrumentos musicales tradicionales de los Andes');

-- Insertar productos de ejemplo
INSERT INTO Producto (Nombre, Descripcion, Precio, Stock, CategoriaID) VALUES 
('Chullo de Alpaca', 'Sombrero tradicional andino tejido a mano con lana de alpaca', 25.00, 50, 1),
('Manta Andina', 'Manta tejida a mano en telar tradicional', 80.00, 20, 1),
('Cerámica de Pucará', 'Escultura de toro de Pucará, símbolo de protección', 15.00, 60, 2),
('Vasija Inca', 'Vasija decorativa inspirada en la cultura inca', 30.00, 30, 2),
('Anillo de Plata', 'Anillo artesanal con diseño incaico', 45.00, 40, 3),
('Pulsera de Cuentas', 'Pulsera hecha a mano con cuentas y piedras locales', 10.00, 100, 3),
('Estatuilla de Pachamama', 'Figura de la diosa andina Pachamama en piedra', 35.00, 25, 4),
('Escultura de Cóndor', 'Escultura de cóndor en piedra tallada', 50.00, 15, 4),
('Quena', 'Flauta andina hecha de bambú', 20.00, 30, 5),
('Charango', 'Instrumento musical de cuerdas originario de los Andes', 150.00, 10, 5),
('Ocarina de Cerámica', 'Instrumento de viento hecho en cerámica', 12.00, 40, 5),
('Bolso Andino', 'Bolso hecho con tejidos tradicionales', 35.00, 20, 1),
('Collar de Plata y Turquesa', 'Collar hecho a mano con diseño tradicional', 60.00, 35, 3),
('Mascara Ceremonial', 'Máscara decorativa usada en ceremonias', 25.00, 50, 2),
('Tapiz Decorativo', 'Tapiz tejido a mano con motivos andinos', 75.00, 15, 1),
('Pendiente de Plata', 'Aretes de plata con diseño andino', 20.00, 60, 3),
('Escultura del Sol', 'Escultura en piedra que representa el Inti, dios del sol', 40.00, 20, 4),
('Cucharón de Cerámica', 'Utensilio de cocina hecho de cerámica', 10.00, 80, 2),
('Bufanda de Alpaca', 'Bufanda hecha a mano con lana de alpaca', 30.00, 40, 1),
('Jarra Inca', 'Jarra decorativa inspirada en la iconografía inca', 28.00, 50, 2);

-- Insertar usuarios de ejemplo
INSERT INTO Usuario (Nombre, Correo, Contraseña, Direccion, Telefono) VALUES 
('Carlos Pérez', 'carlos.perez@example.com', 'password123', 'Av. El Sol 123, Cusco', '987654321'),
('Ana Quispe', 'ana.quispe@example.com', 'password123', 'Jr. Puno 456, Cusco', '987654322'),
('Luis Condori', 'luis.condori@example.com', 'password123', 'Av. Tupac Amaru 789, Cusco', '987654323');

-- Insertar pedidos de ejemplo
INSERT INTO Pedido (UsuarioID, Estado, Total) VALUES 
(1, 'Pendiente', 100.00),
(2, 'Completado', 150.00),
(3, 'Enviado', 80.00);

-- Insertar detalles de los pedidos
INSERT INTO PedidoDetalle (PedidoID, ProductoID, Cantidad, PrecioUnitario) VALUES 
(1, 1, 2, 25.00),   -- 2 Chullos de Alpaca
(1, 3, 1, 15.00),   -- 1 Cerámica de Pucará
(2, 5, 2, 45.00),   -- 2 Anillos de Plata
(2, 10, 1, 150.00), -- 1 Charango
(3, 9, 1, 20.00),   -- 1 Quena
(3, 2, 1, 80.00);   -- 1 Manta Andina

-- Insertar pagos de ejemplo
INSERT INTO Pago (PedidoID, Monto, MetodoPago, Estado) VALUES 
(1, 100.00, 'Tarjeta de Crédito', 'Pagado'),
(2, 150.00, 'PayPal', 'Pagado'),
(3, 80.00, 'Transferencia Bancaria', 'Pendiente');

-- Insertar envíos de ejemplo
INSERT INTO Envio (PedidoID, DireccionEnvio, FechaEnvio, Estado, MetodoEnvio) VALUES 
(1, 'Av. El Sol 123, Cusco', GETDATE(), 'Enviado', 'Courier'),
(2, 'Jr. Puno 456, Cusco', GETDATE(), 'Entregado', 'Courier'),
(3, 'Av. Tupac Amaru 789, Cusco', NULL, 'Preparando', 'Recojo en tienda');
