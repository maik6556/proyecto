-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2023 a las 03:13:42
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `distribuidora`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camion`
--

CREATE TABLE `camion` (
  `id_camion` int(11) NOT NULL,
  `capacidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--nuevo
CREATE TABLE camion (
  placa VARCHAR(10) PRIMARY KEY,
  tipo VARCHAR(255),
  recorrido VARCHAR(255),
  capacidad_peso DECIMAL(10,2)
);
--
-- Volcado de datos para la tabla `camion`
--

INSERT INTO `camion` (`id_camion`, `capacidad`) VALUES
(3, 10000),
(4, 8000),
(5, 12000),
(6, 15000),
(7, 9000);

-- --------------------------------------------------------
--nuevo
INSERT INTO camion (placa, tipo, recorrido, capacidad_peso) VALUES
('ABC123', 'Tipo 1', 'Recorrido 1', 1000.00),
('DEF456', 'Tipo 2', 'Recorrido 2', 2000.00),
('GHI789', 'Tipo 3', 'Recorrido 3', 3000.00),
('JKL012', 'Tipo 4', 'Recorrido 4', 4000.00),
('MNO345', 'Tipo 5', 'Recorrido 5', 5000.00),
('PQR678', 'Tipo 6', 'Recorrido 6', 6000.00),
('STU901', 'Tipo 7', 'Recorrido 7', 7000.00),
('VWX234', 'Tipo 8', 'Recorrido 8', 8000.00),
('YZA567', 'Tipo 9', 'Recorrido 9', 9000.00),
('BCD890', 'Tipo 10', 'Recorrido 10', 10000.00),
('EFG123', 'Tipo 11', 'Recorrido 11', 11000.00),
('HIJ456', 'Tipo 12', 'Recorrido 12', 12000.00),
('KLM789', 'Tipo 13', 'Recorrido 13', 13000.00),
('NOP012', 'Tipo 14', 'Recorrido 14', 14000.00),
('QRS345', 'Tipo 15', 'Recorrido 15', 15000.00);
--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `telefono`, `email`, `direccion`, `ciudad`) VALUES
(1, 'Juan Perez', '555-1234', 'jperez@gmail.com', 'Calle 123, No. 456', 'Ciudad de Mexico'),
(2, 'Maria Rodriguez', '555-5678', 'mrodriguez@gmail.com', 'Avenida 789, No. 1011', 'Guadalajara'),
(3, 'Carlos Gomez', '555-9012', 'cgomez@gmail.com', 'Boulevard 1213, No. 1415', 'Monterrey'),
(4, 'Ana Martinez', '555-3456', 'amartinez@gmail.com', 'Calle 1617, No. 1819', 'Puebla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_pedido`
--

CREATE TABLE `cliente_pedido` (
  `id_cliente_pedido` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--nuevo

--
-- Volcado de datos para la tabla `cliente_pedido`
--

INSERT INTO `cliente_pedido` (`id_cliente_pedido`, `id_cliente`, `id_pedido`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 1, 5),
(6, 2, 6),
(7, 3, 7),
(8, 4, 8),
(9, 1, 9),
(10, 2, 10),
(11, 3, 11),
(12, 4, 12),
(13, 1, 13),
(14, 2, 14),
(15, 3, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductor`
--

CREATE TABLE `conductor` (
  `id_conductor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `licencia` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `conductor`
--

INSERT INTO `conductor` (`id_conductor`, `nombre`, `telefono`, `email`, `licencia`) VALUES
(1, 'Juan Pérez', '555-1234', 'juan.perez@example.com', 'B-34567'),
(2, 'María González', '555-2345', 'maria.gonzalez@example.com', 'C-67890'),
(3, 'Pedro Rodríguez', '555-3456', 'pedro.rodriguez@example.com', 'A-12345'),
(4, 'Luisa Martínez', '555-4567', 'luisa.martinez@example.com', 'B-56789'),
(5, 'Jorge Sánchez', '555-5678', 'jorge.sanchez@example.com', 'C-89012'),
(6, 'Ana Jiménez', '555-6789', 'ana.jimenez@example.com', 'A-23456'),
(7, 'Roberto Gómez', '555-7890', 'roberto.gomez@example.com', 'B-67890'),
(8, 'Carla Ramírez', '555-8901', 'carla.ramirez@example.com', 'C-12345'),
(9, 'Mario Herrera', '555-9012', 'mario.herrera@example.com', 'A-56789'),
(10, 'roberto argona', '555-0123', 'Roberto.argona@example.com', 'B-89012'),
(11, 'Juan Perez', '555-1234', 'jperez@email.com', 'D12345'),
(12, 'Ana Rodriguez', '555-5678', 'arodriguez@email.com', 'D67890'),
(13, 'Pedro Gomez', '555-1111', 'pgomez@email.com', 'D24680'),
(14, 'Laura Diaz', '555-2222', 'ldiaz@email.com', 'D13579'),
(15, 'Ricardo Torres', '555-3333', 'rtorres@email.com', 'D86420');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--nuevo
CREATE TABLE empleado (
  id_empleado INT PRIMARY KEY AUTO_INCREMENT,
  conductor BOOLEAN,
  vendedor BOOLEAN
);
--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `telefono`, `email`, `fecha_inicio`, `sueldo`) VALUES
(1, 'Juan Pérez', '555-1234', 'juan.perez@email.com', '2020-01-01', 1500.00),
(2, 'María García', '555-5678', 'maria.garcia@email.com', '2020-01-02', 1600.00),
(3, 'Pedro González', '555-9012', 'pedro.gonzalez@email.com', '2020-01-03', 1700.00),
(4, 'Laura Torres', '555-3456', 'laura.torres@email.com', '2020-01-04', 1800.00),
(5, 'Ana López', '555-7890', 'ana.lopez@email.com', '2020-01-05', 1900.00),
(6, 'Carlos Sánchez', '555-2345', 'carlos.sanchez@email.com', '2020-01-06', 2000.00),
(7, 'Sofía Rodríguez', '555-6789', 'sofia.rodriguez@email.com', '2020-01-07', 2100.00),
(8, 'Diego Ramírez', '555-0123', 'diego.ramirez@email.com', '2020-01-08', 2200.00),
(9, 'Marta Flores', '555-4567', 'marta.flores@email.com', '2020-01-09', 2300.00),
(10, 'Jorge Martínez', '555-8901', 'jorge.martinez@email.com', '2020-01-10', 2400.00),
(11, 'Juan Perez', '555-1234', 'juan.perez@email.com', '2022-01-01', 2500.00),
(12, 'Ana Garcia', '555-5678', 'ana.garcia@email.com', '2022-01-01', 2800.00),
(13, 'Pedro Sanchez', '555-9012', 'pedro.sanchez@email.com', '2022-01-01', 2700.00),
(14, 'Maria Torres', '555-3456', 'maria.torres@email.com', '2022-01-01', 2600.00),
(15, 'Luisa Gomez', '555-7890', 'luisa.gomez@email.com', '2022-01-01', 2900.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--nuevo
CREATE TABLE pedido (
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  descripcion_producto VARCHAR(255),
  fecha_venta DATE,
  direccion VARCHAR(255),
  precio DECIMAL(10,2)
);
--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `fecha_pedido`, `id_sucursal`, `id_producto`, `cantidad`) VALUES
(1, '2023-05-01', 1, 1, 10),
(2, '2023-05-02', 1, 2, 20),
(3, '2023-05-03', 1, 3, 15),
(4, '2023-05-04', 1, 4, 5),
(5, '2023-05-05', 1, 5, 8),
(6, '2023-05-06', 1, 6, 12),
(7, '2023-05-07', 1, 7, 7),
(8, '2023-05-08', 1, 8, 9),
(9, '2023-05-09', 1, 9, 11),
(10, '2023-05-10', 1, 10, 16),
(11, '2023-05-01', 1, 3, 20),
(12, '2023-05-02', 1, 4, 15),
(13, '2023-05-02', 1, 2, 10),
(14, '2023-05-03', 1, 1, 5),
(15, '2023-05-03', 1, 5, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio`
--

CREATE TABLE `precio` (
  `id_producto` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha_precio` date NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `precio`
--

INSERT INTO `precio` (`id_producto`, `id_proveedor`, `fecha_precio`, `precio`) VALUES
(1, 1, '2022-01-01', 10.99),
(1, 2, '2022-01-01', 9.99),
(2, 3, '2022-01-01', 15.99),
(2, 4, '2022-01-01', 14.99),
(3, 2, '2022-01-01', 12.99),
(3, 5, '2022-01-01', 7.99),
(3, 6, '2022-01-01', 6.99),
(4, 7, '2022-01-01', 21.99),
(4, 8, '2022-01-01', 19.99),
(5, 1, '2022-01-01', 10.99),
(5, 9, '2022-01-01', 12.99),
(5, 10, '2022-01-01', 11.99),
(8, 1, '2022-01-01', 8.99),
(9, 2, '2022-01-01', 5.99),
(10, 3, '2022-01-01', 7.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--nuevo
CREATE TABLE producto (
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  precio_compra DECIMAL(10,2),
  categoria VARCHAR(255),
  proveedor_id INT,
  FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor)
);

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Manzana', 'Fruta fresca de temporada', 0.50),
(2, 'Lechuga', 'Lechuga verde y fresca', 1.00),
(3, 'Carne de res', 'Carne de res de primera calidad', 5.00),
(4, 'Pan blanco', 'Pan fresco y suave', 2.00),
(5, 'Pescado', 'Pescado fresco del mar', 4.50),
(6, 'Arroz integral', 'Arroz integral de grano largo', 3.50),
(7, 'Café', 'Café tostado y molido', 5.00),
(8, 'Queso cheddar', 'Queso cheddar en bloque', 2.50),
(9, 'Chocolate negro', 'Chocolate negro de alta calidad', 3.00),
(10, 'Galletas', 'Galletas de mantequilla y chocolate', 1.50),
(11, 'Mouse inalámbrico', 'Mouse con conectividad inalámbrica Bluetooth', 24.99),
(12, 'Teclado mecánico', 'Teclado mecánico para gamers', 99.99),
(13, 'Audífonos Bluetooth', 'Audífonos inalámbricos con conectividad Bluetooth', 59.99),
(14, 'Cargador portátil', 'Cargador portátil de 20000mAh', 49.99),
(15, 'Lápiz USB', 'Lápiz USB de 32GB', 19.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado /*Utilizar claves autoincrementales: Para las tablas que tienen claves primarias que no requieren un valor específico, como "proveedor", "producto", "pedido" y "empleado", se puede utilizar el atributo AUTO_INCREMENT en las definiciones de las claves primarias. Esto permitirá que se generen automáticamente valores únicos para las claves primarias sin necesidad de especificarlos manualmente.*/

CREATE TABLE proveedor (
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  horario VARCHAR(50)
); de datos para la tabla `proveedor`
--
--nuevo
CREATE TABLE proveedor (
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  horario VARCHAR(50)
);
INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `telefono`, `email`) VALUES
(1, 'Proveedor 1', '111-111-1111', 'proveedor1@example.com'),
(2, 'Proveedor 2', '222-222-2222', 'proveedor2@example.com'),
(3, 'Proveedor 3', '333-333-3333', 'proveedor3@example.com'),
(4, 'Proveedor 4', '444-444-4444', 'proveedor4@example.com'),
(5, 'Proveedor 5', '555-555-5555', 'proveedor5@example.com'),
(6, 'Proveedor 6', '666-666-6666', 'proveedor6@example.com'),
(7, 'Proveedor 7', '777-777-7777', 'proveedor7@example.com'),
(8, 'Proveedor 8', '888-888-8888', 'proveedor8@example.com'),
(9, 'Proveedor 9', '999-999-9999', 'proveedor9@example.com'),
(10, 'Proveedor 10', '000-000-0000', 'proveedor10@example.com'),
(11, 'Proveedor 11', '555-5556', 'proveedor11@example.com'),
(12, 'Proveedor 12', '555-5557', 'proveedor13example.com'),
(13, 'Proveedor 13', '555-5558', 'proveedor13@example.com'),
(14, 'Proveedor 14', '555-5559', 'proveedor14@example.com'),
(15, 'Proveedor 15', '555-5560', 'proveedor15@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `id_ruta` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_camion` int(11) DEFAULT NULL,
  `id_conductor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`id_ruta`, `id_pedido`, `id_camion`, `id_conductor`) VALUES
(1, 1, 3, 1),
(2, 2, 3, 2),
(3, 3, 4, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 3, 8),
(9, 9, 6, 9),
(10, 7, 7, 10),
(11, 11, 6, 8),
(12, 12, 6, 9),
(13, 14, 4, 10),
(14, 13, 3, 11),
(15, 15, 7, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `nombre`, `direccion`, `telefono`, `correo_electronico`, `fecha_creacion`) VALUES
(1, 'Sucursal Norte', 'Av. Principal 123, Ciudad', '+1 234 567 890', 'sucursalnorte@distribuidora.com', '2023-05-01 23:23:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `id_vendedor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`id_vendedor`, `nombre`, `telefono`, `email`, `id_sucursal`) VALUES
(1, 'Juan Pérez', '555-1234', 'juan.perez@ejemplo.com', 1),
(2, 'María González', '555-5678', 'maria.gonzalez@ejemplo.com', 1),
(3, 'Pedro Hernández', '555-9012', 'pedro.hernandez@ejemplo.com', 1),
(4, 'Ana Ramírez', '555-3456', 'ana.ramirez@ejemplo.com', 1),
(5, 'Luisa Sánchez', '555-7890', 'luisa.sanchez@ejemplo.com', 1),
(10, 'Juan Pérez', '555-1234', 'juanperez@distribuidora.com', 1),
(11, 'Carlos Martínez', '555-2345', 'carlosmartinez@distribuidora.com', 1),
(12, 'Ana Ramírez', '555-3456', 'anaramirez@distribuidora.com', 1),
(13, 'María Hernández', '555-4567', 'mariahernandez@distribuidora.com', 1),
(14, 'Pedro Sánchez', '555-5678', 'pedrosanchez@distribuidora.com', 1),
(15, 'Luisa González', '555-6789', 'luisagonzalez@distribuidora.com', 1),
(16, 'Daniel Torres', '555-7890', 'danieltorres@distribuidora.com', 1),
(17, 'Mónica Gómez', '555-8901', 'monicagomez@distribuidora.com', 1),
(18, 'Jorge López', '555-9012', 'jorgelopez@distribuidora.com', 1),
(19, 'Laura Torres', '555-0123', 'lauratorres@distribuidora.com', 1);

--
-- Índices para tablas volcadas
--
--tablas rellenadas
-- Tabla proveedor
INSERT INTO proveedor (nombre, horario) VALUES
('Proveedor 1', 'Horario 1'),
('Proveedor 2', 'Horario 2'),
('Proveedor 3', 'Horario 3'),
('Proveedor 4', 'Horario 4'),
('Proveedor 5', 'Horario 5'),
('Proveedor 6', 'Horario 6'),
('Proveedor 7', 'Horario 7'),
('Proveedor 8', 'Horario 8'),
('Proveedor 9', 'Horario 9'),
('Proveedor 10', 'Horario 10'),
('Proveedor 11', 'Horario 11'),
('Proveedor 12', 'Horario 12'),
('Proveedor 13', 'Horario 13'),
('Proveedor 14', 'Horario 14'),
('Proveedor 15', 'Horario 15');

-- Tabla producto
INSERT INTO producto (precio_compra, categoria, proveedor_id) VALUES
(10.00, 'Categoría 1', 1),
(15.00, 'Categoría 2', 2),
(20.00, 'Categoría 3', 3),
(25.00, 'Categoría 4', 4),
(30.00, 'Categoría 5', 5),
(35.00, 'Categoría 6', 6),
(40.00, 'Categoría 7', 7),
(45.00, 'Categoría 8', 8),
(50.00, 'Categoría 9', 9),
(55.00, 'Categoría 10', 10),
(60.00, 'Categoría 11', 11),
(65.00, 'Categoría 12', 12),
(70.00, 'Categoría 13', 13),
(75.00, 'Categoría 14', 14),
(80.00, 'Categoría 15', 15);

-- Tabla pedido
INSERT INTO pedido (descripcion_producto, fecha_venta, direccion, precio) VALUES
('Producto 1', '2023-05-25', 'Dirección 1', 10.00),
('Producto 2', '2023-05-24', 'Dirección 2', 20.00),
('Producto 3', '2023-05-23', 'Dirección 3', 30.00),
('Producto 4', '2023-05-22', 'Dirección 4', 40.00),
('Producto 5', '2023-05-21', 'Dirección 5', 50.00),
('Producto 6', '2023-05-20', 'Dirección 6', 60.00),
('Producto 7', '2023-05-19', 'Dirección 7', 70.00),
('Producto 8', '2023-05-18', 'Dirección 8', 80.00),
('Producto 9', '2023-05-17', 'Dirección 9', 90.00),
('Producto 10', '2023-05-16', 'Dirección 10', 100.00),
('Producto 11', '2023-05-15', 'Dirección 11', 110.00),
('Producto 12', '2023-05-14', 'Dirección 12', 120.00),
('Producto 13', '2023-05-13', 'Dirección 13', 130.00),
('Producto 14', '2023-05-12', 'Dirección 14', 140.00),
('Producto 15', '2023-05-11', 'Dirección 15', 150.00);

-- Tabla empleado
INSERT INTO empleado (conductor, vendedor) VALUES
(TRUE, FALSE),
(FALSE, TRUE),
(TRUE, TRUE),
(TRUE, FALSE),
(FALSE, TRUE),
(TRUE, TRUE),
(TRUE, FALSE),
(FALSE, TRUE),
(TRUE, TRUE),
(TRUE, FALSE),
(FALSE, TRUE),
(TRUE, TRUE),
(TRUE, FALSE),
(FALSE, TRUE),
(TRUE, TRUE);

-- Tabla camion
INSERT INTO camion (placa, tipo, recorrido, capacidad_peso) VALUES
('ABC123', 'Tipo 1', 'Recorrido 1', 1000.00),
('DEF456', 'Tipo 2', 'Recorrido 2', 2000.00),
('GHI789', 'Tipo 3', 'Recorrido 3', 3000.00),
('JKL012', 'Tipo 4', 'Recorrido 4', 4000.00),
('MNO345', 'Tipo 5', 'Recorrido 5', 5000.00),
('PQR678', 'Tipo 6', 'Recorrido 6', 6000.00),
('STU901', 'Tipo 7', 'Recorrido 7', 7000.00),
('VWX234', 'Tipo 8', 'Recorrido 8', 8000.00),
('YZA567', 'Tipo 9', 'Recorrido 9', 9000.00),
('BCD890', 'Tipo 10', 'Recorrido 10', 10000.00),
('EFG123', 'Tipo 11', 'Recorrido 11', 11000.00),
('HIJ456', 'Tipo 12', 'Recorrido 12', 12000.00),
('KLM789', 'Tipo 13', 'Recorrido 13', 13000.00),
('NOP012', 'Tipo 14', 'Recorrido 14', 14000.00),
('QRS345', 'Tipo 15', 'Recorrido 15', 15000.00);

-- Tabla proveedor_producto
INSERT INTO proveedor_producto (proveedor_id, producto_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

-- Tabla registrando
INSERT INTO registrando (producto_id, venta_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

-- Tabla asigna
INSERT INTO asigna (empleado_id, pedido_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

-- Tabla camion_pedido
INSERT INTO camion_pedido (placa, pedido_id) VALUES
('ABC123', 1),
('DEF456', 2),
('GHI789', 3),
('JKL012', 4),
('MNO345', 5),
('PQR678', 6),
('STU901', 7),
('VWX234', 8),
('YZA567', 9),
('BCD890', 10),
('EFG123', 11),
('HIJ456', 12),
('KLM789', 13),
('NOP012', 14),
('QRS345', 15);

--
-- Indices de la tabla `camion`
--
ALTER TABLE `camion`
  ADD PRIMARY KEY (`id_camion`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cliente_pedido`
--
ALTER TABLE `cliente_pedido`
  ADD PRIMARY KEY (`id_cliente_pedido`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD PRIMARY KEY (`id_conductor`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `precio`
--
ALTER TABLE `precio`
  ADD PRIMARY KEY (`id_producto`,`id_proveedor`,`fecha_precio`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`id_ruta`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_camion` (`id_camion`),
  ADD KEY `id_conductor` (`id_conductor`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_vendedor`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente_pedido`
--
ALTER TABLE `cliente_pedido`
  ADD CONSTRAINT `cliente_pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `cliente_pedido_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `precio`
--
ALTER TABLE `precio`
  ADD CONSTRAINT `precio_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `precio_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `ruta_ibfk_2` FOREIGN KEY (`id_camion`) REFERENCES `camion` (`id_camion`),
  ADD CONSTRAINT `ruta_ibfk_3` FOREIGN KEY (`id_conductor`) REFERENCES `conductor` (`id_conductor`);

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);
COMMIT;

BUSQUEDA SIMPLES

//  recupera todos los productos cuyo precio es mayor o igual a 2.5 y luego los agrupa por el valor de "precio".
SELECT * FROM producto WHERE precio >= 2.5 GROUP BY precio;

//Buscar todas las rutas realizadas por un conductor con la id "5"
SELECT * FROM ruta WHERE id_conductor = 5;

//Buscar todos los empleados que iniciaron en una fecha específica
SELECT * FROM empleado WHERE fecha_inicio = '2020-01-04';

//Buscar todos los pedidos que incluyen un producto específico:
SELECT * FROM pedido WHERE id_producto = '5';

//Obtener el nombre del empleado y su sueldo que tiene un sueldo mayor al promedio de sueldos de todos los empleados:
SELECT nombre, sueldo FROM empleado WHERE sueldo > (SELECT AVG(sueldo) FROM empleado);

//Obtener el promedio de sueldo de los empleados:
SELECT AVG(sueldo) as promedio_sueldo FROM empleado;

//Obtener el número de pedidos realizados en una fecha específica:
SELECT COUNT(*) as cantidad_pedidos FROM pedido WHERE fecha_pedido = '2023-05-07';

//Obtener el nombre del empleado y su sueldo que tiene un sueldo mayor a $2200:
SELECT nombre, sueldo FROM empleado WHERE sueldo > 2200;

//Obtener la cantidad de productos pedidos en cada pedido:
SELECT id_pedido, SUM(cantidad) as cantidad_total FROM pedido GROUP BY id_pedido;

//Obtener la fecha de inicio del empleado más reciente contratado:
SELECT MAX(fecha_inicio) as fecha_reciente_contratado FROM empleado;

//sirve para ptener informacion relacionada entre entre productos y pedidos 
SELECT pedido.id_pedido,productos_pedidos.id_producto,clientes.nombre,pedido.cantidad
FROM productos_pedidos
LEFT JOIN clientes ON productos_pedidos.id_pedido = clientes.id_cliente
LEFT JOIN pedido ON productos_pedidos.id_pedido = pedido.id_pedido;

//CONSULTA LOS CLIENTES QUE NO TENGAN PEDIDO

SELECT *
FROM clientes
LEFT JOIN cliente_pedido
ON clientes.id_cliente = cliente_pedido.id_cliente
WHERE cliente_pedido.id_cliente IS NULL;

//todos los clientes asi no tengan pedido
SELECT *
FROM clientes
LEFT JOIN cliente_pedido
ON clientes.id_cliente = cliente_pedido.id_cliente_pedido;

//los camiones sin ruta establecida 

SELECT *
FROM camion
LEFT JOIN ruta
ON camion.id_camion = ruta.id_camion
WHERE ruta.id_camion IS NULL;

//todos los camiones sin importar si tienen ruta
SELECT *
FROM camion
LEFT JOIN ruta
ON camion.id_camion = ruta.id_ruta;

//los camiones que tengan minimo una ruta
SELECT * FROM camion
INNER JOIN ruta
ON camion.id_camion = ruta.id_ruta;

//busca los precios mayores a 9 entre las tablas producto y precio
SELECT p.id_producto, p.nombre, p.descripcion, pr.precio
FROM producto p
JOIN precio pr ON p.id_producto = pr.id_producto
WHERE pr.precio>9;

//buscar los precios menores a 7 
SELECT * 
FROM producto 
INNER JOIN precio
ON producto.id_producto = precio.id_producto
WHERE precio.precio < 7

//Obtener el nombre de los conductores y la cantidad de rutas que han realizado:
SELECT e.nombre, COUNT(*) as cantidad_rutas FROM empleado e INNER JOIN ruta r ON e.id_empleado = r.id_conductor GROUP BY e.nombre;

//ver los conductores con un id mayor a 10
SELECT *
FROM conductor c
JOIN conductor ON c.id_conductor = c.id_conductor
WHERE c.id_conductor>10;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
