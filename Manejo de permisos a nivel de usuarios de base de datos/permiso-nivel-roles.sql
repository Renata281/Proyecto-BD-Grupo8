USE hoteleria;

/**
1- Crear dos usuarios de base de datos.
**/
CREATE LOGIN usuario_rol1 WITH PASSWORD = 'RolUser1*';
CREATE USER usuario_rol1 FOR LOGIN usuario_rol1;

CREATE LOGIN usuario_rol2 WITH PASSWORD = 'RolUser2*';
CREATE USER usuario_rol2 FOR LOGIN usuario_rol2;


/**
2- Crear un rol que solo permita la lectura de alguna de las tablas creadas.
**/
CREATE ROLE rol_lectura;
GRANT SELECT ON cliente TO rol_lectura;


/**
3- Darle permiso a uno de los usuarios sobre el rol creado anteriormente.
**/
ALTER ROLE rol_lectura ADD MEMBER usuario_rol1;


/**
4- Verificar el comportamiento de ambos usuarios (el que tiene permiso sobre el rol y el que no tiene),
cuando intentan leer el contenido de la tabla
**/
--Utilizando el rol de lectura en el usuario_rol1(tiene permisos de lectura)

SELECT * FROM cliente;
--Me permite consultar en la tabla cliente

--Utilizando el rol de lectura en el usuario_rol2(No tiene permisos de lectura)
--No me permite consultar la tabla cliente


/**
5- Expresar sus conclusiones
**/

/**
En conclusion:
- usuario_rol1 solo me permite realizar consultas a la tablas que se le a asignado como rol de lectura.
-usuario_rol2 no me permite realizar consultas a las tablas si no tiene asignado como rol de lectura.
**/
