/** Transacciones*/
Utilizar hoteleria;

/** 1-insertar registros en tabla cliente y reserva. Luego actualizar estado de habitación.**/
BEGIN TRY
    BEGIN TRANSACTION;

    /**Insertar un nuevo cliente**/
    INSERT INTO cliente (nombre, apellido, email, telefono, dni)
    VALUES ('Ana', 'Gómez', 'ana.gomez@example.com', 1122334455, 44556677);

    DECLARE @nuevoCliente INT = SCOPE_IDENTITY();

    /**Insertar una reserva**/
    INSERT INTO reserva (fecha_ingreso, fecha_salida, monto_total, id_cliente, nro_habitacion, id_piso, id_pago)
    VALUES ('2025-11-10', '2025-11-15', 150000, @nuevoCliente, 101, 1, 1);

    /**Actualizar estado de la habitación (por ejemplo, marcarla como ocupada), 
    La actualización sólo debe realizarse si toda la transacción se completa correctamente.**/
    UPDATE habitacion
    SET id_estado = 2  -- 2 = Ocupada 
    WHERE nro_habitacion = 101 AND id_piso = 1;


 COMMIT TRANSACTION;
    PRINT 'Transacción completada correctamente.';
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error en la transacción. Se han revertido todos los cambios.';
    PRINT ERROR_MESSAGE();
END CATCH;


/** 2- Provocar un error intencionalmente**/
BEGIN TRY
    BEGIN TRANSACTION;

    /**Insertar cliente**/
    INSERT INTO cliente (nombre, apellido, email, telefono, dni)
    VALUES ('Carlos', 'Pérez', 'carlos.perez@example.com', 1166778899, 99887766);

    DECLARE @nuevoCliente INT = SCOPE_IDENTITY();

    /**Error intencional: insertar reserva con ID de habitación inexistente**/
    INSERT INTO reserva (fecha_ingreso, fecha_salida, monto_total, id_cliente, nro_habitacion, id_piso, id_pago)
    VALUES ('2025-11-20', '2025-11-25', 200000, @nuevoCliente, 999, 9, 1);  /no existe esta habitación/piso/

   /**Actualización (no debería llegar a ejecutarse)**/
    UPDATE habitacion
    SET id_estado = 2
    WHERE nro_habitacion = 999 AND id_piso = 9;

    COMMIT TRANSACTION;
    PRINT 'Transacción completada correctamente.';
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error intencional detectado. Transacción revertida.';
    PRINT ERROR_MESSAGE();
END CATCH;

/** 3-conclusion**/
*Antes del error: todos los registros se insertan correctamente, y la habitación cambia de estado.
*Con el error intencional:
La segunda inserción falla (por clave foránea o inexistencia de la habitación).
SQL Server ejecuta el bloque CATCH.
Se ejecuta ROLLBACK TRANSACTION.
Ninguno de los INSERT ni el UPDATE quedan guardados.

conclusion:
La transacción garantiza atomicidad y consistencia.
Si una sola operación falla, toda la transacción se revierte, asegurando que la base de datos no quede con datos a medio modificar.
Esto confirma el principio de ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad) en el manejo de transacciones.


/** Transaccion Anidada**/
/** 1-insertar registros en tabla cliente y reserva. Luego actualizar estado de habitación.**/

BEGIN TRY
    BEGIN TRANSACTION TransaccionPrincipal;

    -- 1--Insertar un nuevo cliente
    BEGIN TRANSACTION TransaccionCliente;
        INSERT INTO cliente (nombre, apellido, email, telefono, dni)
        VALUES ('Rocio', 'Benitez', 'rb@gmail.com', 3795111122, 40222333);
        -- Guardamos el ID generado
        DECLARE @nuevoCliente INT = SCOPE_IDENTITY();
    COMMIT TRANSACTION TransaccionCliente;

    -- 2--Insertar una reserva para ese cliente
    BEGIN TRANSACTION TransaccionReserva;
        INSERT INTO reserva (fecha_ingreso, fecha_salida, monto_total,
                             id_cliente, nro_habitacion, id_piso, id_pago)
        VALUES ('2025-12-20', '2025-12-22', 48000,
                @nuevoCliente, 101, 1, 1);
    COMMIT TRANSACTION TransaccionReserva;

    -- 3--Actualizar estado de habitación a “Ocupado”.
    BEGIN TRANSACTION TransaccionUpdateHabitacion;
        UPDATE habitacion
        SET id_estado = 2
        WHERE nro_habitacion = 101 AND id_piso = 1;
    COMMIT TRANSACTION TransaccionUpdateHabitacion;

    -- Confirmación final
    COMMIT TRANSACTION TransaccionPrincipal;

    PRINT 'Transacción completada con éxito.';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION TransaccionPrincipal;
    PRINT 'Ocurrió un error. No se aplicó ningún cambio.';
END CATCH;

/** 2-Prueba con error intencional (NO debe insertar nada)**/

BEGIN TRY
    BEGIN TRANSACTION TransaccionPrincipal;

    -- 1--Insertar un cliente
    BEGIN TRANSACTION TransaccionCliente;
        INSERT INTO cliente (nombre, apellido, email, telefono, dni)
        VALUES ('ErrorPrueba', 'Test', 'error@test.com', 11111111, 99999999);
    COMMIT TRANSACTION TransaccionCliente;

    -- ERROR INTENCIONAL
    
    DECLARE @a INT = 1, @b INT = 0;
    SELECT @a / @b;   -- Fuerza el error

    -- 2--Este código NO se ejecutará
    
    BEGIN TRANSACTION TransaccionReserva;
        INSERT INTO reserva (fecha_ingreso, fecha_salida, monto_total,
                             id_cliente, nro_habitacion, id_piso, id_pago)
        VALUES ('2025-12-20', '2025-12-22', 48000,
                1, 102, 1, 1);
    COMMIT TRANSACTION TransaccionReserva;

    COMMIT TRANSACTION TransaccionPrincipal;

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION TransaccionPrincipal;
    PRINT 'Se generó un error intencional. No se guardó ningún dato.';
END CATCH;

--verificar despues de error
SELECT * FROM cliente WHERE nombre = 'ErrorPrueba';

/** 3-conclusion**/
Las transacciones anidadas funcionan, pero la transacción principal es la que manda: si falla algo dentro, se revierte todo.
En la prueba sin error, se insertaron correctamente el cliente, la reserva y se actualizó la habitación.
En la prueba con error, ningún cambio quedó guardado, demostrando la atomicidad de la transacción (todo o nada).
TRY…CATCH permitió manejar el error sin que la base quede en un estado inconsistente.
SQL Server solo confirma realmente cuando se hace el COMMIT final de la transacción externa.







