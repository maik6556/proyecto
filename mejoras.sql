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