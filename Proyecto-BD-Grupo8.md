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

---

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
| id_piso      | PRIMARY KEY       |

---

## Capítulo V: CONCLUSIONES 
. 

## Capítulo VI: BIBLIOGRAFÍA 

