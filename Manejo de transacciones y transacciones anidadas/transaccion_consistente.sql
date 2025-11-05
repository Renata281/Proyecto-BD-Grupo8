Utilizar hoteleria;


BEGIN TRY
    BEGIN TRANSACTION;

    -- 1️⃣ Insertar un nuevo cliente
    INSERT INTO cliente (nombre, apellido, email, telefono, dni)
    VALUES ('Ana', 'Gómez', 'ana.gomez@example.com', 1122334455, 44556677);

    DECLARE @nuevoCliente INT = SCOPE_IDENTITY();

    -- 2️⃣ Insertar una reserva (suponiendo que existen los registros base)
    INSERT INTO reserva (fecha_ingreso, fecha_salida, monto_total, id_cliente, nro_habitacion, id_piso, id_pago)
    VALUES ('2025-11-10', '2025-11-15', 150000, @nuevoCliente, 101, 1, 1);

    -- 3️⃣ Actualizar estado de la habitación (por ejemplo, marcarla como ocupada)
    UPDATE habitacion
    SET id_estado = 2  -- 2 = Ocupada (por ejemplo)
    WHERE nro_habitacion = 101 AND id_piso = 1;

    COMMIT TRANSACTION;
    PRINT '✅ Transacción completada correctamente.';
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT '❌ Error en la transacción. Se han revertido todos los cambios.';
    PRINT ERROR_MESSAGE();
END CATCH;

