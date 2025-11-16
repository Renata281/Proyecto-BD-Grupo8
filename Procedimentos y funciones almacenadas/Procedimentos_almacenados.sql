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
	set @cliente = buscar_id_cliente(@dni_cliente);

	if @cliente is null
	begin 
	print 'el cliente no existe'
		return
	end

	declare @esta_ocupada bit;
	set @esta_ocupada = habitacion_disponible(@nro_habitacion, @nro_piso, @fecha_ingreso, @fecha_salida);

	declare @monto_total decimal(18,2);
	set @monto_total = calcular_monto(@nro_habitacion, @nro_piso, @fecha_ingreso, @fecha_salida);

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

		exec cambiar_estado_habitacion
			@nro_habitacion = @nro_habitacion,
			@id_piso = @nro_piso,
			@nuevo_estado = 2
		;
	end
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
modifica las fechas de la reserva
*/
create procedure modificar_fecha_reserva
	@id_reserva int,
	@fecha_ingreso date,
	@fecha_salida date
as
begin
	update reserva
	set fecha_ingreso = @fecha_ingreso,
		fecha_salida = @fecha_salida
	where nro_reserva = @id_reserva
end
go
