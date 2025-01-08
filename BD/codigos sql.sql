CREAR BASES DE DATOS 


CREATE DATA BASE PRUEBA = CREAR BASES DE DATOS 

SHOW DATABASES = MOSTRAR BASES DE  DATOS

SELECT PRUEBA(); = SELECCIONAR BASE DE DATOS 


CONSULTA 
SELECT NOMBRE,NUMERO 
FROM PERSONA1, TELEFONO1
WHERE PERSONA1.ID = TELEFONO1.ID


Crear tablas 
CREATE TABLE telefono1 ( numero char(12) NOT NULL, 
id int(11) DEFAULT NULL, 
KEY id (id), 
CONSTRAINT telefono1 FOREIGN KEY (id) REFERENCES persona1 (id) ON DELETE CASCADE ON UPDATE CASCADE 
) ENGINE=InnoDB 


INSERTAR TELEFONOS
Insert into  telefono2 (numero,ID) VALUES ('123456789',1);

Insertar persona y fecha 
Insert into values ('Pedro', '1974-04-12');

insert into persona values 
('Luisa','2000-12-02'),
('Ricardo' ,'1993-02-10');

insert into ciudad2 values ('San Quintin',DEFAULT);

insert into ciudad2 (poblacion,nombre) VALUES
(443807, 'Ensenada'),
(1049792, 'Mexicali'),
(108440, 'Tijuana'),
(1922523, 'Tecate');

Inserta into ciudad2 set nombre= ‘Playas de Rosarito’ , población =126890;
insert into ciudad2 (nombre,poblacion) values ('Ensenada' , 443807); 

Inserta into ciudad2 (nombre, población) valúes
(‘Ensenada’ , 9000000)
On duplicase key update  poblacion=values  (poblacion);

INSERT INTO ciudad2 (nombre, poblacion) VALUES (‘’Mexicali, 9100000)
ON DUPLICATE KEY UPDATE poblacion=poblacion; 

INSERT INTO ciudad2 (nombre, poblacion) VALUES (‘San ‘Quintin, 9100000)
ON DUPLICATE KEY UPDATE poblacion=0; 

REPLACE INTO ciudad2 (nombre, poblacion) VALUES 
(‘Mexicali’, 9200000),
(‘Ensenada’, 6000000); 
(‘San Quintin’, 6000000); 

SELECT * FROM ciudad2; 

BORRAR PERSONA
delete FROM PERSONA1 where id=2;

On delete Cascade 
On update 

Eliminar tablas 
DROP 


SELECT nombre, OFICINAREP, CONTRATO FROM repventas; = consulta especifica 
select nombre, cuota, ventas FROM repventas WHERE NUMEMP = 107; = consulta de columnas especificas 

SELECT AVG (ventas) from repventas; = consultar promedio de columnas 

SELECT nombre, cuota, ventas from repventas   = //consultas con cantidades especificas.
where ventas > 300000

SELECT ciudad, region, (ventas - objetivo) FROM oficinas;
SELECT ciudad, region, (ventas - objetivo) AS diferencia FROM oficinas;  // para asignar alias a la consulta 

SELECT nombre, cuota (cuota + (0.03 * cuota)) as 'aumento 3%' from repventas  // calcular porcentaje 

SELECT nombre, month (contrato)as 'mes' , year (contrato) as 'año'  from repventas 

SELECT concat (ciudad,' Tiene ventas de', ventas) from oficinas;   //concatenar columnas
SELECT concat (ciudad,' Tiene ventas de', ventas) as 'Reporte de ventas' from oficinas;    //concatenar y nombrar columna 

select DISTINCT region from oficinas  // select sin duplicar 
select region from oficinas // select normal 
SELECT NOMBRE, CUOTA, VENTAS FROM REPVENTAS  WHERE NUMEMP = 105 
SELECT NOMBRE FROM REPVENTAS WHERE YEAR (CONTRATO) < 1998 // SABER QUIENES CONTRATARON ANTES DE UNA FECHA 
SELECT CIUDAD, VENTAS, OBJETIVO FROM OFICINAS WHERE VENTAS<(OBJETIVO *0.75);    // SABER QUIENES SUPERAN OBJETIVOS 

SELECT CIUDAD, REGION FROM oficinas
WHERE REGION <>'OESTE' // BUSQUEDA DIFERENTE DE ALGUNA

