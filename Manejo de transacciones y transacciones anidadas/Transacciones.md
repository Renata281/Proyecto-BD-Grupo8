Manejo de transacciones.

¿Qué es una UNAT (Unidad de Transacción)?

Una UNAT o Unidad de Transacción es el conjunto de operaciones que se ejecutan como una unidad lógica e indivisible de trabajo dentro de una base de datos.
Esto significa que todas las instrucciones que conforman la transacción deben completarse con éxito para que los cambios se confirmen (sean permanentes), o de lo contrario, se revierten para mantener la integridad de la información.

En otras palabras, una transacción agrupa varias acciones SQL (como INSERT, UPDATE, DELETE) en un solo bloque de trabajo que cumple con el principio "todo o nada".

Caracteristicas principales:

Las UNATs garantizan que la base de datos permanezca consistente, íntegra y confiable, incluso ante fallos o errores durante la ejecución.
Toda transacción debe cumplir con las propiedades ACID, que son fundamentales en los sistemas de gestión de bases de datos:

1-Atomicidad:
Todas las operaciones dentro de la transacción se ejecutan completamente o no se ejecuta ninguna.
Si ocurre un error, se realiza un ROLLBACK que deja los datos como estaban antes.

2-Consistencia:
Una transacción debe llevar a la base de datos de un estado válido a otro, respetando reglas, claves y restricciones.

3-Aislamiento:
Cada transacción se ejecuta de manera independiente, sin afectar ni verse afectada por otras que estén ocurriendo al mismo tiempo.

4-Durabilidad:
Una vez confirmado el COMMIT, los cambios permanecen guardados incluso si ocurre una falla del sistema.

Modos de manejo de transacciones en SQL Server

SQL Server permite diferentes formas de trabajar con transacciones, según el grado de control que se necesite:

1-Transacciones de confirmación automática:
Cada instrucción individual (por ejemplo, un UPDATE o INSERT) se considera una transacción completa y se confirma automáticamente si no hay errores.

2-Transacciones explícitas o limpias:
El usuario controla el inicio y fin con las sentencias BEGIN TRANSACTION, COMMIT TRANSACTION y ROLLBACK TRANSACTION.
Este método brinda mayor seguridad porque permite validar los resultados antes de confirmar los cambios.

3-Transacciones implícitas:
El sistema inicia automáticamente una nueva transacción después de finalizar la anterior.
Sin embargo, el programador sigue siendo responsable de cerrarla con COMMIT o ROLLBACK.

4-Transacciones de ámbito de lote:
Se usan en sesiones con MARS (Multiple Active Result Sets).
Permiten que varias transacciones se gestionen en paralelo dentro del mismo lote de instrucciones.

*Instrucciones de transacción en SQL Server
-BEGIN TRANSACTION o BEGIN TRAN: Marca el inicio de una transacción.
-ROLLBACK TRANSACTION o ROLLBACK TRAN: Revierte la transacción en caso de error o para abandonarla.
-COMMIT TRANSACTION o COMMIT TRAN: Confirma el conjunto de operaciones, haciendo los datos definitivos.




