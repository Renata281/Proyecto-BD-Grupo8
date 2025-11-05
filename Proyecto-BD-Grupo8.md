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


---


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

Conclusiones

En base a los resultados obtenidos, nos dimos cuenta que la creación de un índice agrupado en la columna fecha_ingreso redujo significativamente el número de lecturas lógicas necesarias para la consulta, pasando de 2729 lecturas a 168.

Por otro lado, la inclusión de otras columnas en un índice agrupado adicional (Prueba 3) optimizó aún más el acceso a los datos que se estaban buscando, reduciendo las lecturas lógicas a 144.

Además, se observó una mejora drástica en el tiempo de CPU después de agregar los índices, bajando de 94 ms a 31 ms en la primera prueba con el índice agrupado simple. El índice agrupado extendido (compuesto) mostró un tiempo de CPU idéntico de 31 ms y un tiempo transcurrido total ligeramente menor, demostrando ser marginalmente más eficiente en E/S (IO) para esta consulta.


## Capítulo V: CONCLUSIONES 
. 

## Capítulo VI: BIBLIOGRAFÍA 