SELECT EMPRESA, LIMITECREDITO FROM CLIENTES WHERE NUMCLIE = 2107 // PARA TRAER DATOS DE PERSONA O CLIENTE 
SELECT NOMBRE FROM REPVENTAS WHERE VENTAS >=CUOTA //  SABER QUIEN SUPERO SUS CUOTAS 
SELECT NUMPEDIDO,IMPORTE FROM pedidos WHERE IMPORTE BETWEEN 2000 AND 30000 // SABER CUALES PEDIDOS SON MAYORES Y MENORES A CANTIDADDES S
SELECT NOMBRE,CONTRATO FROM REPVENTAS WHERE CONTRATO BETWEEN ’1997-04-01 ‘ AND  ’1998-04-01’ // SABER QUIENES INGRESARON EN ALGUNA FECHA ESPECIFICA 
SELECT NOMBRE,VENTAS, CUOTA FROM repventas WHERE VENTAS NOT BETWEEN (0.75 * CUOTA) AND (1.50 * CUOTA); //SABER CUALES SUPERAN CANTIDADES 
SELECT NOMBRE, CUOTA, VENTAS FROM repventas WHERE OFICINAREP IN (11,13,22); // 
SELECT EMPRESA,LIMITECREDITO FROM clientes WHERE EMPRESA LIKE "IAN%"; // BUSCAR LO QUE EMPIEZA CON ESAS LETRAS 
SELECT EMPRESA,LIMITECREDITO FROM clientes WHERE EMPRESA LIKE "AC%"; // BUSCAR LO QUE EMPIEZA CON ESAS LETRAS 
SELECT EMPRESA,LIMITECREDITO FROM clientes WHERE EMPRESA LIKE "%SCHMIDT"; // BUSCAR LO QUE  TERMINA EMPIEZA CON ESAS LETRAS 
SELECT EMPRESA,LIMITECREDITO FROM clientes WHERE EMPRESA LIKE "%CORP."; // BUSCAR LO QUE  TERMINA EMPIEZA CON ESAS LETRAS 
SELECT EMPRESA,LIMITECREDITO FROM clientes WHERE EMPRESA LIKE "%SCH%"; // BUSCAR LO QUE  TERMINA EMPIEZA CON ESAS LETRAS 
SELECT NOMBRE FROM repventas WHERE OFICINAREP IS NULL; // PARA BUSCAR CON CAMPOS VACIOS 
SELECT NOMBRE FROM repventas WHERE OFICINAREP IS NOT NULL; // BUSQUEDA SIN CAMPOS NULOS 
SELECT NOMBRE, CUOTA, VENTAS FROM repventas WHERE VENTAS < CUOTA OR VENTAS <30000 // 
SELECT NOMBRE, CUOTA, VENTAS FROM repventas WHERE VENTAS < CUOTA AND VENTAS <150000;
SELECT NOMBRE, CUOTA, VENTAS FROM repventas WHERE VENTAS < CUOTA AND NOT  VENTAS >200000;
SELECT NOMBRE, CUOTA, VENTAS, CONTRATO FROM repventas WHERE (VENTAS > CUOTA AND YEAR (CONTRATO) >=1999) OR VENTAS <200000;
SELECT CIUDAD,REGION,VENTAS FROM OFICINAS ORDER BY REGION, CIUDAD; // ORDENAR POR COLUMNAS 
SELECT CIUDAD,REGION,VENTAS FROM OFICINAS ORDER BY VENTAS DESC; // ORDENAR POR CANTIDADES


select * from repventas, oficinas where oficinarep=oficina;
SELECT * from repventas inner JOIN oficinas on repventas.OFICINAREP = oficinas.OFICINA;
SELECT nombre, ciudad, region from repventas inner join oficinas on repventas.OFICINAREP=oficinas.OFICINA
SELECT nombre, ciudad,region FROM repventas, OFICINas where repventas.OFICINAREP=oficinas.OFICINA and objetivo >=60000;
SELECT titulo, concat(nombre, "" , apellido) as 'nombre del autor' from tblibro inner join tbautor on tblibro.idAutor=tbautor.idAutor;
SELECT titulo, concat(nombre, "" , apellido) as 'nombre del autor', tblibro.fechaCreacion from tblibro INNER join tbautor on tbautor.idAutor=tbautor.idAutor;
SELECT titulo, concat(nombre, "" , apellido) as 'nombre del autor', tblibro.fechaCreacion from tblibro INNER join tbautor on tbautor.idAutor =tblibro.idAutor;
SELECT concat(nombre, "" , apellido) as 'Nombre', tblibro_tbusuario.idLibro from tbusuario LEFT join tblibro_tbusuario on tblibro_tbusuario.idUsuario =tbusuario.idUsuario;
SELECT concat(nombre, "" , apellido) as 'Nombre', tblibro_tbusuario.idLibro from tbusuario LEFT join tblibro_tbusuario on tblibro_tbusuario.idUsuario =tbusuario.idUsuario where tblibro_tbusuario.idLibro is null;

SELECT concat(nombre, "" , apellido) as 'Nombre', tblibro_tbusuario.idLibro from tblibro_tbusuario RIGHT join tbusuario on tblibro_tbusuario.idUsuario =tbusuario.idUsuario;
SELECT DISTINCT concat(tbusuario.nombre,"", tbusuario.apellido) as usuario from tbusuario INNER join tblibro_tbusuario on tbusuario.idUsuario= tblibro_tbusuario.idUsuario and date(tblibro_tbusuario.fechaCreacion)= curdate() INNER JOIN tblibro on tblibro_tbusuario.idLibro= tblibro_tbusuario.idLibro;
SELECT DISTINCT concat(tbusuario.nombre,"", tbusuario.apellido) as usuario from tbusuario INNER join tblibro_tbusuario on tbusuario.idUsuario= tblibro_tbusuario.idUsuario and date(tblibro_tbusuario.fechaCreacion)= curdate() INNER JOIN tblibro on tblibro_tbusuario.idLibro= tblibro.idLibro;

SELECT tbusuario.idUsuario,concat(tbusuario.nombre,"", tbusuario.apellido) as "nombre del usuario", tblibro.idLibro, titulo, concat( tbautor.nombre,"") as "nombre del autor" from tbusuario INNER JOIN tblibro_tbusuario on tbusuario.idUsuario = tblibro_tbusuario.idUsuario inner join tblibro on tblibro_tbusuario.idLibro = tblibro.idLibro INNER JOIN tbautor on tblibro.idAutor=tbautor.idAutor;

PORCENTAJE QUE HAN TENIDO CON RELACION VENTAS OBJETIVO 

SELECT ciudad, ventas, objetivo, (ventas *(100 / objetivo)) as 'porcentaje' from oficinas;

SELECT ciudad, ventas, objetivo, (ventas *100 /objetivo)AS 'PORCENTAJE','%' from oficinas;

SELECT concat (nombre,apellido)
as "Nombre completo"
from tbAutor
UNION
SELECT concat (Nombre,apellido)
FROM tbusuario

SELECT concat (nombre,apellido)
as "Nombre completo", "" as correo
from tbAutor
UNION
SELECT concat (Nombre,apellido),email
FROM tbusuario;

SELECT concat (nombre,apellido)
as "Nombre completo", "" as correo,paisOrigen
as "pais origen"
from tbAutor
UNION
SELECT concat (Nombre,apellido),email,""
FROM tbusuario;

