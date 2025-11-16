# Proyecto-BD-Grupo8
## Sistema de gestión hotelera

**Alumnos:** 

- Arias, Yolanda
- Lugo, Renata
- Pérez, Santiago  
- Ramirez, Nadia
 
**Profesores:**

- Villegas, Darío
- Cuzziol, Juan José
- Vallejos, Walter
- Badaracco, Numa 
	
**Institución Educativa:** Universidad Nacional del Nordeste – Facultad de Ciencias Exactas y Naturales y Agrimensura 

**Carrera:** Licenciatura en Sistemas de Información

**Fecha de Entrega:** 29/9/2025

**Año:** 2025 
<div style="page-break-after: always;"></div> 

## Indice

[Capítulo I: Introducción](#capítulo-i-introducción)

    - Tema
    - Planteamiento del Problema
    - Objetivos del Trabajo
    - Objetivos Generales
    - Objetivos Específicos
    
[Capítulo II: Marco Conceptual](#capítulo-ii-marco-conceptual)

[Capítulo III: Metodología Seguida](#capítulo-iii-metodología-seguida)

[Capítulo IV: Desarrollo del Tema / Presentación de Resultados](#capítulo-iv-desarrollo-del-tema--presentación-de-resultados)
    
[Capítulo V: Conclusiones](#capítulo-v-conclusiones)

[Capítulo VI: Bibliografía](#capítulo-vi-bibliografía)

## Capítulo I: INTRODUCCIÓN 

En este capítulo se introduce el Trabajo Práctico que consiste en el desarrollo de una base de datos para el sistema de gestión de un hotel, la cual gestionará la administración tanto de reserva de habitaciones, su estado y el control de sus empleados. A continuación, se describen el tema, el problema a investigar y los objetivos de la tarea.

### Tema 

El tema de este trabajo se enfoca en el diseño e implementación de una base de datos para la gestión de un hotel, una aplicación destinada al control correspondiente de las actividades de un hotel. La base de datos debe ser robusta y estar optimizada para mantener la integridad de los datos y preservar su privacidad. Este sistema debe registrar, almacenar y gestionar datos relacionados con clientes, usuarios, reservas y sus respectivos pagos.

### Planteamiento del Problema 

El principal problema que se abordará es la ausencia de una base de datos centralizada y estructurada que permita la gestión eficiente de información en el sistema. Actualmente, la hotel opera sin un sistema unificado para almacenar y manejar datos críticos, lo que puede resultar en inconsistencias, pérdidas de información, y dificultades en la gestión de las reservas. Este trabajo plantea las siguientes preguntas: ¿Cómo puede una base de datos relacional optimizar la administración de reservas, clientes, habitaciones y usuarios en un sistema de gestion de hotel? y ¿Qué estructuras de datos y relaciones son más adecuadas para asegurar la integridad y seguridad de la información en este contexto?

### Objetivos del Trabajo 

El objetivo principal del Trabajo Práctico es desarrollar una base de datos que permita al sisteme del hotel gestionar sus reservas, clientes, habitaciones y usuarios de manera eficiente y segura, mejorando así los procesos operativos del hotel.

#### Objetivos Generales

Diseñar e implementar una base de datos relacional que soporte la aplicación de escritorio del sistema hotelero, optimizando el almacenamiento y la gestión de la información relacionada con reservas, clientes, usuarios y habitaciones.

#### Objetivos Específicos 
 
- Definir las entidades clave del sistema, como reservas, usuarios, clientes y habitaciones, y sus respectivas relaciones.
- Implementar tablas que permitan realizar operaciones CRUD (Crear, Leer, Actualizar y Eliminar) de manera eficiente, garantizando la consistencia de los datos.
- Crear mecanismos de seguridad, como encriptación de contraseñas y restricciones de acceso, para proteger la información sensible.
- Implementar validaciones y triggers que aseguren la integridad referencial entre las distintas tablas (reservas, clientes, habitaciones, usuarios).

## Capítulo II: MARCO CONCEPTUAL
### Manejo de permisos a nivel de usuarios de base de datos

En el contexto de la gestión de bases de datos, resulta esencial asegurar la protección y el dominio sobre el acceso a la información contenida. Con este fin, se requiere instituir una administración estricta de roles y permisos , que posibilite determinar y acotar de forma precisa las capacidades de los usuarios.
Estos privilegios se articulan en dos planos operativos:
- A escala del servidor , mediante el uso de credenciales de ingreso (inicios de sesión) y funciones de servidor (roles de servidor) .
- A escala de la base de datos , a través de identidades de usuario y agrupaciones de permisos específicos (roles de base de datos) .

Esta arquitectura de permisos establece una barrera protectora completa que resguarda la fidelidad y el secreto de los datos alojados en el sistema.

Identidades de Usuario y Autenticación en la Base de Datos: 
El acceso a una base de datos se inicia con un inicio de sesión que autoriza la conexión al servidor. Una vez autenticado, se debe crear una identidad de usuario dentro de la base de datos y vincularla a ese inicio de sesión.
- Habitualmente, el identificador del usuario en la base de datos coincide con el inicio de sesión, aunque esta concordancia no es obligatoria .
- Cada usuario de una base de datos mantiene una asociación única con un inicio de sesión.
- No obstante, un mismo inicio de sesión puede estar vinculado a una identidad de usuario en varias bases de datos , permitiendo la interacción con todas ellas.
- También existe la posibilidad de generar identidades de usuario que no dependen de un inicio de sesión a nivel de servidor. A estos se les denomina usuarios de bases de datos autónomas o independientes.

La Función de los Roles en la Administración de Permisos: 
Los roles son mecanismos que agrupan de manera lógica conjuntos de permisos, optimizando el proceso de administración.
- Roles Predefinidos (Fijos) de Base de Datos: 
Son agrupaciones de permisos ya configuradas y de utilidad general a nivel de base de datos. Es factible integrar en estos roles tanto identidades de usuario individuales como otros roles personalizados, utilizando para ello el comando ALTER ROLE... ADD MEMBER.
- Roles de Base de Datos Creados por el Usuario (Personalizados): 
Aquellos usuarios que poseen la potestad para crear roles tienen la capacidad de establecer nuevos roles para clasificar a los usuarios en función de los privilegios que comparten . Este método simplifica la gestión de accesos, ya que facilita la concesión o supresión de permisos a todo un conjunto de usuarios con una sola operación sobre el rol, en lugar de realizar cambios individuales.

## Optimización de consultas a través de índices

Los índices son esenciales para agilizar el rendimiento de las consultas en bases de datos. Sin un índice, el motor de la base de datos debe revisar la tabla por completo 
(un "full table scan") para encontrar un valor, un proceso muy ineficiente en tablas de gran volumen. Los índices funcionan como un directorio o puntero que permite localizar 
rápidamente las filas que cumplen con las condiciones de la cláusula WHERE, mejorando excesivamente el tiempo de respuesta.

Es vital ser estratégico al crear índices. Un exceso de ellos incrementa el uso de almacenamiento y puede ralentizar las operaciones de escritura (como INSERT, UPDATEy DELETE),
dado que cada índice afectado debe actualizarse. El objetivo es encontrar un equilibrio entre la aceleración de las lecturas y el costo de mantenimiento de las escrituras.

Existen diversos tipos de índices, cada uno con un propósito específico:

• Índices de clave primaria (PRIMARY KEY): Identifican de forma única cada fila y no permiten valores nulos.

• Índices de clave ajena (FOREIGN KEY): Referencian claves primarias en otras tablas.

• Índices únicos (UNIQUE): Garantizan la unicidad de los valores de una columna y pueden permitir valores nulos.

• Índices con valores repetidos (INDEX): Ideales para búsquedas en columnas con datos duplicados.

• Índices de múltiples columnas: Considere más de una columna para optimizar la búsqueda.

• Índices de texto completo (FULLTEXT INDEX): Usados ​​para búsquedas en campos de texto.

• Índices funcionales: A partir de MySQL 8.0.13, permiten indexar el resultado de expresiones o funciones.

• Índices agrupados (CLUSTERED INDEX): Organizan básicamente las filas de la tabla en el orden del índice. Solo puede haber un índice agrupado por tabla, y es ideal para columnas que se buscan o filtran de manera secuencial, como fechas o ID.

• Índices no agrupados (NON-CLUSTERED INDEX): Contienen una estructura separada que apunta a las ubicaciones de los datos en la tabla. Una tabla puede tener múltiples índices no agrupados.

• Índices filtrados: Se aplican a subconjuntos específicos de filas en una tabla, mejorando las consultas que buscan condiciones específicas.

• Índices espaciales (SPATIAL INDEX): Utilizados en bases de datos geoespaciales para manejar datos geográficos y realizar consultas espaciales.


En resumen, los índices deben aplicarse selectivamente para potenciar el rendimiento donde más se necesita, sin sobrecargar las operaciones diarias de la base de datos.

### Procedimientos y funciones almacenados

Los procedimientos almacenados forman parte de las metodologías esenciales en el diseño y administración de bases de datos, permitiendo un desarrollo organizado y manejo eficiente de los datos. Los procedimientos almacenados se utilizan como una metodología estructurada para ejecutar operaciones complejas y repetitivas, gestionando múltiples transacciones y asegurando la consistencia y seguridad de los datos. Esta metodología es ideal para operaciones que requieren la modificación de datos en diferentes tablas o la ejecución de procesos de negocio definidos, garantizando que se sigan los mismos pasos y lógica en cada ejecución.

Las funciones almacenadas en cambio, representan una metodología mas inclinada hacia el cálculo y consulta de datos específicos. Éstas no modifican los datos, en cambio, se recurre a ellas para realizar cálculos derivados, como obtener totales, promedios o formatos específicos, y retornar un único valor. Esta metodología permite una integración sencilla de operaciones matemáticas o de transformación en consultas, facilitando la obtención de información sin alterar los datos base. Las funciones almacenadas son especialmente útiles para estandarizar estos cálculos en diferentes consultas y asegurar una coherencia en el tratamiento de la información.

## Capítulo III: METODOLOGÍA SEGUIDA


## Capítulo IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS

### Modelo Relacional 

![Modelo Relacional IMG](https://github.com/Renata281/Proyecto-BD-Grupo8/blob/6369661f5f9a9bfacfc0fd8b33fcaabdb7a034d4/Modelo_Relacional_Grupo_8.png)

### Diccionario de Datos

### Características de la Tabla: Cliente
- **Nombre**: Cliente
- **Módulo**: Cliente
- **Descripción**: Tabla para almacenar los datos del cliente.

### Características de los Datos
| Campo           | Tipo   | Long | Significado                               |
|-----------------|--------|------|-------------------------------------------|
| id_cliente	  | INT    |      | Indica el número del cliente              |
| nombre          | VARCHAR|  50  | Indica el nombre del cliente			  |
| apellido        | VARCHAR|  50  | Indica el apellido del cliente 			  |
| telefono        | BIGINT |      | Indica la telefono del cliente 			  |
| email		      | VARCHAR| 100  | Indica el email del cliente 			  |
| DNI             | INT    |      | DNI de un cliente 			  			  |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| id_cliente      | PRIMARY KEY       |


### Características de la Tabla: detalle_reserva
- **Nombre**: detalle_reserva
- **Módulo**: detalle_reserva
- **Descripción**: Tabla que almacena el detalle de cada reserva.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                 |
|-----------------|----------|------|-----------------------------|
| nro_reserva 	  | INT      |      | Código de la reserva        |
| id_cliente      | INT      |      | Código del cliente          |
| fecha_ingreso   | DATE     |      | Fecha de ingreso            |
| fecha_salida    | DATE     |      | Fecha de salida			  |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| nro_reserva     | PRIMARY KEY      |
| id_cliente      | PRIMARY KEY      |
| fechas 	      | CHECK	         |

#### Claves Foráneas
| Campo 	   | Entidad asociada |
|--------------|------------------|
| nro_reserva  | reserva         |
| id_cliente   | cliente         |


### Características de la Tabla: reserva
- **Nombre**: reserva
- **Módulo**: reserva
- **Descripción**: Tabla que almacena la informacion de la reserva.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                 |
|-----------------|----------|------|-----------------------------|
| nro_reserva 	  | INT      |      | Número de la reserva        |
| monto_total     | FLOAT    |      | Monto total de la reserva   |
| nro_habitacion  | INT      |      | Número de la habitacion     |
| id_piso         | INT      |      | Código del piso			  |
| id_pago         | INT      |      | Código del pago             |
| id_usuario      | INT      |      | Código del usuario	      |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| nro_reserva     | PRIMARY KEY      |

#### Claves Foráneas
| Campo 	    | Entidad asociada |
|-------------- |------------------|
| nro_habitacion| habitacion       |
| id_piso       | habitacion       |
| id_pago       | forma_pago       |
| id_usuario    | usuario          |


### Características de la Tabla: usuario
- **Nombre**: usuario
- **Módulo**: usuario
- **Descripción**: Tabla que almacena la informacion del usuario.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                   |
|-----------------|----------|------|-------------------------------|
| id_usuario 	  | INT      |      | Indica el número del usuario  |         
| nombre          | VARCHAR  |  50  | Indica el nombre del usuario  |
| apellido        | VARCHAR  |  50  | Indica el apellido del usuario|    
| dni             | INT      |      | DNI del uduario      		    |
| telefono        | BIGINT   |      | Telefono del usuario          |
| email           | VARCHAR  | 100  | Email del usuario  	        |
| password        | VARCHAR  |  10  | Contraseña del usuario        |
| id_cargo        | INT      |      | Código del cargo      	    |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| id_usuario      | PRIMARY KEY      |


#### Claves Foráneas
| Campo 	    | Entidad asociada |
|-------------- |------------------|
| id_cargo      | cargo            |


### Características de la Tabla: habitacion
- **Nombre**: habitacion
- **Módulo**: habitacion
- **Descripción**: Tabla que almacena la informacion de la habitacion.

### Características de los Datos
| Campo           | Tipo     | Long | Significado                   |
|-----------------|----------|------|-------------------------------|
| nro_habitacion  | INT      |      | Número de habitación  		|         
| id_piso	 	  | INT		 |      | Piso de la habitación 		|
| cant_cama       | INT		 |      | Indica la cantidad de camas   |    
| precio_unitario | FLOAT    |      | Precio de la habitación		|
| descripcion     | VARCHAR  | 200  | Descripcion de la habitación  |
| id_tipo         | INT		 |      | Tipo de habitación 	        |
| id_estado       | INT      |      | Estado de la habitación	    |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| nro_habitacion  | PRIMARY KEY      |
| id_piso         | PRIMARY KEY      |

#### Claves Foráneas
| Campo 	    | Entidad asociada |
|-------------- |------------------|
| id_tipo       | tipo_habitacion  |
| id_estado     | estado_habitacion|


### Características de la Tabla: Piso
- **Nombre**: Piso
- **Módulo**: Piso
- **Descripción**: Tabla para almacenar los datos del Piso.

### Características de los Datos
| Campo           | Tipo   | Long | Significado                               |
|-----------------|--------|------|-------------------------------------------|
| id_piso 		  | INT    |      | Indica el número del piso	              |
| descripcion     | VARCHAR|  100 | Indica la descripción del piso			  |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| id_piso         | PRIMARY KEY      |


### Características de la Tabla: forma_pago
- **Nombre**: forma_pago
- **Módulo**: forma_pago
- **Descripción**: Tabla para almacenar los datos de las distintas formas de pago.

### Características de los Datos
| Campo           | Tipo   | Long | Significado                               |
|-----------------|--------|------|-------------------------------------------|
| id_pago 		  | INT    |      | Indica el número del pago	              |
| descripcion     | VARCHAR|  100 | Indica el nombre de la forma de pago      |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| id_pago      | PRIMARY KEY       |


### Características de la Tabla: cargo
- **Nombre**: cargo
- **Módulo**: cargo
- **Descripción**: Tabla para almacenar los datos de los distintos cargos.

### Características de los Datos
| Campo           | Tipo   | Long | Significado                               |
|-----------------|--------|------|-------------------------------------------|
| id_cargo		  | INT    |      | Indica el número del cargo	              |
| descripcion     | VARCHAR|  100 | Indica el nombre del cargo                |

#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| id_cargo       | PRIMARY KEY       |

### Características de la Tabla:  tipo_habitacion
- **Nombre**: tipo_habitacion
- **Módulo**: tipo_habitacion
- **Descripción**: Tabla que almacena información del tipo de habitación

### Características de los Datos
| Campo           | Tipo   | Long | Significado                               |
|-----------------|--------|------|-------------------------------------------|
| id_tipo		  | INT    |      | numero de tipo de habitación              |
| descripcion     | VARCHAR|  50  | descripción del tipo de habitación		  |


#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| id_tipo         | PRIMARY KEY      |

### Características de la Tabla: estado_habitacion
- **Nombre**: estado_habitacion
- **Módulo**: estado_habitacion
- **Descripción**: Tabla que almacena información del estado de la habitación

### Características de los Datos
| Campo           | Tipo   | Long | Significado                               |
|-----------------|--------|------|-------------------------------------------|
| id_estado		  | INT    |      | número de estado			              |
| descripcion     | VARCHAR|  50  | descripción del estado de la habitación	  |


#### Restricciones
| Campo           | Tipo restricción |
|-----------------|------------------|
| id_tipo         | PRIMARY KEY      |

### Modelo Físico

``` SQL
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

```

---

### Procedimientos y Funciones Almacenadas 

#### 1. Procedimientos Almacenados

Los procedimientos almacenados que se llevaron a cabo para esta base de datos fueron para optimizar y facilitar el proceso de reserva de una habitación para un hotel.Los procedimientos y funciones utilizados fueron los siguientes:

##### Procedimiento 1: `modificar_fecha_reserva`

- **Objetivo**: Cambiar la fecha de reserva en caso de error o solicitud del cliente.
- **Descripción**: Este procedimiento recibe como parámetros las fechas de ingreso y salida, el nro de piso y habitación.
- **Ejemplo de Uso**:
  ```sql
  EXEC modificar_fecha_reserva
    @id_reserva = 5,
    @fecha_ingreso = '2026-03-10',
    @fecha_salida = '2026-03-15';
  ```

##### Procedimiento 2: `cambiar_estado_habitacion`

- **Objetivo**: actualiza el estado de la habitacion segun el tipo de estado que reciba como parámetro.
- **Descripción**: Este procedimiento permite modificar el estado de una habitación.
- **Ejemplo de Uso**:
  ```sql
  EXEC cambiar_estado_habitacion
    @nro_habitacion = 301,
    @nro_piso = 3,
    @estado = 1;
  ```

##### Procedimiento 3: `reservar_habitacion`

- **Objetivo**: Agilizar el alta de una reserva.
- **Descripción**: Este procedimiento es el principal para manejar eficientemente el registro de una nueva reserva.
- **Ejemplo de Uso**:
  ```sql
  EXEC reservar_habitacion
    @fecha_ingreso = '2026-02-01',
    @fecha_salida = '2026-02-07',
    @dni_cliente = 40123456,  
    @nro_habitacion = 202,   
    @nro_piso = 2,
    @id_pago = 1;            
  ```

#### 2. Funciones Almacenadas

Las funciones desarrolladas fueron diseñadas para optimizar principalmente el procedimiento de reservar una habitación, haciendo el proceso mucho mas limpio y sencillo de llevar a cabo.

##### Función 1: `buscar_id_cliente`

- **Objetivo**: Traer el id del cliente mediante su dni.
- **Descripción**: Esta función recibe el dni del cliente y devuelve su id, haciendo mas sencillo la accion de reserva.
- **Ejemplo de Uso**:
  ```sql
  SELECT buscar_id_cliente(40123456);
  ```

##### Función 2: `habitacion_disponible`

- **Objetivo**: Indica si la habitacion está disponible o no.
- **Descripción**: Esta función devuelve 1 si la habitación se encuentra disponible para un registro nuevo en un intervalo de fechas.
- **Ejemplo de Uso**:
  ```sql
  SELECT habitacion_disponible(
    @nro_habitacion = 101, 
    @nro_piso = 1, 
    @fecha_ingreso = '2025-12-20', 
    @fecha_salida = '2025-12-26'
	);
  ```

##### Función 3: `calcular_monto`

- **Objetivo**: Automatizar el cálculo del monto final de la reserva.
- **Descripción**: Esta función recibe las fechas de ingreso y salida, el nro de piso y de habitación para calcular el monto total segun la cantidad de dias y precio por noche de la habitación.
- **Ejemplo de Uso**:
  ```sql
  SELECT calcular_monto(
    @nro_habitacion = 101, 
    @id_piso = 1, 
    @fecha_ingreso = '2025-12-20', 
    @fecha_salida = '2025-12-26'
	);
  ```

#### 3. Resultados de las Pruebas de Rendimiento
Para comprobar el rendimiendo general se utilizó el siguiente script de prueba para comparar el tiempo de ejecución de un insert simple y del procedimiento de reservar_habitación.

´´´sql

	-------------------------------------------------------------------
	-- PRUEBA DE EFICIENCIA
	-------------------------------------------------------------------
	
	-- Mide el tiempo de la consulta directa
	PRINT '--- INICIANDO PRUEBA: CONSULTA DIRECTA ---';
	SET STATISTICS TIME ON;
	
	--  Insert básico
	INSERT INTO reserva(
	    fecha_ingreso, fecha_salida, monto_total, id_cliente,
	    nro_habitacion, id_piso, id_pago
	)
	VALUES(
	    '2026-01-10', '2026-01-12', 37000.00, 2, 102, 1, 1
	);
	
	SET STATISTICS TIME OFF;
	PRINT '--- FIN PRUEBA: CONSULTA DIRECTA ---';
	GO
	
	
	-- Mide el tiempo del procedimiento
	PRINT '--- INICIANDO PRUEBA: PROCEDIMIENTO ALMACENADO ---';
	SET STATISTICS TIME ON;
	
	-- Insert mediante el procedimiento almacenado
	EXEC reservar_habitacion
	    @fecha_ingreso = '2026-01-10',
	    @fecha_salida = '2026-01-12',
	    @dni_cliente = 38193339,  
	    @nro_habitacion = 201, 
	    @nro_piso = 2,
	    @id_pago = 4;         
	
	SET STATISTICS TIME OFF;
	PRINT '--- FIN PRUEBA: PROCEDIMIENTO ALMACENADO ---';
	GO
´´´
Luego de ejecutar ese script, se obtuvo el siguiente mensaje de salida:

--- INICIANDO PRUEBA: CONSULTA DIRECTA ---
SQL Server parse and compile time: 
   CPU time = 0 ms, elapsed time = 0 ms.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.

--- FIN PRUEBA: CONSULTA DIRECTA ---
--- INICIANDO PRUEBA: PROCEDIMIENTO ALMACENADO ---
SQL Server parse and compile time: 
   CPU time = 0 ms, elapsed time = 11 ms.

 SQL Server Execution Times:
   CPU time = 15 ms,  elapsed time = 10 ms.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.

 SQL Server Execution Times:
   CPU time = 16 ms,  elapsed time = 24 ms.

 SQL Server Execution Times:
   CPU time = 15 ms,  elapsed time = 17 ms.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 3 ms.

SQL Server parse and compile time: 
   CPU time = 0 ms, elapsed time = 11 ms.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 13 ms.

 SQL Server Execution Times:
   CPU time = 46 ms,  elapsed time = 81 ms.
--- FIN PRUEBA: PROCEDIMIENTO ALMACENADO ---

A simple vista se puede ver como el tiempo de ejecución de la insersión básica es ampliamente menor al del procedimiento, esto no significa que sea más eficaz. La desventaja que tiene el script basico de insert respecto al procedimiento es su confiabilidad, puesto que no realiza validaciones ni contempla casos como los que sería el reservar la misma habitación en las mismas fechas para distintos clientes como lo hace el segundo método. Por lo que se puede decir que en cuanto a eficiencia es mejor el procedimiento almacenado a pesar de que ocupe más tiempo de ejecución, ya que es un método que contempla cada caso posible y evita inconsistencias.

## Uso de Índices

A fines prácticos, para lograr obtener una mejor comprensión sobre el uso de índices y su impacto en las consultas, se insertó 500,000 registros sobre la tabla de reserva. Posteriormente se realizó una consulta para obtener las reservas del primer trimestre de 2024 (WHERE fecha_ingreso BETWEEN '2024-01-01' AND '2024-03-31') y se comparó los resultados.

Se analizaron tres escenarios:

1-Cuando la tabla posee su índice agrupado por defecto en nro_reserva (no útil para la consulta de fecha).

2-Cuando se define un índice agrupado sobre el campo de la fecha.

3-Cuando se define un índice agrupado sobre la fecha que además incluye otras columnas.

Los resultados fueron los siguientes:

1. Consulta sin índice agrupado sobre la columna fecha
Plan de ejecución y tiempos de respuesta:

(24912 filas afectadas)
Table 'reserva'. Scan count 1, logical reads 2729, physical reads 0, page server reads 0, read-ahead reads 2662, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

SQL Server Execution Times:
CPU time = 94 ms,  elapsed time = 966 ms.

2. Consulta con el índice agrupado solo sobre la columna fecha
Plan de ejecución y tiempos de respuesta:

(24912 filas afectadas)
Table 'reserva'. Scan count 1, logical reads 168, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

SQL Server Execution Times:
CPU time = 31 ms,  elapsed time = 832 ms.

3. Consulta sobre el índice agrupado incluyendo varias columnas 
Plan de ejecución y tiempos de respuesta:

(24912 filas afectadas)
Table 'reserva'. Scan count 1, logical reads 144, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

SQL Server Execution Times:
CPU time = 31 ms,  elapsed time = 733 ms.

En base a los resultados obtenidos, nos dimos cuenta que la creación de un índice agrupado en la columna fecha_ingreso redujo significativamente el número de lecturas lógicas necesarias para la consulta, pasando de 2729 lecturas a 168.

Por otro lado, la inclusión de otras columnas en un índice agrupado adicional (Prueba 3) optimizó aún más el acceso a los datos que se estaban buscando, reduciendo las lecturas lógicas a 144.

Además, se observó una mejora drástica en el tiempo de CPU después de agregar los índices, bajando de 94 ms a 31 ms en la primera prueba con el índice agrupado simple. El índice agrupado extendido (compuesto) mostró un tiempo de CPU idéntico de 31 ms y un tiempo transcurrido total ligeramente menor, demostrando ser marginalmente más eficiente en E/S (IO) para esta consulta.


## Capítulo V: CONCLUSIONES 
Respecto al tema de procedimientos y funciones almacenadas podemos decir que, aunque en algunos casos no parezcan más eficientes que las consultas sencillas, nos permiten tener un código mucho mas limpio y seguro, permitiendonos asegurar la consistentencia del mismo y contemplar errores que una consulta sencilla no podría, ademas que al momento de ponerlos en practica tienen una estructura más sencilla que permite comprensión sobre lo que se está haciendo.

## Capítulo VI: BIBLIOGRAFÍA 

