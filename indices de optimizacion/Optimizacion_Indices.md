## Vistas y vistas Indexadas

Los índices son esenciales para agilizar el rendimiento de las consultas en bases de datos. Sin un índice, el motor de la base de datos debe revisar la tabla por completo 
(un "full table scan") para encontrar un valor, un proceso muy ineficiente en tablas de gran volumen. Los índices funcionan como un directorio o puntero que permite localizar 
rápidamente las filas que cumplen con las condiciones de la cláusula WHERE, mejorando excesivamente el tiempo de respuesta.

Es vital ser estratégico al crear índices. Un exceso de ellos incrementa el uso de almacenamiento y puede ralentizar las operaciones de escritura (como INSERT, UPDATEy DELETE),
dado que cada índice afectado debe actualizarse. El objetivo es encontrar un equilibrio entre la aceleración de las lecturas y el costo de mantenimiento de las escrituras.

Existen diversos tipos de índices, cada uno con un propósito específico:

• Índices de clave primaria (PRIMARY KEY): Identifican de forma única cada fila y no permiten valores nulos.

• Índices de clave ajena (FOREIGN KEY): Referencian claves primarias en otras tablas.

• Índices únicos (UNIQUE): Garantizan la unicidad de los valores de una columna y pueden permitir valores nulos.

• Índices con valores repetidos (INDEX): Ideales para búsquedas en columnas con datos duplicados.

• Índices de múltiples columnas: Considere más de una columna para optimizar la búsqueda.

• Índices de texto completo (FULLTEXT INDEX): Usados ​​para búsquedas en campos de texto.

• Índices funcionales: A partir de MySQL 8.0.13, permiten indexar el resultado de expresiones o funciones.

• Índices agrupados (CLUSTERED INDEX): Organizan básicamente las filas de la tabla en el orden del índice. Solo puede haber un índice agrupado por tabla, y es ideal para columnas que se buscan o filtran de manera secuencial, como fechas o ID.

• Índices no agrupados (NON-CLUSTERED INDEX): Contienen una estructura separada que apunta a las ubicaciones de los datos en la tabla. Una tabla puede tener múltiples índices no agrupados.

• Índices filtrados: Se aplican a subconjuntos específicos de filas en una tabla, mejorando las consultas que buscan condiciones específicas.

• Índices espaciales (SPATIAL INDEX): Utilizados en bases de datos geoespaciales para manejar datos geográficos y realizar consultas espaciales.


En resumen, los índices deben aplicarse selectivamente para potenciar el rendimiento donde más se necesita, sin sobrecargar las operaciones diarias de la base de datos.