SELECT idlibro, titulo FROM tblibro LIMIT 10;

SELECT idlibro, titulo 
FROM tblibro WHERE idAutor=2
LIMIT 50;

SELECT idlibro, titulo 
FROM tblibro 
LIMIT 10,5; primer numero partir de ese y el segundo libro la cantidad a mostrar 

SELECT count(seudonimo) as total 
FROM tbautor;

SELECT sum(ventas) FROM tblibro;

SELECT MIN(ventas) 

FROM tblibro
WHERE idAutor=3;

SELECT AVG(ventas) 

FROM tblibro
WHERE idAutor=3;

Count 
Sum 
Min
Max
Avg

SELECT idautor, sum(ventas)
FROM tblibro
GROUP by idautor;

SELECT idautor, sum(ventas) as total

FROM tblibro
GROUP by idautor
ORDER by total
LIMIT 1;

SELECT titulo, MAX(ventas) as total 
from tblibro 

GROUP by titulo 
order by total DESC
limit 10;

SELECT titulo, MIN(ventas) as total 
from tblibro 

GROUP by titulo 
order by total 
limit 5;

SELECT idautor, SUM(ventas)as total 
FROM tblibro
GROUP by idautor
HAVING total >1500;




Vist. previaVist. previa3:37Mostrar/Ocultar Texto - Contraseña - C# Windows Forms | no ...YouTube · JnGProyectos3 minutos y 37 segundos29 dic 2021

SELECT tbLibro.titulo, tbLibro_tbUsuario.fechaCreacion
FROM tbLibro
INNER JOIN tbLibro_tbUsuario
on tbLibro.titulo= tbLibro_tbUsuario.idUsuario
WHERE idLibro=fechaCreacion



--//ADMINISTRACIÓN DE BASE DE DATOS--//

--Crear Variables 
SET@var1=5;
SET@var2='Hola';
SET@var3=true;


--Seleccionar variables 
SELECT @var1,@var2,@var3;

--Ordenar concatenar. 
SELECT concat (nombre,'',apellido) as 'NOMBRE AUTOR' from tbautor;

Cuenta los caracteres de las comillas.
Select length (‘Hola Mundo’)

--Slecciona nombres mayor a 7 letras 
SELECT * FROM tbautor
WHERE length (Nombre)>7;

--Para mayusculas o minúsculas
SELECT upper (nombre),Lower (Nombre)
FROM tbautor

--Respeta espacios en blanco 
SELECT("    hola    ");

--Elimina espacios en blanco 
SELECT trim("    hola    ");

--Buscar libros con los primeros 12 caracteres relacionados con Harry Potter 
SELECT*FROM tblibro
WHERE LEFT(titulo,12)='Harry Potter';

--Buscar libros con los últimos 6 caracteres relacionados con anillo  
SELECT*FROM tblibro
WHERE RIGHT(titulo,6)='anillo';

--Numeros random float 
SELECT rand ();

--Numero random entero
SELECT Round(rand()*100);

--Trunca números a 3 caracteres
SELECT TRUNCATE(1.23456789,3);

--Trunca números redondeados 
SELECT TRUNCATE(rand()*100,2);

--Elevar a la potencia 
SELECT pow (2,16);

--Traer fecha con hora real 
SELECT now();
SET @fecha=now();
SELECT @fecha;

--Sleccion  de fecha y hora en tabla con columna. 
SELECT now();
SET @fecha=now();
SELECT second(@fecha),
minute(@fecha),
hour(@fecha),
day(@fecha),
month(@fecha),
year(@fecha);


--Selección de fecha en tabla ordenado por dia,mes,año 
SELECT now();
SET @fecha=now();
SELECT dayofweek(@fecha),
dayofmonth(@fecha),
dayofyear(@fecha);

--Seleccionar fecha y hora en tiempo real  3 formas 
SELECT now(), CURRENT_TIMESTAMP(),
curdate();


--Seleccionar la hora dos formas 
SELECT  CURRENT_TIME(),curtime();



SELECT  CURRENT_TIME(),curtime(); 
SELECT now(),
CURRENT_TIMESTAMP(),
curdate();

--Seleccionar usuario 
SELECT CURRENT_USER;


--//Mostrar fecha con tiempo adelante// 
SET @fecha=now();
SELECT @fecha, @fecha +INTERVAL 30 DAY

--//Para mostrar números mayor o menor//
SELECT IF (10>9, "El numero es mayo", "El numero es meno");
SELECT IF (9>10, "El numero es mayo", "El numero es menor");

--// Selecciona los libros que no tienen paginas de los libros//
SELECT Titulo, if (paginas =0, "El no tiene paginas", paginas) from tblibro;

--//Selecciona libros con paginas mayoes a 10 y muestra los que no tienen//
update tblibro set paginas =10 WHERE idLibro > 20;
SELECT TITULO, if(paginas = 0, "El libro no tiene paginas", paginas) FROM tblibro;

--//Selecciona los autores que tienen seudonimo//
SELECT NOMBRE, IFNULL(seudonimo, "El autor no cuenta con un seudonimo")FROM tbautor;

--//Delimitador sentencias//
CREATE FUNCTION agregardias(fecha DATE, dias INT)
RETURNS DATE 
BEGIN
RETURN fecha + INTERVAL dias DAY; END//
 //Cambiar DELIMITER //
 
 --//Mostrar fecha con tiempo adelante//
SET @fecha-curdate();
SELECT @fecha, agregar dias (@fecha,60);

--//selecciona el nombre con su funcion//--
SELECT name FROM mysql.proc WHERE type = 'FUNCTION';

--Muestra estado de la funcion// 
show FUNCTION status;

--Muestra una rutina//
SELECT routine_definition FROM information_schema.routines WHERE specific_name = 'agregardias';

--Eliminar funcion//
DROP FUNCTION agregardias;

