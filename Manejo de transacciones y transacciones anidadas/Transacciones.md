Manejo de transacciones y transacciones anidadas.

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

Ventajas de las transacciones:

1-Atomicidad
La atomicidad significa que todas las operaciones que forman parte de una transacción se ejecutan por completo o no se ejecuta ninguna. En otras palabras, si algo falla en el proceso, la base de datos vuelve al estado original, como si nada hubiera pasado. Esto garantiza que los datos no queden a medio modificar ni se generen inconsistencias.

2-Consistencia
Este principio asegura que la base de datos siempre cumpla con todas las reglas y restricciones que tiene definidas. Cada transacción debe llevar la base de datos de un estado válido a otro también válido, manteniendo siempre la coherencia de los datos.

3-Aislamiento
El aislamiento permite que varias transacciones se ejecuten al mismo tiempo sin interferir entre sí. Así, cada una trabaja de forma independiente, evitando conflictos o errores cuando muchas personas o procesos acceden a la base de datos al mismo tiempo.

4-Durabilidad
Una vez que una transacción se confirma con un COMMIT, los cambios quedan guardados de manera permanente. Incluso si el sistema se apaga o falla después, los datos no se pierden. Esto hace que el sistema sea más confiable y seguro.

5-Manejo de errores y recuperación
Las transacciones también ayudan a manejar errores de forma más controlada. Si ocurre algún problema durante una operación, todo lo que se haya hecho hasta ese momento se revierte automáticamente, evitando que queden datos incorrectos o incompletos.

6-Mejora en la concurrencia y eficiencia
Permiten que varios usuarios trabajen al mismo tiempo sobre la base de datos sin causar bloqueos o conflictos. Gracias a esto, el sistema funciona de manera más fluida y con mejor rendimiento.

7-Seguridad y control en los cambios de datos
Por último, las transacciones aportan una capa extra de seguridad. Los cambios solo se aplican cuando la transacción se confirma (con el COMMIT), lo que evita modificaciones no deseadas y protege la información, especialmente cuando se trata de datos sensibles.




