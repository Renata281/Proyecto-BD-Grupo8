
/** 1-Crear dos usuarios de base de datos, a un usuario darle el permiso de administrador y
al otro usuario solo permiso de lectura.
**/

-- Crear dos usuarios de base de datos
CREATE LOGIN admin_hotel WITH PASSWORD = 'Admin123*';
CREATE USER admin_hotel FOR LOGIN admin_hotel;

CREATE LOGIN lector_hotel WITH PASSWORD = 'Lector123*';
CREATE USER lector_hotel FOR LOGIN lector_hotel;

-- Permisos de administrador
ALTER ROLE db_owner ADD MEMBER admin_hotel;

-- Permisos de solo lectura
ALTER ROLE db_datareader ADD MEMBER lector_hotel;


/** 2-Utilizar los procedimientos almacenados creados anteriormente.
**/
--Se encuentran en: Procedimientos_almacenados.sql

/*
buscar cliente por dni, devuelve id_cliente
*/
create function buscar_id_cliente
(
	@dni_cliente bigint
)
returns int
as 
begin
declare @cliente_id int;

select top(1)
	@cliente_id = id_cliente 
from cliente
where dni = @dni_cliente;

return @cliente_id;
end
go

/*
devuelve 1 o 0 si la habitacion está disponible o no entre un intervalo de fechas
*/
create function habitacion_disponible
(
	@nro_habitacion int,
	@nro_piso int,
	@fecha_ingreso date,
	@fecha_salida date
)
returns bit
as 
begin
	declare @ocupada bit = 0;
	if exists(
		select 1
		from reserva as r
		where r.nro_habitacion = @nro_habitacion and 
				r.id_piso = @nro_piso and (
				@fecha_ingreso < r.fecha_salida and @fecha_salida > r.fecha_ingreso
			)
	)
	begin
	set @ocupada = 1;
	end
	return @ocupada;
end
go

/*
calcula el monto total con precio unitario y cantidad de noches
*/
create function calcular_monto
(
    @nro_habitacion int,
    @id_piso int,
    @fecha_ingreso date,
    @fecha_salida date
)
returns decimal(18,2)
as
begin
    declare @monto_calculado decimal(18,2) = 0;
    declare @cantidad_noches int;
    declare @precio_por_noche decimal(18,2);

    set @cantidad_noches = datediff(day,@fecha_ingreso,@fecha_salida);

    select @precio_por_noche = precio_unitario 
    from habitacion
    where nro_habitacion = @nro_habitacion and id_piso = @id_piso;

    if @cantidad_noches > 0 and @precio_por_noche is not null
    begin
        set @monto_calculado = @cantidad_noches * @precio_por_noche;
    end

    return @monto_calculado;
end
go

/*
cambia el estado de la habitacion a ocupado
*/
create procedure cambiar_estado_habitacion
	@nro_habitacion int,
	@nro_piso int,
	@estado int
as
begin
	update habitacion
    set id_estado = @estado
    where nro_habitacion = @nro_habitacion
			 and id_piso = @nro_piso;
end
go


/*
reserva una habitacion
*/
create procedure reservar_habitacion
	@fecha_salida date,
	@fecha_ingreso date,
	@dni_cliente bigint,
	@nro_habitacion int,
	@nro_piso int,
	@id_pago int
as
begin
	declare @cliente int;
	set @cliente = dbo.buscar_id_cliente(@dni_cliente);

	if @cliente is null
	begin 
	print 'el cliente no existe'
		return
	end

	declare @esta_ocupada bit;
	set @esta_ocupada = dbo.habitacion_disponible(@nro_habitacion, @nro_piso, @fecha_ingreso, @fecha_salida);

	declare @monto_total decimal(18,2);
	set @monto_total = dbo.calcular_monto(@nro_habitacion, @nro_piso, @fecha_ingreso, @fecha_salida);

	if @esta_ocupada = 1
	begin
		print 'habitacion no disponible entre esas fechas'
	end
	else
	begin
		insert into reserva(
		fecha_ingreso,
		fecha_salida,
		monto_total,
		id_cliente,
		nro_habitacion,
		id_piso,
		id_pago
		)
		values(
		@fecha_ingreso,
		@fecha_salida,
		@monto_total,
		@cliente,
		@nro_habitacion,
		@nro_piso,
		@id_pago
		);

		exec dbo.cambiar_estado_habitacion
			@nro_habitacion = @nro_habitacion,
			@nro_piso = @nro_piso,
			@estado = 2
		;
	end
end
go


/** 3-Al usuario con permiso de solo lectura, darle permiso de ejecución sobre este procedimiento
**/
GRANT EXECUTE ON reservar_habitacion TO lector_hotel;


/** 4-Realizar INSERT con sentencia SQL sobre la tabla del procedimiento con ambos usuarios
**/

--INSERT con usuario admin_hotel con permiso de administrador
INSERT INTO reserva(fecha_ingreso, fecha_salida, monto_total, id_cliente, nro_habitacion, id_piso, id_pago)
VALUES ('2025-01-10','2025-01-12',5000,1,101,1,1);

SELECT * 
FROM reserva 
WHERE id_cliente = 1 AND fecha_ingreso = '20250110';
--Inserto correctamente


--INSERT con usuario lector_hotel con permiso de lectura
INSERT INTO reserva(fecha_ingreso, fecha_salida, monto_total, id_cliente, nro_habitacion, id_piso, id_pago)
VALUES ('2025-01-20','2025-01-22',7000,1,101,1,1);
--No permite realizar el INSERT
--Imprime el mensaje: Se denegó el permiso INSERT en el objeto 'reserva', base de datos 'hoteleria', esquema 'dbo'


/** 5- Realizar un INSERT a través del procedimiento almacenado con el usuario con permiso de solo lectura
**/

EXEC reservar_habitacion
    @fecha_salida = '2025-02-09',
    @fecha_ingreso = '2025-02-05',
    @dni_cliente = 42134933,
    @nro_habitacion = 103,
    @nro_piso = 1,
    @id_pago = 1;

SELECT *
FROM reserva
WHERE nro_habitacion = 103;

--En este caso, si permite realizar un INSERT