--Se crea la funion obtener paginas con numeros ramdom// 
DELIMITER //
 CREATE FUNCTION obtenerpaginas()
 RETURNS INT 
 BEGIN
 SET @paginas=(SELECT (ROUND(RAND()*100)*4));
 RETURN @paginas;
 END//
 DELIMITER ;
 
 -- Actualiza los numeros de paginas a numeros ramdom 
 UPDATE tblibro set paginas=obtenerpaginas();
 
 --Se crea la funion obtener ventas con numeros ramdom// 
DELIMITER //
 CREATE FUNCTION obtenerventas()
 RETURNS INT 
 BEGIN
 SET @ventas=(SELECT (ROUND(RAND()*100)*6));
 RETURN @ventas;
 END//
 DELIMITER ;
 
 -- Actualiza los numeros de ventas a numeros ramdom 
 UPDATE tblibro set ventas=obtenerpaginas();
 
 --//Restar dias a la fecha de creacio--//
DELIMITER //
CREATE FUNCTION restardias()
RETURNS DATE 
BEGIN
SET @fechaCreacion=curdate();
RETURN @fechaCreacion-INTERVAL (SELECT (ROUND(RAND()*100))) DAY;
END//
DELIMITER ;
--//Actualizar los datos de la tabla--//
UPDATE tblibro set fechaCreacion=restardias();


 --//Restar dias a la fecha de creacio--FUNCIONA--//
DELIMITER //
CREATE FUNCTION restarDias()
RETURNS DATE 
BEGIN
     SET @fecha=curdate();
     RETURN @fecha - INTERVAL (SELECT (ROUND(RAND()*1000))) DAY;
END//
DELIMITER ;

UPDATE tblibro set fechaCreacion=restardias();

--FECHA 29 de octubre--

--//Busqueda con palabra clave--//
SELECT * FROM tblibro WHERE TITULO LIKE 'HARRY%';
SELECT * FROM tblibro WHERE TITULO LIKE '%POTTER%';
SELECT * FROM tblibro WHERE TITULO LIKE '%ANILLO';

--//busqueda con caracteres especificos--// 
SELECT * FROM tblibro WHERE TITULO LIKE '_____';
SELECT * FROM tblibro WHERE TITULO LIKE '__b__';
SELECT * FROM tblibro WHERE TITULO LIKE '_a%';
SELECT * FROM tblibro WHERE TITULO LIKE '_a__o%';

--//Busqueda con letras especificas--// 
SELECT idAutor, titulo FROM tblibro WHERE Titulo LIKE 'H%' OR titulo LIKE 'L%';
SELECT idAutor, titulo FROM tblibro WHERE Titulo REGEXP '^[HL]';

--Busqueda que no inicie con las letras de los corchetes--//
SELECT idAutor, titulo FROM tblibro WHERE Titulo REGEXP '^[^HL]';

--//Buscar con la palabra que este dentro de las comillas--// 
SELECT idAutor, titulo FROM tblibro WHERE Titulo RLIKE 'JUEGO';
SELECT idAutor, titulo FROM tblibro WHERE Titulo RLIKE 'JUEGO*';

--//Busqueda con los primeros tres numeros de la fecha--//
SELECT * FROM tblibro WHERE fechaPublicacion REGEXP '201';

--Busqueda con letras del corchete en el seudonimo--
SELECT * FROM tbAutor WHERE seudonimo RLIKE '[AZ]';

--Busqueda con titulos que tengan numeros del 0-9--
SELECT * FROM tblibro WHERE titulo REGEXP '[0-9]';

SELECT * FROM tbAutor WHERE seudonimo RLIKE '[1-9]';

--Buscar ordenada por apellido,nombre,titulo,desendienten--
SELECT apellido,nombre,titulo FROM tbAutor,tblibro
ORDER by apellido ASC,titulo DESC;
SELECT titulo FROM tbLibro ORDER by titulo;
SELECT titulo FROM tbLibro ORDER by titulo DESC;

--Buscar con limite de 10 --
SELECT idlibro,titulo FROM tblibro limit 10;

--buscr por id por titulo con id limitado a 5--
SELECT idlibro,titulo FROM tblibro 
WHERE idAutor=2 limit 5;

--Buscar libros por id por titulo y limitar a 10 pero apartir del 5--
SELECT idlibro,titulo FROM tblibro limit 10,5;


--Buscar con contador--
SELECT count(*) AS total from  tbautor;
SELECT count(NOMBRE) AS total from  tbautor;

SELECT count(seudonimo) AS total from  tbautor
WHERE seudonimo is not null ;

SELECT count(seudonimo) AS total from  tbautor
WHERE seudonimo is null ;

--Saber ventas del mes--
SELECT SUM(VENTAS) FROM tblibro;
--Saber ventas de una persona-- 
SELECT SUM(VENTAS) FROM tblibro WHERE idAutor=3;

--Buscar ventas maximas de libro y de autor--
SELECT titulo, MAX(Ventas) FROM tblibro; 
SELECT titulo, MAX(Ventas) FROM tblibro WHERE idAutor=3;

--Buscar ventas minimas--
 SELECT titulo, MIN(Ventas) FROM tblibro; 
 SELECT titulo, MIN(Ventas) FROM tblibro WHERE idAutor=3;
 
 --Buscar promedio de ventas--
 SELECT titulo, AVG(Ventas) FROM tblibro; 
 SELECT titulo, AVG(Ventas) FROM tblibro WHERE idAutor=3;
 
 --Saber que vendedor vendio mas ordenando a todos--
 SELECT idAutor, sum(VENTAS)FROM tblibro GROUP by idAutor;
 
 --Saber quien vendio mas ordenado desendiente---
 SELECT idAutor, sum(VENTAS) AS total FROM tblibro GROUP by idAutor ORDER by total DESC limit 1; 

