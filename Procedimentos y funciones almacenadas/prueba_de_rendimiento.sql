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
