´´´ SQL
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

´´´