--Saber que libro se vendio mas ordenado y limitado a 10-- 
 SELECT titulo, MAX(VENTAS) AS total FROM tblibro GROUP by titulo ORDER by total DESC limit 10; 
 
 --Saber minimo de ventas ordenado y limitado a 5--
  SELECT titulo, MIN(VENTAS) AS total FROM tblibro GROUP by titulo ORDER by total  limit 5;
  
 --Saber suma de ventas arriba de una cantidad-- 
select idAutor, sum(ventas) as total FROM tblibro GROUP by idAutor HAVING total>1500;

-- Saber promedio de ventas--
SELECT AVG(ventas) from tblibro;

--Saber promedio de ventas agrupado por autor que sea mayor a 200--
SELECT idAutor FROM tblibro GROUP by idAutor HAVING SUM(ventas)>200

--saber promedio con variable-- 
SET @promedio= (SELECT avg(ventas) FROM tblibro);
SELECT idAutor from tblibro GROUP by idAutor
HAVING sum(ventas)>@promedio;

--saber ventas con subconsulta--
SELECT idAutor from tblibro GROUP by idAutor
HAVING sum(ventas) > (SELECT avg(ventas) FROM tblibro);

--Saber nombre apellido de promedios--
SELECT CONCAT(nombre," ",apellido) from tbautor WHERE idAutor in(SELECT idAutor from tblibro GROUP by idAutor
HAVING sum(ventas) > (SELECT avg(ventas) FROM tblibro));

SELECT COUNT(seudonimo) 'Con seudonimo', COUNT(seudonimo) - COUNT(seudonimo) 'Sin seudonimo'
FROM tbautor;

SELECT titulo, if(stock =5, 'disponible', stock)  FROM tblibro WHERE idLibro=1;

SELECT titulo,fechaPublicacion FROM tblibro WHERE fechaPublicacion  BETWEEN '2000-01-01' AND '2005-01-01';

--05 de Noviembre de 2022--

--/Revisar disponibilidad de libros o archivos/--
SELECT IF( EXISTS (SELECT idlibro from tblibro where titulo = 'El hobbit'), 'Disponible','No Disponible') AS Mensaje;
 
 --/Obtener la edad de los autores, si no cumple anios aun le resta uno/--
 SELECT nombre, apellido,fechaNacimiento, YEAR(curdate())-YEAR(fechaNacimiento) + if(DATE_format(curdate(),'%m-%d')> date_format(fechaNacimiento,'%m-%d'),0,-1)
 AS Edad FROM tbAutor;
 
-- OBTENER CANTIDAD PRESTADA POR USUARIO
CREATE OR REPLACE VIEW vwPrestamosUsuarios AS
SELECT
  TBUSUARIO.IDUSUARIO,
  TBUSUARIO.nombre,
  TBUSUARIO.apellido,
  TBUSUARIO.email,
  TBUSUARIO.username,
  COUNT(TBUSUARIO.IDUSUARIO) AS "TOTAL DE PRESTAMOS" 
FROM TBUSUARIO
INNER JOIN TBLIBRO_TBUSUARIO ON TBUSUARIO.IDUSUARIO = TBLIBRO_TBUSUARIO.IDUSUARIO
	AND tblibro_tbusuario.fechaCreacion>= CURDATE() - INTERVAL 5 DAY
GROUP BY TBUSUARIO.IDUSUARIO 

--/Insertar nuevo usuario a la tabla de usuarios/--
INSERT INTO `tblibro_tbusuario` (`idLibro`, `idUsuario`, `fechaCreacion`) VALUES
(33, 2, '2022-11-04 17:58:23');

--// 12 de noviembre//--

-- Funcion prestamo de libro y resta el prestamo--
DELIMITER //
CREATE PROCEDURE spPrestamo(IDUSUARIO INT, IDLIBRO INT) -- parametros 
BEGIN
INSERT INTO tblibro_tbusuario(IDLIBRO,IDUSUARIO) VALUES(IDLIBRO,IDUSUARIO);
UPDATE tblibro SET STOCK=STOCK - 1 WHERE TBLIBRO.idLibro=IDLIBRO;
END //
DELIMITER ; 

-- Ejecutar la funcion--
SHOW PROCEDURE STATUS; --Muestra la tabla de prestamos-- 
call spPrestamo(3,20);-- ejecuta el prestamo de libro--
SELECT * FROM tblibro WHERE idLibro=20; --consulta para ver stock de libro--
SELECT * from tblibro_tbusuario; --select para consultar prestamos-- 

--Procedimiento 2-- 
DELIMITER //
CREATE PROCEDURE spPrestamo2(IDUSUARIO INT, IDLIBRO INT, out cantidad int) --con out indicas que muestre el contenido de cantidad--
BEGIN
INSERT INTO tblibro_tbusuario(IDLIBRO,IDUSUARIO) VALUES(IDLIBRO,IDUSUARIO);
UPDATE tblibro SET STOCK=STOCK-1 WHERE TBLIBRO.idLibro=IDLIBRO;
set cantidad = (SELECT stock from tblibro WHERE tblibro.idlibro =idlibro);
END //
DELIMITER ;

set @cantidad = -1; 
call spPrestamo2(3,20,@cantidad);
SELECT @cantidad; 

-- SOLO SE VAN A PODER HACER PRESTAMOS CUANDO EL STOCK SEA MAYORO A 0
DELIMITER //
CREATE PROCEDURE spPrestamo3(IDUSUARIO INT, IDLIBRO INT, OUT CANTIDAD INT) -- CON OUT INDICAS QUE MUESTRE EL CONTENIDO DE CANTDAD
BEGIN
 SET CANTIDAD =(SELECT STOCK FROM TBLIBRO  WHERE TBLIBRO.IDLIBRO = IDLIBRO);
 IF CANTIDAD > 0 THEN
	INSERT INTO TBLIBRO_TBUSUARIO(IDLIBRO, IDUSUARIO) VALUES (IDLIBRO, IDUSUARIO);
	UPDATE TBLIBRO SET STOCK=STOCK - 1 WHERE TBLIBRO.IDLIBRO = IDLIBRO;
	SET CANTIDAD = CANTIDAD -1;
 ELSE
	SELECT "LIBRO NO DISPONIBLE" AS "MENSAJE DE ERROR";
  END IF;
 END //
