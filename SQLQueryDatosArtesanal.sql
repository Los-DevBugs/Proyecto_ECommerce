USE ECommerceArtesaniasCusco;
GO

-- Insertar categorias de artesanias
INSERT INTO Categoria (Nombre, Descripcion) VALUES 
('Textiles', 'Tejidos tradicionales hechos a mano con lana de alpaca y oveja'),
('Ceramica', 'Articulos de ceramica decorativa y utilitaria'),
('Joyería', 'Joyas elaboradas con tecnicas artesanales y materiales locales'),
('Escultura en Piedra', 'Esculturas hechas a mano usando piedra andina'),
('Instrumentos Musicales', 'Instrumentos musicales tradicionales de los Andes');

-- Insertar productos de ejemplo
INSERT INTO Producto (Nombre, Descripcion, Precio, Stock, CategoriaID) VALUES 
('Chullo de Alpaca', 'Sombrero tradicional andino tejido a mano con lana de alpaca', 25.00, 50, 1),
('Manta Andina', 'Manta tejida a mano en telar tradicional', 80.00, 20, 1),
('Ceramica de Pucara', 'Escultura de toro de Pucara, simbolo de proteccion', 15.00, 60, 2),
('Vasija Inca', 'Vasija decorativa inspirada en la cultura inca', 30.00, 30, 2),
('Anillo de Plata', 'Anillo artesanal con diseño incaico', 45.00, 40, 3),
('Pulsera de Cuentas', 'Pulsera hecha a mano con cuentas y piedras locales', 10.00, 100, 3),
('Estatuilla de Pachamama', 'Figura de la diosa andina Pachamama en piedra', 35.00, 25, 4),
('Escultura de Condor', 'Escultura de condor en piedra tallada', 50.00, 15, 4),
('Quena', 'Flauta andina hecha de bamboo', 20.00, 30, 5),
('Charango', 'Instrumento musical de cuerdas originario de los Andes', 150.00, 10, 5),
('Ocarina de Ceramica', 'Instrumento de viento hecho en ceramica', 12.00, 40, 5),
('Bolso Andino', 'Bolso hecho con tejidos tradicionales', 35.00, 20, 1),
('Collar de Plata y Turquesa', 'Collar hecho a mano con diseño tradicional', 60.00, 35, 3),
('Mascara Ceremonial', 'Mascara decorativa usada en ceremonias', 25.00, 50, 2),
('Tapiz Decorativo', 'Tapiz tejido a mano con motivos andinos', 75.00, 15, 1),
('Pendiente de Plata', 'Aretes de plata con diseño andino', 20.00, 60, 3),
('Escultura del Sol', 'Escultura en piedra que representa el Inti, dios del sol', 40.00, 20, 4),
('Cucharón de Ceramica', 'Utensilio de cocina hecho de ceramica', 10.00, 80, 2),
('Bufanda de Alpaca', 'Bufanda hecha a mano con lana de alpaca', 30.00, 40, 1),
('Jarra Inca', 'Jarra decorativa inspirada en la iconografia inca', 28.00, 50, 2);

-- Insertar usuarios de ejemplo
INSERT INTO Usuario (Nombre, Correo, Contraseña, Direccion, Telefono) VALUES 
('Carlos Perez', 'carlos.perez@example.com', 'password123', 'Av. El Sol 123, Cusco', '987654321'),
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
(1, 3, 1, 15.00),   -- 1 Ceramica de Pucara
(2, 5, 2, 45.00),   -- 2 Anillos de Plata
(2, 10, 1, 150.00), -- 1 Charango
(3, 9, 1, 20.00),   -- 1 Quena
(3, 2, 1, 80.00);   -- 1 Manta Andina

-- Insertar pagos de ejemplo
INSERT INTO Pago (PedidoID, Monto, MetodoPago, Estado) VALUES 
(1, 100.00, 'Tarjeta de Credito', 'Pagado'),
(2, 150.00, 'PayPal', 'Pagado'),
(3, 80.00, 'Transferencia Bancaria', 'Pendiente');

-- Insertar envios de ejemplo
INSERT INTO Envio (PedidoID, DireccionEnvio, FechaEnvio, Estado, MetodoEnvio) VALUES 
(1, 'Av. El Sol 123, Cusco', GETDATE(), 'Enviado', 'Courier'),
(2, 'Jr. Puno 456, Cusco', GETDATE(), 'Entregado', 'Courier'),
(3, 'Av. Tupac Amaru 789, Cusco', NULL, 'Preparando', 'Recojo en tienda');

-- Insertar imagenes para los productos
INSERT INTO ProductoImagen (ProductoID, URLImagen, EsPortada) VALUES 
(1, 'https://mi-sitio.com/imagenes/chullo_alpaca.jpg', 1),   -- Imagen de portada del Chullo de Alpaca
(2, 'https://mi-sitio.com/imagenes/manta_andina.jpg', 1),    -- Imagen de portada de la Manta Andina
(3, 'https://mi-sitio.com/imagenes/ceramica_pucara.jpg', 1), -- Imagen de portada de la Ceramica de Pucara
(4, 'https://mi-sitio.com/imagenes/vasija_inca.jpg', 1),     -- Imagen de portada de la Vasija Inca
(5, 'https://mi-sitio.com/imagenes/anillo_plata.jpg', 1),    -- Imagen de portada del Anillo de Plata
(6, 'https://mi-sitio.com/imagenes/pulsera_cuentas.jpg', 1), -- Imagen de portada de la Pulsera de Cuentas
(7, 'https://mi-sitio.com/imagenes/estatuilla_pachamama.jpg', 1), -- Imagen de portada de la Estatuilla de Pachamama
(8, 'https://mi-sitio.com/imagenes/escultura_condor.jpg', 1), -- Imagen de portada de la Escultura de Condor
(9, 'https://mi-sitio.com/imagenes/quena.jpg', 1),           -- Imagen de portada de la Quena
(10, 'https://mi-sitio.com/imagenes/charango.jpg', 1),        -- Imagen de portada del Charango
(11, 'https://mi-sitio.com/imagenes/ocarina_ceramica.jpg', 1), -- Imagen de portada de la Ocarina de Ceramica
(12, 'https://mi-sitio.com/imagenes/bolso_andino.jpg', 1),    -- Imagen de portada del Bolso Andino
(13, 'https://mi-sitio.com/imagenes/collar_plata_turquesa.jpg', 1), -- Imagen de portada del Collar de Plata y Turquesa
(14, 'https://mi-sitio.com/imagenes/mascara_ceremonial.jpg', 1), -- Imagen de portada de la Mascara Ceremonial
(15, 'https://mi-sitio.com/imagenes/tapiz_decorativo.jpg', 1), -- Imagen de portada del Tapiz Decorativo
(16, 'https://mi-sitio.com/imagenes/pendiente_plata.jpg', 1), -- Imagen de portada del Pendiente de Plata
(17, 'https://mi-sitio.com/imagenes/escultura_sol.jpg', 1),   -- Imagen de portada de la Escultura del Sol
(18, 'https://mi-sitio.com/imagenes/cucharon_ceramica.jpg', 1), -- Imagen de portada del Cucharon de Ceramica
(19, 'https://mi-sitio.com/imagenes/bufanda_alpaca.jpg', 1),   -- Imagen de portada de la Bufanda de Alpaca
(20, 'https://mi-sitio.com/imagenes/jarra_inca.jpg', 1);       -- Imagen de portada de la Jarra Inca


select * from Usuario
select * from Categoria
select * from Producto
select * from PedidoDetalle
select * from Pedido
select * from Pago
select * from Envio
select * from ProductoImagen