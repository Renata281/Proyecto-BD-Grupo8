
```sql
------------------------------------ 1. Carga Masiva de los datos --------------------------------------------
-- Declaracion de variables
DECLARE @i INT = 1;
DECLARE @total_registros INT = 100000;


-- Variables para los datos aleatorios
DECLARE @fecha_in DATE;
DECLARE @dias_estadia INT;
DECLARE @fecha_out DATE;
DECLARE @monto DECIMAL(18,2);
DECLARE @id_cli INT;
DECLARE @id_pay INT;
DECLARE @hab_selector INT;
DECLARE @nro_hab INT;
DECLARE @piso_hab INT;

-- Obtenemos el ID del cliente de prueba 
SELECT TOP 1 @id_cli = id_cliente FROM cliente;

-- Inicia el bucle
WHILE @i <= @total_registros
BEGIN
    
    -- 1. Generar fechas aleatorias
    SET @fecha_in = DATEADD(DAY, - (ABS(CHECKSUM(NEWID())) % 3650), GETDATE()); 
    -- Estadía 
    SET @dias_estadia = (ABS(CHECKSUM(NEWID())) % 14) + 1; 
    SET @fecha_out = DATEADD(DAY, @dias_estadia, @fecha_in);

    -- 2. Generar monto aleatorio
    SET @monto = (RAND() * 5000) + 100;

    -- 3. Seleccionar forma de pago aleatoria 
    SET @id_pay = (ABS(CHECKSUM(NEWID())) % 3) + 1;

    -- 4. Seleccionar habitación aleatoria 
    SET @hab_selector = (ABS(CHECKSUM(NEWID())) % 4) + 1;
    
    SELECT 
        @nro_hab = CASE @hab_selector 
                        WHEN 1 THEN 101 
                        WHEN 2 THEN 102 
                        WHEN 3 THEN 201 
                        WHEN 4 THEN 301 
                   END,
        @piso_hab = CASE @hab_selector 
                        WHEN 1 THEN 1 
                        WHEN 2 THEN 1 
                        WHEN 3 THEN 2 
                        WHEN 4 THEN 3 
                    END;

    -- 5. Insertar el registro
    INSERT INTO reserva (
        fecha_ingreso, 
        fecha_salida, 
        monto_total, 
        id_cliente, 
        nro_habitacion, 
        id_piso, 
        id_pago
    )
    VALUES (
        @fecha_in,
        @fecha_out,
        @monto,
        @id_cli,
        @nro_hab,
        @piso_hab,
        @id_pay
    );

    SET @i = @i + 1;
END;
-------------------------------------- 2. Busqueda por periodo ----------------------------------------------
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT * FROM reserva
WHERE fecha_ingreso BETWEEN '2022-01-01' AND '2022-12-31';
/*
Plan de ejecucion y tiempos de respuesta:
(30395 filas afectadas)
Table 'reserva'. Scan count 1, logical reads 1669, physical reads 0, page server reads 0, read-ahead reads 1544, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

SQL Server Execution Times:
   CPU time = 47 ms,  elapsed time = 1023 ms.
*/
-------------------------------------- 3. Creación del indice ----------------------------------------------

--- Creando Índice Agrupado en fecha_ingreso ---';
---Eliminar la Clave Primaria 
ALTER TABLE reserva
DROP CONSTRAINT PK_reserva;

CREATE CLUSTERED INDEX IX_reserva_fecha_ingreso
ON reserva (fecha_ingreso);

---Se vuelve a crear la Clave Primaria (PK).

ALTER TABLE reserva
ADD CONSTRAINT PK_reserva PRIMARY KEY (nro_reserva);

--- Ahora ya con el índice creado, se ajusta la consulta nuevamente:
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT * FROM reserva
WHERE fecha_ingreso BETWEEN '2022-01-01' AND '2022-12-31';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

/*
Plan de ejecucion y tiempos de respuesta:
(30395 filas afectadas)
Table 'reserva'. Scan count 1, logical reads 203, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

SQL Server Execution Times:
   CPU time = 16 ms,  elapsed time = 1235 ms.
*/

-------------------------------------- 4. Eliminación el indice ----------------------------------------------
DROP INDEX [IX_reserva_fecha_ingreso] ON reserva;
----------------------------------- 5. Creación del nuevo indice ----------------------------------------------
--- Se elimina la Clave Primaria (PK_reserva) actual.

ALTER TABLE reserva
DROP CONSTRAINT PK_reserva;


--- se crea el nuevo índice agrupado. 

CREATE CLUSTERED INDEX IX_reserva_Agrupado_Compuesto
ON reserva (
    fecha_ingreso, 
    nro_reserva,    
    fecha_salida,
    monto_total,
    id_cliente,
    nro_habitacion,
    id_piso,
    id_pago
);

--- se vuelve a crear la Clave Primaria (PK) en nro_reserva.

ALTER TABLE reserva
ADD CONSTRAINT PK_reserva PRIMARY KEY NONCLUSTERED (nro_reserva);



SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT * FROM reserva
WHERE fecha_ingreso BETWEEN '2022-01-01' AND '2022-12-31';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
/*

Plan de ejecucion y tiempos de respuesta:
(30395 filas afectadas)
Table 'reserva'. Scan count 1, logical reads 175, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

SQL Server Execution Times:
   CPU time = 31 ms,  elapsed time = 1237 ms.
*/

```