DELIMITER ;

-- ACTUALIZACION EL STOCK PARA QUE NOS MARQUE EL MENSAJE DE ERROR Y EJECUTAMOS EL PROCEDIMIENTO--
UPDATE TBLIBRO SET STOCK=0 WHERE TBLIBRO.IDLIBRO = 20;
--ejecutar el procedimiento
SET @CANTIDAD = -1;
CALL spPrestamo3(3,20,@CANTIDAD);
SELECT @CANTIDAD;

-- CASE O MENUS
-- DEPENDIENDO CUANTOS LIBROS HAYA PRESTADO EL USUARIO, LE MOSTRARA DIFERENTES MENSAJES
DELIMITER //
CREATE PROCEDURE spTipoLector(IDUSUARIO INT)
BEGIN
  SET @CANTIDAD = (SELECT COUNT(*) FROM TBLIBRO_TBUSUARIO
                   WHERE TBLIBRO_TBUSUARIO.IDUSUARIO = IDUSUARIO);
  CASE
    WHEN @CANTIDAD > 20 THEN
      SELECT "FANATICO" AS MENSAJE;
    WHEN @CANTIDAD > 10 AND @CANTIDAD < 20 THEN
      SELECT "AFICIONADO" AS MENSAJE;
    WHEN @CANTIDAD > 5 AND @CANTIDAD < 10 THEN
      SELECT "PROMEDIO" AS MENSAJE;
    ELSE
      SELECT "NUEVO" AS MENSAJE;
  END CASE;
END //
DELIMITER ;

--LLAMA EL PROCEDIMIENTO CON EL USUARIO 1, Y CON EL USUARIO 3
CALL spTipoLector(1);
CALL spTipoLector(2);
CALL spTipoLector(3);
CALL spTipoLector(4);

-- CREAR UN TRIGGER PARA INSERTAR
-- INSERTA UN REGISTRO EN LA TABLA TBLIBRO_TBUSUARIO Y RESTA 1 EL STOCK DE TBLIBRO
DELIMITER //
CREATE TRIGGER DESPUESINSERTACTUALIZACIONLIBROS -- NOMBRE DEL TRIGGER
AFTER INSERT ON TBLIBRO -- DEFINIMOS CUANDO, QUE Y DONDE 
FOR EACH ROW -- QUE HACER EN CADA REGISTRO AFECTADO, SE EJECUTA CUANDO SE ACTIVA EL TRIGGER
BEGIN
  UPDATE TBAUTOR SET CANTIDADLIBRO = CANTIDADLIBRO + 1 WHERE IDAUTOR = NEW.IDAUTOR;
  -- NEW HACE REFERENCIA AL REGISTRO ACTUAL RECIEN INSERTADO
END //
DELIMITER ;

-- INSERTAR LIBRO PARA QUE SE ACTUALICE LA CANTIDAD EN AUTORES
INSERT INTO TBLIBRO(IDAUTOR, TITULO, FECHAPUBLICACION)
VALUES (1, 'AREA 81', '2011-07-01');
SELECT * FROM TBAUTOR WHERE IDAUTOR=1;

INSERT INTO TBLIBRO(IDAUTOR, TITULO, FECHAPUBLICACION)
VALUES (1, 'EL MISTERIO DE SALEMS LOT', '1975-01-01');
SELECT * FROM TBAUTOR WHERE IDAUTOR=1;

-- CREAR UN TRIGGER PARA ELIMINAR
-- DISMINUYE EN 1 LA CANTIDADLIBRO DE TBAUTOR CUANDO SE ELIMINE UN LIBRO
DELIMITER //
CREATE TRIGGER DESPUESDELETEACTUALIZACIONLIBROS
AFTER DELETE ON TBLIBRO
FOR EACH ROW
BEGIN
  UPDATE TBAUTOR SET CANTIDADLIBRO = CANTIDADLIBRO - 1 WHERE IDAUTOR = OLD.IDAUTOR;
  -- HACE REFERENCIA AL REGISTRO ELIMINADO
END //
DELIMITER ;

-- ELIMINAR LIBRO PARA QUE SE ACTUALICE LA CANTIDAD EN AUTORES
DELETE FROM TBLIBRO WHERE IDLIBRO=57;
SELECT * FROM TBAUTOR WHERE IDAUTOR=1;

-- CREAR UN TRIGGER PARA ACTUALIZAR
-- SI EL LIBRO MODIFICA SU AUTOR, SE MODIFICA LA CANTIDAD DE LIBROS EN LOS AUTORES MODIFICADOS
DELIMITER //
CREATE TRIGGER DESPUESUPDATEACTUALIZACIONLIBROS
AFTER UPDATE ON TBLIBRO
FOR EACH ROW
BEGIN
  IF (NEW.IDAUTOR != OLD.IDAUTOR) THEN -- SI HUBO CAMBIO EN LA COLUMNA

    UPDATE TBAUTOR SET CANTIDADLIBRO = CANTIDADLIBRO - 1 WHERE IDAUTOR = OLD.IDAUTOR;
    UPDATE TBAUTOR SET CANTIDADLIBRO = CANTIDADLIBRO + 1 WHERE IDAUTOR = NEW.IDAUTOR;
  END IF;
END//
DELIMITER ;

-- ACTUALIZAR AUTOR DEL LIBRO PARA QUE SE ACTUALICEN LAS CANTIDADES EN AUTORES
-- EL LIBRO 62 CAMBIA EL AUTOR 1 AL AUTOR 2
SELECT * FROM TBAUTOR;
UPDATE TBLIBRO SET IDAUTOR=2 WHERE IDLIBRO=56;
SELECT * FROM TBAUTOR;
UPDATE TBLIBRO SET IDAUTOR=2 WHERE IDLIBRO=55;
SELECT * FROM TBAUTOR;

