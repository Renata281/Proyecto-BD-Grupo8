### Para verificar que la base de datos esta configurada en modo mixto, hay que realizar la siguiente consulta:

EXEC xp_instance_regread
  N'HKEY_LOCAL_MACHINE',
  N'Software\Microsoft\MSSQLServer\MSSQLServer',
  N'LoginMode';

- Si el valor que devuelve es 1: Solo pueden conectarse usuarios de Windows con permisos en el servidor

Para cambiarlo a modo mixto:
- Clic derecho en el servidor
- Presionar "propiedades"
- En el panel izquierdo presionar "seguridad"
- En el apartado de "Autenticación de servidor" presionar la opción "Modo de autenticación de Windows y SQL Server"
- Presionar "aceptar"
- reiniciar el servidor: En el menú "archivo", presionar "conectar explorador de objetos" y luego presionar "conectar".

 Luego de volver a verificar si esta configurada en modo mixto, este debe devolver el valor 2, significa que permite autenticación tanto con cuentas de Windows como con usuarios creados en SQL Server (por login y contraseña).
