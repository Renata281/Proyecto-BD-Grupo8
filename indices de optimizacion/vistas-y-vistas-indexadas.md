## Vistas y Vistas Indexadas 

Una vista es una tabla virtual creada mediante una consulta que define sus filas y columnas. A diferencia de las tablas físicas, una vista no almacena datos, sino que genera
dinámicamente los resultados de la consulta cada vez que se accede a ella. Puede utilizar datos de una o varias tablas e incluso de otras vistas en la misma o distintas bases de datos, 
permitiendo también consultas distribuidas para obtener datos de fuentes heterogéneas. Esto facilita la combinación de información, por ejemplo, consolidando datos similares de diferentes regiones.

Las vistas son útiles para simplificar y personalizar la percepción de la base de datos según el usuario y también actúan como un mecanismo de seguridad, permitiendo acceder a datos
específicos sin exponer las tablas subyacentes. Además, las vistas pueden emular tablas cuyo esquema ha cambiado, crear interfaces compatibles con versiones anteriores y mejorar 
el rendimiento mediante particiones de datos.

Mientras que una vista indexada, también llamada vista materializada, es una vista que sí almacena datos en disco mediante la creación de un índice clusterizado basado en la consulta que la define. A diferencia de las vistas tradicionales, que solo actúan como consultas almacenadas, las vistas indexadas retienen los datos en la base de datos, funcionando de manera similar a una tabla. Lo que puede mejorar significativamente el rendimiento en consultas complejas o con grandes volúmenes de datos. Además, se pueden crear índices no clusterizados sobre la vista indexada para mejorar aún más el rendimiento en consultas específicas.

Beneficios de la Vistas Indexadas:
1. Mejoran el rendimiento de las consultas al almacenar agregaciones, evitando cálculos costosos durante la ejecución.
2. Permiten almacenar combinaciones de tablas ya unidas (pre-join), facilitando el acceso a datos complejos de manera eficiente.
3. Las combinaciones de uniones y agregaciones pueden materializarse, optimizando la recuperación de datos. Contras de las vistas indexadas
4. Introducen un importante sobrecargo en la base de datos, ya que cualquier cambio en las tablas base debe reflejarse en la vista indexada, lo cual consume recursos.
5. Requieren mantenimiento adicional de los índices y estadísticas asociadas, incrementando el costo en términos de espacio y recursos.
6. Restricciones de uso: deben tener un índice único, solo permiten índices no clusterizados después de crear el índice clusterizado, y deben ser determinísticas (una sola salida posible para cada consulta).

Contras de las Vistas Indexadas:
1. Introduzca una sobrecarga significativa. Cualquier modificación ( INSERT, UPDATE, DELETE) en las tablas base obliga al sistema a actualizar también la vista indexada, consumiendo recursos.

2.	Requieren mantenimiento adicional de sus propios índices y estadísticas.

3.	Tienen restricciones de uso (por ejemplo, la consulta que las define debe ser determinística, es decir, siempre debe dar el mismo resultado para las mismas entradas).