-- ACTUALIZAR OTRO CAMPO QUE NO SEA IDAUTOR
UPDATE TBLIBRO SET TITULO="NUEVO TITULO" WHERE IDLIBRO=55;
SELECT * FROM TBAUTOR;

--19 de noviembre 2022-- 
--insertar libro presta y descuenta asignando a usuario-- 
START TRANSACTION;
SET @idlibro=10, @idusuario=1;

UPDATE tblibro set stock = stock - 1 WHERE idlibro=10;
SELECT stock from tblibro where idlibro=10;

insert into tblibro_tbusuario(idlibro,idusuario)
values (@idlibro, @idusuario);
SELECT * from tblibro_tbusuario;

COMMIT;

-- Insertar prestamos marcando error si no se jecuta correctamente-- 
create PROCEDURE spPrestamo4(idlibro int, idusuario int)
BEGIN
DECLARE exit handler for sqlexception 
BEGIN
 ROLLBACK;
 SELECT "Error";
 end;
 
 START TRANSACTION;
 insert into tblibro_tbusuario(idlibro,idusuario) values (idlibro,idUsuario);
 UPDATE tblibro set stock = stock - 1 WHERE tblibro.idlibro = idlibro;
 COMMIT;
 end// 
--Hacer prestamo--
call spPrestamo4(10,1);
--Consultar tablas despues del prestamo--
SELECT stock from tblibro where idlibro=10;
SELECT * from tblibro_tbusuario;

--
create PROCEDURE spPrestamo5(idlibro int, idusuario int)
BEGIN
DECLARE exit handler for sqlexception 
BEGIN
 ROLLBACK;
 SELECT "Error";
 end;
 
 START TRANSACTION;
 UPDATE tblibro set stock = stock - 1 WHERE tblibro.idlibro = idlibro;
 insert into tblibro_tbusuario(idlibro,idusuario) values (idlibro,idUsuario);
 
 COMMIT;
 end// 
 --Hacer prestamo--
call spPrestamo5(1,1);
--Consultar tablas despues del prestamo--
SELECT stock from tblibro where idlibro=1;
SELECT * from tblibro_tbusuario;


--U3 EXAMEN 

DELIMITER //
CREATE PROCEDURE consulta(stock INT, OUT CANTIDAD INT)
BEGIN
 SET CANTIDAD =(SELECT stock FROM TBLIBRO  WHERE stock >20);
SELECT titulo,stock from tblibro WHERE stock >20;
SELECT nombre from tbautor WHERE stock>20;
 END //
DELIMITER ;

PROCEDIMIENTO ALMACENADO PARA CONSULTAR STOCK MAYOR A 20
DELIMITER //
CREATE PROCEDURE spStock()
BEGIN
SELECT CONCAT(tbautor.nombre,' ',tbautor.apellido) AS Autor, titulo, stock FROM tblibro
INNER JOIN tbautor ON tblibro.idAutor=tbautor.idAutor
WHERE stock > 20;
END //
DELIMITER ;

CALL spStock();


DELIMITER //
CREATE TRIGGER spPrestamo7
AFTER UPDATE ON TBLIBRO
FOR EACH ROW
BEGIN
  IF (NEW.IDAUTOR != OLD.IDAUTOR) THEN -- SI HUBO CAMBIO EN LA COLUMNA

    UPDATE TBAUTOR SET CANTIDADLIBRO = CANTIDADLIBRO - 1 WHERE IDAUTOR = OLD.IDAUTOR;
ELSE
	SELECT "LIBRO AGOTADO" AS "MENSAJE";
  END IF;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER sPprestamoLibro
AFTER DELETE ON TBLIBRO
FOR EACH ROW
BEGIN
  UPDATE TBAUTOR SET CANTIDADLIBRO = CANTIDADLIBRO - 1 WHERE IDAUTOR = OLD.IDAUTOR;
 SELECT "LIBRO AGOTADO" AS "MENSAJE";
END //
DELIMITER ;

--
DELIMITER //
CREATE PROCEDURE spPrestamoL(IDUSUARIO INT, IDLIBRO INT)
BEGIN
INSERT INTO TBLIBRO_TBUSUARIO(IDLIBRO, IDUSUARIO) VALUES (IDLIBRO, IDUSUARIO);
END //
DELIMITER ;
--

DELIMITER //
CREATE TRIGGER sPrestamoLibro
AFTER INSERT ON tblibro_tbusuario FOR EACH ROW
BEGIN
UPDATE tblibro SET stock=stock - 1
WHERE idLibro = NEW.idLibro;
END //
DELIMITER ;

--
CALL spPrestamo(2,2);
select * from tblibro_tbusuario;


CREATE OR REPLACE VIEW vwLibros AS
SELECT
  TBLIBRO.TITULO,
  TBAUTOR.nombre,
  COUNT(TBlibro.Idlibro) AS "No prestados" 
FROM TBLIBRO
INNER JOIN TBLIBRO_TAutor ON TBautor.IDautor = TBLIBRO_TBUSUARIO.IDUSUARIO
	AND tblibro_tbusuario.fechaCreacion>= CURDATE() - INTERVAL 1 DAY
GROUP BY tbautor.idautor 


--- libros no prestados--
CREATE OR REPLACE VIEW vwLibros AS
SELECT
    tblibro.idAutor as IDAutor,
    tblibro.titulo AS Titulos,
    COUNT(tblibro_tbusuario.idusuario) AS Total
FROM tblibro
LEFT JOIN tblibro_tbusuario ON tblibro_tbusuario.idlibro = tblibro.idLibro
WHERE  tblibro_tbusuario.idUsuario IS NULL
GROUP BY tblibro.idLibro;

