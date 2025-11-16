Manejo de transacción anidada:
¿Qué es una transacción anidada?

Una transacción anidada se refiere a una transacción que se ejecuta dentro de otra transacción principal que ya está activa.Es decir, se inicia una nueva transacción mientras otra aún no ha finalizado. 
En sistemas como SQL Server, cuando se utiliza el comando BEGIN TRANSACTION mientras hay una transacción en curso, lo que realmente ocurre es la creación de una transacción anidada.
Este tipo de transacciones resultan muy útiles en procesos complejos donde se realizan múltiples operaciones sobre la base de datos que dependen entre sí. 
Permiten dividir una tarea grande en partes más pequeñas, cada una con su propio control lógico, facilitando el manejo de errores y la organización del código.
En la práctica, solo la transacción más externa tiene el control total sobre los comandos COMMIT o ROLLBACK. 
Si dentro de una transacción interna se ejecuta un ROLLBACK, el sistema deshará todas las operaciones realizadas desde el primer BEGIN TRANSACTION, es decir, se revierte toda la transacción, no solo la parte interna.


