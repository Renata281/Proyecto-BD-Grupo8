USE hoteleria;

--LOTE DE DATOS

/*
DATOS PARA tipo de habitación
*/
INSERT INTO tipo_habitacion(id_tipo, descripcion) VALUES(1, 'Económico');
INSERT INTO tipo_habitacion(id_tipo, descripcion) VALUES(2, 'Doble');
INSERT INTO tipo_habitacion(id_tipo, descripcion) VALUES(3, 'Suite');

/*
DATOS PARA estado de habitación
*/
INSERT INTO estado_habitacion(descripcion) VALUES('Disponible');
INSERT INTO estado_habitacion(descripcion) VALUES('Ocupado');
INSERT INTO estado_habitacion(descripcion) VALUES('Mantenimiento');

/*
DATOS PARA piso
*/
INSERT INTO piso(id_piso, descripcion) VALUES(1, 'Primer piso');
INSERT INTO piso(id_piso, descripcion) VALUES(2, 'Segundo piso');
INSERT INTO piso(id_piso, descripcion) VALUES(3, 'Tercer piso');

/*
DATOS PARA cargo
*/
INSERT INTO cargo(descripcion) VALUES('Recepcionista');
INSERT INTO cargo(descripcion) VALUES('Gerente');
INSERT INTO cargo(descripcion) VALUES('Administrador');

/*
DATOS PARA forma de pago
*/
INSERT INTO forma_pago(descripcion) VALUES('Efectivo');
INSERT INTO forma_pago(descripcion)VALUES('Trasferencia');
INSERT INTO forma_pago(descripcion) VALUES('Tarjeta de débito');
INSERT INTO forma_pago(descripcion) VALUES('Tarjeta de crédito');

/*
DATOS PARA cliente
*/
INSERT INTO cliente(nombre, apellido, email, telefono, dni)VALUES('Laura','Gomez','lg@gmail.com',3795028812, 42134933);
INSERT INTO cliente(nombre, apellido, email, telefono, dni)VALUES('Agustin','Alarcon','aa@gmail.com',3795022811, 44592341);
INSERT INTO cliente(nombre, apellido, email, telefono, dni)VALUES('Rebeca','Lopez','rl@gmail.com',3794113812, 38193339);
INSERT INTO cliente(nombre, apellido, email, telefono, dni)VALUES('Gabriel','Torres','gt@gmail.com',3794991434, 48345994);
INSERT INTO cliente(nombre, apellido, email, telefono, dni)VALUES('Camila','Aranda','ca@gmail.com',3795119367, 42134111);
INSERT INTO cliente(nombre, apellido, email, telefono, dni)VALUES('Walter','Maidana','wm@gmail.com',3795889137, 42889137);

/*
DATOS PARA usuario
*/

INSERT INTO usuario(nombre, apellido,dni, telefono, email, password, id_cargo)VALUES
('Lucía', 'Gómez', 40256789, 1123456789, 'lucia.gomez@gmail.com', HASHBYTES('SHA2_256', 'lucia123'), 1);
INSERT INTO usuario(nombre, apellido,dni, telefono, email, password, id_cargo)VALUES
('Martín', 'Pérez', 38765432, 1129876543, 'martin.perez@gmail.com', HASHBYTES('SHA2_256', 'martin123'), 1);
INSERT INTO usuario(nombre, apellido,dni, telefono, email, password, id_cargo)VALUES
('Carla', 'Rodríguez', 36412875, 1135678990, 'carla.rodriguez@gmail.com', HASHBYTES('SHA2_256', 'carla123'), 2);
INSERT INTO usuario(nombre, apellido,dni, telefono, email, password, id_cargo)VALUES
('Santiago', 'Morales', 35123456, 1141234567, 'santiago.morales@gmail.com', HASHBYTES('SHA2_256', 'santi123'), 2);
INSERT INTO usuario(nombre, apellido,dni, telefono, email, password, id_cargo)VALUES
('Valentina', 'López', 39234567, 1156789012, 'valentina.lopez@gmail.com', HASHBYTES('SHA2_256', 'vale123'), 3);
INSERT INTO usuario(nombre, apellido,dni, telefono, email, password, id_cargo)VALUES
('Julián', 'Fernández', 40567890, 1167890123, 'julian.fernandez@gmail.com', HASHBYTES('SHA2_256', 'julian123'), 3);

/*
DATOS PARA habitación
*/

INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(101, 1, 18000.00, 'Habitación económica con cama individual y vista interna', 1, 1, 1);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(102, 1, 18500.00, 'Habitación económica con cama individual y baño privado', 1, 1, 1);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(103, 2, 20000.00, 'Habitación económica doble con ventilador', 1, 1, 2);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(104, 1, 19000.00, 'Habitación económica en mantenimiento, requiere limpieza', 1, 1, 3);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(201, 2, 28000.00, 'Habitación doble con dos camas y balcón al frente', 2, 2, 1);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(202, 1, 27000.00, 'Habitación doble con cama matrimonial y aire acondicionado', 2, 2, 1);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(203, 2, 27500.00, 'Habitación doble con vista lateral y frigobar', 2, 2, 2);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(204, 1, 26000.00, 'Habitación doble en mantenimiento por pintura', 2, 2, 3);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(301, 1, 45000.00, 'Suite de lujo con jacuzzi y vista panorámica', 3, 3, 1);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(302, 1, 42000.00, 'Suite ejecutiva con escritorio y minibar', 3, 3, 1);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(303, 2, 46000.00, 'Suite familiar con dos camas queen y cocina equipada', 3, 3, 2);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(304, 1, 41000.00, 'Suite en mantenimiento, revisión de sistema eléctrico', 3, 3, 3);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(305, 1, 44000.00, 'Suite premium con balcón privado y servicio de habitación', 3, 3, 1);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(205, 2, 29000.00, 'Habitación doble con vista al jardín y frigobar', 2, 2, 1);
INSERT INTO habitacion (nro_habitacion, cant_cama, precio_unitario, descripcion, id_tipo, id_piso, id_estado) VALUES
(105, 1, 19500.00, 'Habitación económica interna, baño compartido', 1, 1, 1);

/*
DATOS PARA reserva
*/
INSERT INTO reserva (fecha_ingreso, fecha_salida, monto_total, id_cliente, nro_habitacion, id_piso, id_pago) VALUES
('2025-10-10', '2025-10-12', 36000.00, 1, 101, 1, 1), -- Laura Gomez - Económica
('2025-10-05', '2025-10-08', 82500.00, 2, 301, 3, 4), -- Agustin Alarcon - Suite crédito
('2025-10-15', '2025-10-17', 54000.00, 3, 201, 2, 2), -- Rebeca Lopez - Doble transferencia
('2025-09-28', '2025-10-02', 80000.00, 4, 302, 3, 3), -- Gabriel Torres - Suite débito
('2025-10-20', '2025-10-23', 58500.00, 5, 202, 2, 1), -- Camila Aranda - Doble efectivo
('2025-10-25', '2025-10-28', 135000.00, 6, 305, 3, 4), -- Walter Maidana - Suite premium
('2025-11-01', '2025-11-04', 55500.00, 1, 203, 2, 2), -- Laura Gomez - Doble lateral
('2025-11-10', '2025-11-13', 54000.00, 2, 103, 1, 3), -- Agustin Alarcon - Económica doble
('2025-11-15', '2025-11-18', 87000.00, 3, 205, 2, 4), -- Rebeca Lopez - Doble con vista
('2025-12-01', '2025-12-05', 180000.00, 5, 303, 3, 1); -- Camila Aranda - Suite familiar