---
DELIMITER //
CREATE PROCEDURE disponible()
BEGIN
SELECT CONCAT(tbautor.nombre) AS Autor, titulo, stock FROM tblibro
INNER JOIN tbautor ON tblibro.idLibro=tbautor.idAutor
WHERE stock > 20;
END //
DELIMITER ;


--26 de noviembre--
--crear usuario con todos los privilegios--
grant all PRIVILEGES on *.* to 'usuario'@'localhost';

--Actualizar privilegios--
FLUSH PRIVILEGES;


--PRIVILEGIOS PARA ADMINISTRADORES--
ALL PRIVILEGES 
CREATE 
DROP
DELETE
INSERT
SELECT
UPDATE

--PERMISOS ESPECIFICOS A USUARIOS SELECCIONAR O CONSULTAR--
GRANT SELECT ON DBLIBRERIA.TBUSUARIO TO USUARIO1@LOCALHOST;
--PERMISOS ESPECIFICOS A USUARIOS INSERTER--
GRANT INSERT ON DBLIBRERIA.TBUSUARIO TO USUARIO1@LOCALHOST;
--REVOCAR PERMISOS--
REVOKE INSERT ON DBLIBRERIA.TBUSUARIO FROM USUARIO1@LOCALHOST;
REVOKE ALL PRIVILEGES ON `dblibreria`.* FROM 'usuario1'@'localhost'; GRANT SELECT ON `dblibreria`.* TO 'usuario1'@'localhost';
REVOKE ALL PRIVILEGES ON `dblibreria`.* FROM 'usuario1'@'localhost'; GRANT USAGE ON `dblibreria`.* TO 'usuario1'@'localhost';
--ELIMINAR USUARIO--
DROP USER 'USUARIO1'@'LOCALHOST';

--PERMISOS SELECCIONAR E INSERTAR--
GRANT SELECT, INSERT ON `dblibreria`.* TO 'usuario'@'localhost';


-- Crear bitacoras--

C:\xampp\bitacoras

--iniciar mysql desde cmd--
mysql -h localhost -u root -p

--mostrar bases de datos desde cmd-- 
show databases;
use dblibreria;

--crear archivo txt de logs--
TEE C:\xampp\bitacoras\20221210.txt

--
#muestra los datos de la tabla libros 
SELECT * FROM tblibro;
insert into tblibro_tbusuario (idLibro,idUsuario,fechaCreacion) VALUES('7','4',CURRENT_TIMESTAMP());


CREATE VIEW registo_pago AS
SELECT pago_cliente.placa AS "Placa", clientes.Tipo_pago AS "Tipo de pago", entrada.cajon as "Lugar Asignado",ti
FROM entrada, clientes, pago_cliente;



--Vista--
CREATE VIEW registo_pago AS
SELECT entrada.placa AS "Placa", clientes.Tipo_pago AS "Tipo de pago",entrada.Tipo as "Tipo de Vehiculo", pago_cliente.Pago as "Cuota de Pago"
FROM entrada, clientes, pago_cliente;

SELECT * FROM registo_pago

--Funciones fecha--
DELIMITER //
CREATE FUNCTION in_fecha()
RETURNS DATE
BEGIN
	SET @FECHA=CURRENT_DATE();
	RETURN @fecha;
END //
DELIMITER ;

SELECT fecha() AS fecha;

--Funcion para asignar cajon de estacionamiento--
DELIMITER //
CREATE FUNCTION Cajon_aleator()
RETURNS INT
BEGIN
SET @cajon=(SELECT(ROUND(RAND()*100)* 6));
RETURN @cajon;
END//
DELIMITER ;

SELECT Cajon_aleator() AS 'Estacionamiento #';

-- 
--Procedimiento para insertar--
DELIMITER //
CREATE PROCEDURE insertar_entrada(in Fecha varchar(10), in placa varchar(30), in Cajon INT, in Tipo varchar(10),in Tipo_pago varchar(10), in Hora_e time, in Hora_salida time,in  Tiempo varchar(10),in Total Varchar(10))
BEGIN
INSERT INTO entrada (Fecha,Placa,Cajon,Tipo,Tipo_pago,Hora_e,Hora_salida,Tiempo,Total)
VALUES (in_fecha(),placa,Cajon,Tipo_pago,Tipo,Hora_e,Hora_salida,Tiempo,Total);
END//
DELIMITER ;


--Procedimiento Update--
--actualizar pago estatus--
DELIMITER //
CREATE PROCEDURE update_Cajon(IN id_Cliente int)
BEGIN
UPDATE pago_cliente
SET Estatus="Adeudo"
WHERE id_Cliente=id_Cliente;
END//
DELIMITER ;

call Actualizar_estatus(100);



--Transsacciones--

--Transaccion para cambiar cantidad de pago--
START TRANSACTION; 
SET @Id_cliente=100; 

UPDATE pago_cliente SET pago = 100   where Id_cliente = 100;
SELECT pago from pago_cliente where Id_cliente=100;


--Transaccion para cambiar los cajones a 1 que sean automovil--
START TRANSACTION; 
SET @cajon=10; 

UPDATE entrada SET cajon = 1   where Tipo = 'automovil';
SELECT cajon from entrada where Tipo='automovil';


--Trigrer--






-- Procedimiento--

DELIMITER //
CREATE PROCEDURE estatus()
BEGIN
SELECT CONCAT(entrada.placa,' ',pago_cliente.Estatus) AS Matricula, Estatus, Pago FROM entrada
INNER JOIN pago_cliente ON entrada.placa=pago_cliente.Placa
WHERE pago >= 300;
END//
DELIMITER ;

--Actualizar cajon--
DELIMITER //
CREATE PROCEDURE update_Cajon(IN Cajon int)
BEGIN
UPDATE entrada
SET Cajon="6"
WHERE Cajon=Cajon '6';
END//
DELIMITER ;


