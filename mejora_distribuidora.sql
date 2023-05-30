/*Utilizar nombres más descriptivos para las tablas y los campos: Los nombres de las tablas y los campos deben ser
 descriptivos y representar claramente la información que almacenan. Esto facilitará la comprensión del esquema de la 
 base de datos. Por ejemplo, en lugar de provee podríamos usar proveedor_producto, y en lugar de tiene podríamos usar 
 camion_pedido*/

 /*Utilizar claves autoincrementales: Para las tablas que tienen claves primarias que no requieren un valor específico, como "proveedor", "producto", "pedido" y "empleado", se puede utilizar el atributo AUTO_INCREMENT en las definiciones de las claves primarias. Esto permitirá que se generen automáticamente valores únicos para las claves primarias sin necesidad de especificarlos manualmente.*/

CREATE TABLE proveedor (
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  horario VARCHAR(50)
);
-- Repetir el cambio para las demás tablas con claves primarias similares

CREATE TABLE producto (
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  precio_compra DECIMAL(10,2),
  categoria VARCHAR(255),
  proveedor_id INT,
  FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE pedido (
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  descripcion_producto VARCHAR(255),
  fecha_venta DATE,
  direccion VARCHAR(255),
  precio DECIMAL(10,2)
);

CREATE TABLE empleado (
  id_empleado INT PRIMARY KEY AUTO_INCREMENT,
  conductor BOOLEAN,
  vendedor BOOLEAN
);

CREATE TABLE camion (
  placa VARCHAR(10) PRIMARY KEY,
  tipo VARCHAR(255),
  recorrido VARCHAR(255),
  capacidad_peso DECIMAL(10,2)
);

/* Considerar el uso de tipos de datos más apropiados: Asegúrate de utilizar los tipos de datos más adecuados para    cada campo. Por ejemplo, en lugar de utilizar VARCHAR(255) para campos como "nombre" y "horario", podrías utilizar tipos de datos más específicos, como VARCHAR(50) si sabes que el campo nunca excederá los 50 caracteres.

Agregar restricciones de integridad referencial ON DELETE y ON UPDATE: Puedes especificar qué hacer cuando se elimina o actualiza una fila en una tabla relacionada utilizando las cláusulas ON DELETE y ON UPDATE en las restricciones de clave externa (FOREIGN KEY). Esto asegurará la integridad referencial y definirá acciones claras cuando se realicen cambios en los datos relacionados.*/

CREATE TABLE proveedor_producto (
  cod_provee INT PRIMARY KEY AUTO_INCREMENT,
  proveedor_id INT,
  producto_id INT,
  FOREIGN KEY (proveedor_id) REFERENCES proveedor(id_proveedor) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (producto_id) REFERENCES producto(id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX (proveedor_id),
  INDEX (producto_id)
);
-- Repetir el cambio para otras tablas que tengan claves externas

CREATE TABLE registrando (
  registro INT PRIMARY KEY AUTO_INCREMENT,
  producto_id INT,
  venta_id INT,
  FOREIGN KEY (producto_id) REFERENCES producto(id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (venta_id) REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE asigna (
  id_asigna INT PRIMARY KEY AUTO_INCREMENT,
  empleado_id INT,
  pedido_id INT,
  FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (pedido_id) REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE camion_pedido (
  id_horario INT PRIMARY KEY AUTO_INCREMENT,
  placa VARCHAR(10),
  pedido_id INT,
  FOREIGN KEY (placa) REFERENCES camion(placa) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (pedido_id) REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);

/*con el siguiente codigo podemos insertar valores en las tablas */

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


-- DISPARADORES--

/*Disparador de inserción: Antes de insertar un nuevo proveedor, se verifica si ya existe un proveedor con el mismo nombre. Si existe, se lanza un error y se cancela la inserción.*/

DELIMITER $$
CREATE TRIGGER proveedor_insert_trigger
BEFORE INSERT ON proveedor
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT 1 FROM proveedor WHERE nombre = NEW.nombre) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un proveedor con el mismo nombre';
  END IF;
END $$

/*Disparador de modificación: Antes de actualizar un proveedor, se verifica si el nuevo nombre del proveedor ya existe en otro proveedor. Si existe, se lanza un error y se cancela la modificación.*/

DELIMITER $$
CREATE TRIGGER proveedor_update_trigger
BEFORE UPDATE ON proveedor
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT 1 FROM proveedor WHERE nombre = NEW.nombre AND id_proveedor <> NEW.id_proveedor) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe otro proveedor con el mismo nombre';
  END IF;
END $$

/*Disparador de eliminación: Antes de eliminar un proveedor, se verifica si existen productos asociados a dicho proveedor. Si existen, se lanza un error y se cancela la eliminación.*/

DELIMITER $$

CREATE TRIGGER proveedor_delete_trigger
BEFORE DELETE ON proveedor
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT 1 FROM producto WHERE proveedor_id = OLD.id_proveedor) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar el proveedor porque tiene productos asociados';
  END IF;
END $$

/*Disparador de inserción: Después de insertar un nuevo producto, se actualiza automáticamente el campo "precio_compra" sumando un impuesto del 10% al precio original.*/

DELIMITER $$
CREATE TRIGGER producto_insert_trigger
AFTER INSERT ON producto
FOR EACH ROW
BEGIN
  UPDATE producto SET precio_compra = NEW.precio_compra * 1.1 WHERE id_producto = NEW.id_producto;
END $$

/*Disparador de modificación: Antes de actualizar el precio de un producto, se verifica si el nuevo precio es inferior al precio de compra. Si es así, se lanza un error y se cancela la modificación.*/

DELIMITER $$
CREATE TRIGGER producto_update_trigger
BEFORE UPDATE ON producto
FOR EACH ROW
BEGIN
  IF NEW.precio_compra < OLD.precio_compra THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nuevo precio no puede ser inferior al precio de compra';
  END IF;
END $$

/*Disparador de eliminación: Después de eliminar un producto, se eliminan también los registros asociados en la tabla "proveedor_producto" y "registrando".*/

DELIMITER $$
CREATE TRIGGER producto_delete_trigger
AFTER DELETE ON producto
FOR EACH ROW
BEGIN
  DELETE FROM proveedor_producto WHERE producto_id = OLD.id_producto;
  DELETE FROM registrando WHERE producto_id = OLD.id_producto;
END $$

/*Disparador de inserción: Después de insertar un nuevo pedido, se establece automáticamente la fecha de venta como la fecha actual del sistema.*/

DELIMITER $$
CREATE TRIGGER pedido_insert_trigger
BEFORE INSERT ON pedido
FOR EACH ROW
BEGIN
  SET NEW.fecha_venta = CURRENT_DATE();
END $$




--VISTAS--



/*Esta vista muestra el nombre del proveedor junto con los productos que suministra, incluyendo el ID del producto, el precio de compra y la categoría.*/

CREATE VIEW vista_proveedores_productos AS
SELECT p.nombre AS nombre_proveedor, pr.id_producto, pr.precio_compra, pr.categoria
FROM proveedor p
JOIN proveedor_producto pp ON p.id_proveedor = pp.proveedor_id
JOIN producto pr ON pp.producto_id = pr.id_producto;

/*Esta vista muestra los pedidos que aún no han sido entregados, incluyendo el ID del pedido, la descripción del producto, la fecha de venta, la dirección y el precio.*/

CREATE VIEW vista_pedidos_pendientes AS
SELECT id_pedido, descripcion_producto, fecha_venta, direccion, precio
FROM pedido
WHERE fecha_venta > CURDATE();

/*Esta vista muestra los ID de los empleados que son conductores.*/

CREATE VIEW vista_empleados_conductores AS
SELECT id_empleado
FROM empleado
WHERE conductor = TRUE;

/*Esta vista muestra los productos junto con su precio de compra, categoría y el nombre del proveedor correspondiente.*/

CREATE VIEW vista_productos_proveedor AS
SELECT pr.id_producto, pr.precio_compra, pr.categoria, p.nombre AS nombre_proveedor
FROM producto pr
JOIN proveedor_producto pp ON pr.id_producto = pp.producto_id
JOIN proveedor p ON pp.proveedor_id = p.id_proveedor;

/*Esta vista muestra los ID de los empleados que son vendedores.*/

CREATE VIEW vista_empleados_vendedores AS
SELECT id_empleado
FROM empleado
WHERE vendedor = TRUE;

/*Esta vista muestra los camiones asignados a pedidos, incluyendo el ID del horario, la placa del camión, el ID del pedido, la descripción del producto y la fecha de venta.*/

CREATE VIEW vista_camiones_asignados AS
SELECT cp.id_horario, cp.placa, cp.pedido_id, pe.descripcion_producto, pe.fecha_venta
FROM camion_pedido cp
JOIN pedido pe ON cp.pedido_id = pe.id_pedido;

/*Esta vista muestra los productos que están en stock, es decir, aquellos que no están registrados en ningún pedido, incluyendo el ID del producto, el precio de compra y la categoría.*/

CREATE VIEW vista_productos_stock AS
SELECT pr.id_producto, pr.precio_compra, pr.categoria
FROM producto pr
LEFT JOIN registrando r ON pr.id_producto = r.producto_id
WHERE r.producto_id IS NULL;

/*Esta vista muestra los pedidos realizados por un empleado específico, incluyendo el ID del empleado, el ID del pedido, la descripción del producto, la fecha de venta, la dirección y el precio.*/

CREATE VIEW vista_pedidos_empleado AS
SELECT a.empleado_id, a.pedido_id, pe.descripcion_producto, pe.fecha_venta, pe.direccion, pe.precio
FROM asigna a
JOIN pedido pe ON a.pedido_id = pe.id_pedido;

/*Esta vista muestra los camiones disponibles que no están asignados a ningún pedido, incluyendo la placa, el tipo, el recorrido y la capacidad de peso.*/

CREATE VIEW vista_camiones_disponibles AS
SELECT c.placa, c.tipo, c.recorrido, c.capacidad_peso
FROM camion c
LEFT JOIN camion_pedido cp ON c.placa = cp.placa
WHERE cp.placa IS NULL;

/*Esta vista muestra los pedidos realizados por un proveedor específico, incluyendo el nombre del proveedor, el ID del pedido, la descripción del producto, la fecha de venta, la dirección y el precio.*/

CREATE VIEW vista_pedidos_proveedor AS
SELECT p.nombre AS nombre_proveedor, pe.id_pedido, pe.descripcion_producto, pe.fecha_venta, pe.direccion, pe.precio
FROM proveedor p
JOIN proveedor_producto pp ON p.id_proveedor = pp.proveedor_id
JOIN producto pr ON pp.producto_id = pr.id_producto
JOIN pedido pe ON pr.id_producto = pe.id_pedido;



                 --FUNCIONES Y PROCEDIMIENTOS--



/*Este procedimiento permite registrar un nuevo proveedor en la tabla "proveedor" con el nombre y horario especificados.*/

DELIMITER //

CREATE PROCEDURE registrar_proveedor(
  IN p_nombre VARCHAR(50),
  IN p_horario VARCHAR(50)
)
BEGIN
  INSERT INTO proveedor (nombre, horario)
  VALUES (p_nombre, p_horario);
END //

DELIMITER ;


/*Esta función calcula y devuelve el precio promedio de los productos en la categoría especificada.*/

DELIMITER //

CREATE FUNCTION obtener_precio_promedio_categoria(
  p_categoria VARCHAR(255)
)
RETURNS DECIMAL(10,2)
BEGIN
  DECLARE avg_price DECIMAL(10,2);
  SELECT AVG(precio_compra) INTO avg_price
  FROM producto
  WHERE categoria = p_categoria;
  RETURN avg_price;
END //

DELIMITER ;


/*Este procedimiento permite realizar un nuevo pedido, especificando la descripción del producto, la fecha de venta, la dirección y el precio.*/

DELIMITER //

CREATE PROCEDURE realizar_pedido(
  IN p_descripcion_producto VARCHAR(255),
  IN p_fecha_venta DATE,
  IN p_direccion VARCHAR(255),
  IN p_precio DECIMAL(10,2)
)
BEGIN
  INSERT INTO pedido (descripcion_producto, fecha_venta, direccion, precio)
  VALUES (p_descripcion_producto, p_fecha_venta, p_direccion, p_precio);
END //

DELIMITER ;


/*Este procedimiento asigna un empleado a un pedido específico.*/

DELIMITER //

CREATE PROCEDURE asignar_empleado_pedido(
  IN p_empleado_id INT,
  IN p_pedido_id INT
)
BEGIN
  INSERT INTO asigna (empleado_id, pedido_id)
  VALUES (p_empleado_id, p_pedido_id);
END //

DELIMITER ;


/*Esta función calcula y devuelve el total de ventas realizadas en una fecha específica.*/

DELIMITER //

CREATE FUNCTION calcular_total_ventas_fecha(
  p_fecha DATE
)
RETURNS DECIMAL(10,2)
BEGIN
  DECLARE total DECIMAL(10,2);
  SELECT SUM(precio) INTO total
  FROM pedido
  WHERE fecha_venta = p_fecha;
  RETURN total;
END //

DELIMITER ;


/*Este procedimiento actualiza el horario de un proveedor específico.*/

DELIMITER //

CREATE PROCEDURE actualizar_horario_proveedor(
  IN p_proveedor_id INT,
  IN p_nuevo_horario VARCHAR(50)
)
BEGIN
  UPDATE proveedor
  SET horario = p_nuevo_horario
  WHERE id_proveedor = p_proveedor_id;
END //

DELIMITER ;


/*Esta función calcula y devuelve la cantidad de productos en una categoría específica.*/

DELIMITER //

CREATE FUNCTION obtener_cantidad_productos_categoria(
  p_categoria VARCHAR(255)
)
RETURNS INT
BEGIN
  DECLARE count_products INT;
  SELECT COUNT(*) INTO count_products
  FROM producto
  WHERE categoria = p_categoria;
  RETURN count_products;
END //

DELIMITER ;


/*Este procedimiento elimina un proveedor y todos los productos asociados a él en cascada.*/

DELIMITER //

CREATE PROCEDURE eliminar_proveedor(
  IN p_proveedor_id INT
)
BEGIN
  DELETE FROM proveedor
  WHERE id_proveedor = p_proveedor_id;
END //

DELIMITER ;


/*Este procedimiento asigna un camión a un pedido específico.*/

DELIMITER //

CREATE PROCEDURE asignar_camion_pedido(
  IN p_placa VARCHAR(10),
  IN p_pedido_id INT
)
BEGIN
  INSERT INTO camion_pedido (placa, pedido_id)
  VALUES (p_placa, p_pedido_id);
END //

DELIMITER ;


/*Esta función devuelve el nombre del proveedor que suministra la mayor cantidad de productos.*/

DELIMITER //

CREATE FUNCTION obtener_proveedor_mas_productos()
RETURNS VARCHAR(50)
BEGIN
  DECLARE max_supplier VARCHAR(50);
  SELECT p.nombre INTO max_supplier
  FROM proveedor p
  JOIN proveedor_producto pp ON p.id_proveedor = pp.proveedor_id
  GROUP BY p.id_proveedor
  ORDER BY COUNT(pp.producto_id) DESC
  LIMIT 1;
  RETURN max_supplier;
END //

DELIMITER ;





