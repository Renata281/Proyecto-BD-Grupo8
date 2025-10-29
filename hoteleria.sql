CREATE DATABASE hoteleria;
USE hoteleria;

/*
TABLA:representa el tipo de habitacion
*/
CREATE TABLE tipo_habitacion
(
  id_tipo INT NOT NULL,
  descripcion VARCHAR(300) NOT NULL,
  CONSTRAINT PK_tipo_habitacion PRIMARY KEY (id_tipo)
);

/*
TABLA: representa el estado en el que se encuentra la habitacion
*/
CREATE TABLE estado_habitacion
(
id_estado INT IDENTITY(1,1),
descripcion VARCHAR(150) NOT NULL,
CONSTRAINT PK_estado_habitacion PRIMARY KEY(id_estado)
);

/*
TABLA: representa el piso del hotel
*/
CREATE TABLE piso
(
  id_piso INT NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  CONSTRAINT PK_piso PRIMARY KEY (id_piso)
);

/*
TABLA:representa el cargo del empleado
*/
CREATE TABLE cargo
(
  id_cargo INT IDENTITY(1,1),
  descripcion VARCHAR(100) NOT NULL,
  CONSTRAINT PK_cargo PRIMARY KEY (id_cargo)
);

/*
TABLA: representa las formas de pagos que pueden realizarse
*/
CREATE TABLE forma_pago
(
  id_pago INT IDENTITY(1,1),
  descripcion VARCHAR(100) NOT NULL,
  CONSTRAINT PK_forma_pago PRIMARY KEY (id_pago)
);

/*
TABLA: representa los clientes que se encuentran registrados
*/
CREATE TABLE cliente
(
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefono BIGINT NOT NULL,
  dni BIGINT NOT NULL,
  id_cliente INT IDENTITY (1,1),
  CONSTRAINT PK_cliente PRIMARY KEY (id_cliente),
  CONSTRAINT UQ_cliente_email UNIQUE (email),
  CONSTRAINT UQ_cliente_dni UNIQUE (dni)
);

/*
TABLA: representa los usuarios que corresponden a cada empleado
*/
CREATE TABLE usuario
(
  id_usuario INT IDENTITY(1,1),
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  dni BIGINT NOT NULL,
  telefono BIGINT NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARBINARY(64) NOT NULL,
  id_cargo INT NOT NULL,
  CONSTRAINT PK_usuario PRIMARY KEY (id_usuario),
  CONSTRAINT FK_usuario_cargo FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo),
  CONSTRAINT UQ_usuario_email UNIQUE (email),
  CONSTRAINT UQ_usuario_dni UNIQUE (dni)
);

/*
TABLA: representan las habitaciones que se encuentran en el hotel
*/
CREATE TABLE habitacion
(
  nro_habitacion INT NOT NULL,
  cant_cama INT NOT NULL,
  precio_unitario DECIMAL(18,2) NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  id_tipo INT NOT NULL,
  id_piso INT NOT NULL,
  id_estado INT NOT NULL,
  CONSTRAINT PK_habitacion PRIMARY KEY (nro_habitacion, id_piso),
  CONSTRAINT FK_habitacion_tipo_habitacion FOREIGN KEY (id_tipo) REFERENCES tipo_habitacion(id_tipo),
  CONSTRAINT FK_habitacion_piso FOREIGN KEY (id_piso) REFERENCES piso(id_piso),
  CONSTRAINT FK_habitacion_estado_habitacion FOREIGN KEY (id_estado) REFERENCES estado_habitacion(id_estado)
);

/*
TABLA: representan las reservas que se realizaron en el hotel
*/
CREATE TABLE reserva
(
  nro_reserva INT IDENTITY(1,1),
  fecha_ingreso DATE NOT NULL,
  fecha_salida DATE NOT NULL,
  monto_total DECIMAL(18,2) NOT NULL,
  id_cliente INT NOT NULL,
  nro_habitacion INT NOT NULL,
  id_piso INT NOT NULL,
  id_pago INT NOT NULL,
  CONSTRAINT PK_reserva PRIMARY KEY (nro_reserva),
  CONSTRAINT FK_reserva_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  CONSTRAINT FK_reserva_habitacion FOREIGN KEY (nro_habitacion, id_piso) REFERENCES habitacion(nro_habitacion, id_piso),
  CONSTRAINT FK_reserva_forma_pago FOREIGN KEY (id_pago) REFERENCES forma_pago(id_pago)
);
