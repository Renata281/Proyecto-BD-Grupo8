¿Qué es una transacción anidada?

Una transacción anidada se refiere a una transacción que se ejecuta dentro de otra transacción principal que ya está activa.Es decir, se inicia una nueva transacción mientras otra aún no ha finalizado. 
En sistemas como SQL Server, cuando se utiliza el comando BEGIN TRANSACTION mientras hay una transacción en curso, lo que realmente ocurre es la creación de una transacción anidada.
Este tipo de transacciones resultan muy útiles en procesos complejos donde se realizan múltiples operaciones sobre la base de datos que dependen entre sí. 
Permiten dividir una tarea grande en partes más pequeñas, cada una con su propio control lógico, facilitando el manejo de errores y la organización del código.
Sin embargo, es importante aclarar que SQL Server no implementa de forma completa las transacciones anidadas reales. 
En la práctica, solo la transacción más externa tiene el control total sobre los comandos COMMIT o ROLLBACK. 
Si dentro de una transacción interna se ejecuta un ROLLBACK, el sistema deshará todas las operaciones realizadas desde el primer BEGIN TRANSACTION, es decir, se revierte toda la transacción, no solo la parte interna.
Este comportamiento puede generar confusión, ya que da la impresión de que cada transacción interna es independiente, cuando en realidad todas las transacciones anidadas forman parte de un mismo contexto. 
Por eso, al trabajar con transacciones anidadas es recomendable llevar un control cuidadoso de los niveles de transacción y de los puntos de confirmación (SAVEPOINT) para evitar la pérdida total de los cambios en caso de errores.

