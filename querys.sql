SELECT AVG(calificacion)
FROM tbcalificacion
WHERE matricula = (
    SELECT matricula
    FROM tbalumno
    WHERE nombreAlumno = 'diana' AND paterno = 'garcia' AND materno = 'lopez'
);



SELECT matricula, concat(paterno,'',materno,'',nombreAlumno) as 'nombre del alumno' FROM dbCampusAltamira.tbAlumno;

SELECT * FROM dbaltamiraAdministracion.tbAlumno
UNION
SELECT * FROM dbAltamiraComunicacion.tbAlumno
UNION
SELECT * FROM dbAltamiraDerecho.tbAlumno
UNION
SELECT * FROM dbAltamiraIngenierias.tbAlumno



SELECT matricula,  concat(paterno,'',materno,'',nombreAlumno) as 'nombre del alumno', NombreCarrera

FROM tbAlumno, tbCarrera WHERE tbCarrera.idCarrera = tbCarrera.idCarrera


//CONSULTA DISTRIBUIDA

SELECT matricula,  concat(paterno,'',materno,'',nombreAlumno) as 'nombre del alumno', NombreCarrera

FROM dbaltamiraAdministracion.tbAlumno, dbaltamiraAdministracion.tbCarrera WHERE dbaltamiraAdministracion.tbCarrera.idCarrera = dbaltamiraAdministracion.tbCarrera.idCarrera

UNION
SELECT matricula,  concat(paterno,'',materno,'',nombreAlumno) as 'nombre del alumno', NombreCarrera

FROM dbAltamiraComunicacion.tbAlumno, dbAltamiraComunicacion.tbCarrera WHERE dbAltamiraComunicacion.tbCarrera.idCarrera = dbAltamiraComunicacion.tbCarrera.idCarrera

UNION
SELECT matricula,  concat(paterno,'',materno,'',nombreAlumno) as 'nombre del alumno', NombreCarrera

FROM dbAltamiraIngenierias.tbAlumno, dbAltamiraIngenierias.tbCarrera WHERE dbAltamiraIngenierias.tbCarrera.idCarrera = dbAltamiraIngenierias.tbCarrera.idCarrera

UNION
SELECT matricula,  concat(paterno,'',materno,'',nombreAlumno) as 'nombre del alumno', NombreCarrera

FROM dbAltamiraDerecho.tbAlumno, dbAltamiraDerecho.tbCarrera WHERE dbAltamiraDerecho.tbCarrera.idCarrera = dbAltamiraDerecho.tbCarrera.idCarrera;


//consulta

SELECT * FROM tbAlumno
WHERE idCarrera=
(SELECT idCarrera FROM tbCarrera
 WHERE nombrecarrera='Administracion')
 or idCarrera=
 (SELECT idCarrera FROM tbCarrera
  WHERE nombrecarrera ='contabilidad');

//para listar las materias de cada carrera
  SELECT nombreCarrera, nombreMateria
  FROM tbCarrera,tbmateria
  WHERE tbCarrera.idCarrera = tbmateria.idcarrera

  //Distribuida

SELECT nombreCarrera,nombreMateria
FROM dbAltamiraAdministracion.tbcarrera,dbAltamiraAdministracion.tbmateria
WHERE tbCarrera.idcarrera = tbmateria.idcarrera
UNION
SELECT nombreCarrera, nombreMateria
FROM dbAltamiraComunicacion.tbcarrera,dbAltamiraComunicacion.tbmateria
WHERE tbCarrera.idcarrera = tbmateria.idcarrera
UNION
SELECT nombreCarrera, nombreMateria
FROM dbAltamiraDerecho.tbcarrera,dbAltamiraDerecho.tbmateria
WHERE tbCarrera.idcarrera = tbmateria.idcarrera
UNION
SELECT nombreCarrera, nombreMateria
FROM dbAltamiraIngenierias.tbcarrera,dbAltamiraIngenierias.tbmateria
WHERE tbCarrera.idcarrera = tbmateria.idcarrera;

//listar carrera y la cordinacion a la que pertenecen
SELECT nombreCoordinacion, nombreCarrera
FROM tbCoordinacion
INNER JOIN tbCarrera on tbCoordinacion.idCoordinacion=tbCarrera.idCoordinacion;

//distribuida
SELECT nombreCoordinacion,nombreCarrera
FROM dbAltamiraAdministracion.tbcoordinacion
INNER JOIN dbAltamiraAdministracion.tbCarrera ON
dbAltamiraAdministracion.tbcoordinacion.idcoordinacion=dbAltamiraAdministracion.tbcarrera.idcoordinacion
UNION
SELECT nombreCoordinacion,nombreCarrera
FROM dbAltamiraComunicacion.tbcoordinacion
INNER JOIN dbAltamiraComunicacion.tbCarrera ON
dbAltamiraComunicacion.tbcoordinacion.idcoordinacion=dbAltamiraComunicacion.tbcarrera.idcoordinacion
UNION
SELECT nombreCoordinacion,nombreCarrera
FROM dbAltamiraDerecho.tbcoordinacion
INNER JOIN dbAltamiraDerecho.tbCarrera ON
dbAltamiraDerecho.tbcoordinacion.idcoordinacion=dbAltamiraDerecho.tbcarrera.idcoordinacion
UNION
SELECT nombreCoordinacion,nombreCarrera
FROM dbAltamiraIngenierias.tbcoordinacion
INNER JOIN dbAltamiraIngenierias.tbCarrera ON
dbAltamiraIngenierias.tbcoordinacion.idcoordinacion=dbAltamiraIngenierias.tbcarrera.idcoordinacion

//materias de todos los alumnos
SELECT tbAlumno.matricula, nombreAlumno, paterno,materno, nombreMateria
FROM tbAlumno
INNER JOIN tbCalificacion ON tbCalificacion.matricula=tbAlumno.matricula
INNER JOIN tbMateria ON tbMateria.idMateria = tbCalificacion.idMateria


//Distribuida
SELECT tbAlumno.matricula, nombreAlumno, paterno,materno, nombreMateria
FROM dbAltamiraAdministracion.tbAlumno
INNER JOIN dbAltamiraAdministracion.tbCalificacion ON dbAltamiraAdministracion.tbCalificacion.matricula=tbAlumno.matricula
INNER JOIN dbAltamiraAdministracion.tbMateria ON dbAltamiraAdministracion.tbMateria.idMateria = tbCalificacion.idMateria
UNION
SELECT tbAlumno.matricula, nombreAlumno, paterno,materno, nombreMateria
FROM dbAltamiraComunicacion.tbAlumno
INNER JOIN dbAltamiraComunicacion.tbCalificacion ON dbAltamiraComunicacion.tbCalificacion.matricula=tbAlumno.matricula
INNER JOIN dbAltamiraComunicacion.tbMateria ON dbAltamiraComunicacion.tbMateria.idMateria = tbCalificacion.idMateria
UNION
SELECT tbAlumno.matricula, nombreAlumno, paterno,materno, nombreMateria
FROM dbAltamiraDerecho.tbAlumno
INNER JOIN dbAltamiraDerecho.tbCalificacion ON dbAltamiraDerecho.tbCalificacion.matricula=tbAlumno.matricula
INNER JOIN dbAltamiraDerecho.tbMateria ON dbAltamiraDerecho.tbMateria.idMateria = tbCalificacion.idMateria
UNION
SELECT tbAlumno.matricula, nombreAlumno, paterno,materno, nombreMateria
FROM dbAltamiraIngenierias.tbAlumno
INNER JOIN dbAltamiraIngenierias.tbCalificacion ON dbAltamiraIngenierias.tbCalificacion.matricula=tbAlumno.matricula
INNER JOIN dbAltamiraIngenierias.tbMateria ON dbAltamiraIngenierias.tbMateria.idMateria = tbCalificacion.idMateria

//Listar materias y carrera de la coordinacion

SELECT nombreCarrera, nombreMateria
  FROM tbCarrera
INNER join tbMateria on tbCarrera.idCarrera=tbMateria.idCarrera
INNER join tbCoordinacion on tbCoordinacion.idCoordinacion=tbCarrera.idCoordinacion
WHERE nombrecoordinacion ='ingenierias'

//distribuida
SELECT dbAltamiraIngenierias.tbcarrera.nombreCarrera, dbAltamiraIngenierias.tbmateria.nombreMateria
  FROM dbAltamiraIngenierias.tbCarrera
INNER join dbAltamiraIngenierias.tbMateria on dbAltamiraIngenierias.tbCarrera.idCarrera=tbMateria.idCarrera
INNER join dbAltamiraIngenierias.tbCoordinacion on dbAltamiraIngenierias.tbCoordinacion.idCoordinacion=tbCarrera.idCoordinacion
WHERE dbAltamiraIngenierias.tbcoordinacion.nombrecoordinacion ='ingenierias'

// listar materias de la carrera de ingenierias tics
SELECT nombreMateria
  FROM tbMateria
INNER JOIN tbCarrera on tbCarrera.idCarrera=tbMateria.idCarrera
WHERE nombreCarrera ='ingenieria en TICS';

//PROCEDIMINETO PARA ALTA

DELIMITER //

CREATE PROCEDURE ALTAS(campus varchar(20), carrera varchar(30), nombreAlumno varchar(20), paterno varchar(20), materno varchar(20), fechaNac date, correo varchar(30), genero char(1))
  BEGIN
    SET @NOMBRECAMPUS = (select idcampus from tbcampus where nombreCampus=campus);
    SET @NOMBRECARRERA = (select idcarrera from tbcarrera where nombreCarrera LIKE carrera);

INSERT INTO dbCampusAltamira.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera,idCampus)

VALUES
    (nombreAlumno,paterno,materno,fechaNac,correo,genero, @NOMBRECARRERA,@NOMBRECAMPUS);

SELECT MATRICULA
FROM dbCampusAltamira.TBALUMNO
order by matricula desc
limit 1;
  END //
  DELIMITER ;


// procedimiento almacenado para inscripcion de alumnos
DELIMITER //

CREATE PROCEDURE InscribirAlumnos(
     campus VARCHAR(20),
     carrera VARCHAR(30),
     nombreAlumno VARCHAR(20),
     paterno VARCHAR(20),
     materno VARCHAR(20),
     fechaNac DATE,
     correo VARCHAR(30),
     genero CHAR(1)
)
BEGIN
    DECLARE CampusID INT;
    DECLARE CarreraID INT;

    -- Obtener el ID del campus
    SELECT idcampus INTO CampusID
    FROM tbcampus
    WHERE nombreCampus = campus;

    -- Obtener el ID de la carrera
    SELECT idcarrera INTO CarreraID
    FROM tbcarrera
    WHERE nombreCarrera LIKE carrera;

    -- Insertar el alumno en la tabla tbAlumno del campus correspondiente
    IF campus = 'Altamira' THEN
        INSERT INTO dbCampusAltamira.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera, idCampus)
        VALUES (nombreAlumno, paterno, materno, fechaNac, correo, genero, CarreraID, CampusID);

        -- Devolver el registro del alumno recién inscrito en Altamira
        SELECT *
        FROM dbCampusAltamira.tbAlumno
        WHERE idCampus = CampusID
        ORDER BY MATRICULA DESC
        LIMIT 1;

    ELSEIF campus = 'Oriente' THEN
        INSERT INTO dbCampusOriente.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera, idCampus)
        VALUES (nombreAlumno, paterno, materno, fechaNac, correo, genero, CarreraID, CampusID);

        -- Devolver el registro del alumno recién inscrito en Oriente
        SELECT *
        FROM dbCampusOriente.tbAlumno
        WHERE idCampus = CampusID
        ORDER BY MATRICULA DESC
        LIMIT 1;

    END IF;
END //

DELIMITER ;

PROCEDIMIENTO CON CASE

DELIMITER //
CREATE PROCEDURE AltaAlumno (
     campus VARCHAR(20),
     carrera VARCHAR(30),
     nombreAlumno VARCHAR(20),
     paterno VARCHAR(20),
     materno VARCHAR(20),
     fechaNac DATE,
     correo VARCHAR(30),
     genero CHAR(1)
)
BEGIN
SET @nombrecampus = (SELECT idCampus FROM tbCampus
                     WHERE nombreCampus = campus);
SET @nombrecarrera = (SELECT idCarrera FROM tbCarrera
                      WHERE nombreCarrera LIKE carrera);

             CASE @nombrecampus
             WHEN 1 THEN
            INSERT INTO dbCampusAltamira.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera, idCampus)
        VALUES (nombreAlumno, paterno, materno, fechaNac, correo, genero, @nombrecarrera, @nombrecampus);
        WHEN 2 THEN
             INSERT INTO dbCampusOriente.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera, idCampus)
        VALUES (nombreAlumno, paterno, materno, fechaNac, correo, genero, @nombrecarrera, @nombrecampus);

        ELSE
        SELECT 'El campus no existe';
        END CASE;
        END //
        DELIMITER ;

      CALL AltaAlumno('Altamira', 'Ingenieria en TICS', 'Juan', 'Martinez', 'Perez', '1989-10-10', 'jmartinez@udetijuana.edu.mx', 'M');
      CALL AltaAlumno('Oriente', 'Ingenieria en TICS', 'Paola', 'Lopez', 'Bracho', '1989-05-09', 'pbracho@udetijuana.edu.mx', 'F');

      // INGRESAR MATERIAS
      SET @MATRICULA = (SELECT matricula FROM tbAlumno ORDER BY matricula DESC LIMIT 1);
      SET @idcarrera = (SELECT idCarrera FROM tbAlumno ORDER BY matricula DESC limit 1);

      insert into tbCalificacion (matricula, idmateria)
      SELECT @MATRICULA as matricula, idMateria FROM tbMateria INNER JOIN tbCarrera USING(idCarrera) WHERE idCarrera = @idCarrera

    PROCEDIMIENTO ALMACENADO PARA MATERIAS

    DELIMITER //
    CREATE PROCEDURE ALTAMATERIAS()
    BEGIN
    SET @MATRICULA = (SELECT matricula FROM tbAlumno ORDER BY matricula DESC LIMIT 1);
          SET @idcarrera = (SELECT idCarrera FROM tbAlumno ORDER BY matricula DESC limit 1);

          insert into tbCalificacion (matricula, idmateria)
          SELECT @MATRICULA as matricula, idMateria FROM tbMateria INNER JOIN tbCarrera USING(idCarrera) WHERE idCarrera = @idCarrera;

        SELECT * FROM tbCalificacion WHERE MATRICULA = @MATRICULA;
        END //
        DELIMITER ;

        CALL ALTAMATERIAS();

 --INICIA LA TRANSACCION
        START TRANSACTION;
        INSERT into tbPrueba
        VALUES (4);
        SELECT * FROM tbPrueba;
 --REGRESA A SU ESTADO ABTERIOR
        START TRANSACTION;
                INSERT into tbPrueba
                VALUES (4);
                ROLLBACK;
                SELECT * FROM tbPrueba;
                --CONFIRMA EL DATO INSERTADO
                START TRANSACTION;
                        INSERT into tbPrueba
                        VALUES (4);
                        SELECT * FROM tbPrueba;
                        COMMIT;
                       --ACTUALIZACION
                        START TRANSACTION;
                                UPDATE SET Campo = 6
                                WHERE = 4;
                                SELECT * FROM tbPrueba;
                                Rollback;
-- Trigers
--
--
DELIMITER //
CREATE TRIGGER beforeInsertInscripciones
BEFORE INSERT on inscripciones
for EACH ROW
BEGIN UPDATE
cursos SET stock = cursos.stock-1
WHERE new.idCurso=cursos.idcurso;
end //
DELIMITER ;

--mostrar triger
 show triggers
 -Eliminar triger
 drop trigger beforeInsertInscripciones

 --Insertar alumnos a los cursos
 INSERT into usuarios(nombre,contrasena) VALUES
 ('Maria', 123456);
 -Seleccionar usuarios,cursos,inscripciones
 SELECT * FROM usuarios;
 SELECT * FROM cursos;
 SELECT * FROM inscripciones;

 --insertar a las incripciones
 INSERT into inscripciones(idCurso,idUsuario)
 VALUES (1,1);

 SELECT * FROM inscripciones;
 SELECT * FROM cursos;

 --Actualizar usuarios
 DELIMITER //
 CREATE TRIGGER beforeInsertusuarios
 BEFORE update on usuarios
 for EACH ROW
 BEGIN
 INSERT INTO passanteriores(idUsuario,nombre,contrasena) VALUES(old.idusuario,old.nombre,old.contrasena);
 end //
 DELIMITER ;
 --Seleccionar usuarios y pass
 SELECT * FROM usuarios ;
 SELECT * FROM passanteriores;

 --Actualizar contrasena
 UPDATE usuarios SET contrasena='98007654' WHERE nombre='Maria';

 SELECT * FROM usuarios;
 SELECT * FROM passanteriores;

 --Actualizar incripciones al cambiarse de curso
 DELIMITER //
 CREATE TRIGGER beforeUpdateIncripcion
 BEFORE UPDATE on inscripciones
 FOR EACH ROW
 BEGIN
 UPDATE cursos set stock=cursos.stock-1
 WHERE new.idcurso = cursos.idcurso;
 UPDATE cursos SET stock=cursos.stock+1
 WHERE old.idcurso=cursos.idcurso;
 end //
 DELIMITER ;

 SELECT * FROM usuarios;
 SELECT * FROM cursos;
 SELECT * FROM inscripciones;

 --Actualizar inscripciones
 update inscripciones set idcurso=3  WHERE idusuario=1;

 SELECT * FROM usuarios;
 SELECT * FROM cursos;
 SELECT * FROM inscripciones;


 --Eliminar cursos
 DELIMITER //
 CREATE TRIGGER beforeDeleteIncripcion
 BEFORE DELETE on inscripciones
 for each ROW
 BEGIN
 update cursos  set stock=cursos.stock+1
 WHERE old.idcurso=cursos.idcurso;
 end //
 DELIMITER ;

 DELETE FROM inscripciones WHERE idInscripcion=1;
 SELECT * FROM cursos;


 --Insertar tabla en bases de datos oriente y altamira
 CREATE TABLE if NOT EXISTS tbSeguimiento(
     matricula int,
     idCarrera int,
     Reprobadas int,
     FOREIGN KEY (matricula) REFERENCES tbAlumno(matricula) ON DELETE CASCADE,
     FOREIGN KEY (idcarrera) REFERENCES tbCarrera(idCarrera) ON DELETE CASCADE
 ) ENGINE=INNODB;

 INSERT into tbseguimiento (matricula,idCarrera,reprobadas)
 SELECT matricula,idCarrera, COUNT(calificacion)
 FROM tbCalificacion
 INNER JOIN tbAlumno USING (matricula)
 INNER JOIN tbCarrera USING(idcarrera)
 WHERE calificacion <7
 GROUP BY matricula

--UUNIDAD 3
 --Materias altas en campus
 DELIMITER //
 CREATE PROCEDURE AltaMaterias()
 BEGIN
     DECLARE Matricula INT;
     DECLARE IdCarrera INT;
     DECLARE Campus VARCHAR(20);

     -- Obtener la matrícula del último alumno inscrito
     SET Matricula = (SELECT matricula FROM tbAlumno ORDER BY matricula DESC LIMIT 1);

     -- Obtener la carrera del último alumno inscrito
     SET IdCarrera = (SELECT idCarrera FROM tbAlumno WHERE matricula = Matricula);

     -- Obtener el campus del último alumno inscrito
     SET Campus = (SELECT idCampus FROM tbCampus WHERE nombreCampus = Campus);

     -- Validar el campus y proceder según el nombre del campus
     IF Campus = 'Altamira' THEN
         INSERT INTO dbCampusAltamira.tbCalificacion (matricula, idmateria)
         SELECT Matricula, idMateria
         FROM dbCampusAltamira.tbMateria
         INNER JOIN dbCampusAltamira.tbCarrera USING(idCarrera)
         WHERE idCarrera = IdCarrera;
     ELSEIF Campus = 'Oriente' THEN
         INSERT INTO dbCampusOriente.tbCalificacion (matricula, idmateria)
         SELECT Matricula, idMateria
         FROM dbCampusOriente.tbMateria
         INNER JOIN dbCampusOriente.tbCarrera USING(idCarrera)
         WHERE idCarrera = IdCarrera;
     END IF;

     -- Mostrar las calificaciones insertadas
     IF Campus = 'Altamira' THEN
         SELECT * FROM dbCampusAltamira.tbCalificacion WHERE matricula = Matricula;
     ELSEIF Campus = 'Oriente' THEN
         SELECT * FROM dbCampusOriente.tbCalificacion WHERE matricula = Matricula;
     END IF;
 END //
 DELIMITER ;

 --Alta de alumnos

 DELIMITER //

 CREATE PROCEDURE InscribirAlumnos(
      campus VARCHAR(20),
      carrera VARCHAR(30),
      nombreAlumno VARCHAR(20),
      paterno VARCHAR(20),
      materno VARCHAR(20),
      fechaNac DATE,
      correo VARCHAR(30),
      genero CHAR(1)
 )
 BEGIN
     DECLARE CampusID INT;
     DECLARE CarreraID INT;

     -- Obtener el ID del campus
     SELECT idcampus INTO CampusID
     FROM tbcampus
     WHERE nombreCampus = campus;

     -- Obtener el ID de la carrera
     SELECT idcarrera INTO CarreraID
     FROM tbcarrera
     WHERE nombreCarrera LIKE carrera;

     -- Insertar el alumno en la tabla tbAlumno del campus correspondiente
     IF campus = 'Altamira' THEN
         INSERT INTO dbCampusAltamira.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera, idCampus)
         VALUES (nombreAlumno, paterno, materno, fechaNac, correo, genero, CarreraID, CampusID);

         -- Devolver el registro del alumno recién inscrito en Altamira
         SELECT *
         FROM dbCampusAltamira.tbAlumno
         WHERE idCampus = CampusID
         ORDER BY MATRICULA DESC
         LIMIT 1;

     ELSEIF campus = 'Oriente' THEN
         INSERT INTO dbCampusOriente.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera, idCampus)
         VALUES (nombreAlumno, paterno, materno, fechaNac, correo, genero, CarreraID, CampusID);

         -- Devolver el registro del alumno recién inscrito en Oriente
         SELECT *
         FROM dbCampusOriente.tbAlumno
         WHERE idCampus = CampusID
         ORDER BY MATRICULA DESC
         LIMIT 1;

     END IF;
 END //

 DELIMITER ;

 --Transaccion
 DELIMITER //

  CREATE PROCEDURE TransaccionCompleta(
        campus VARCHAR(20),
        carrera VARCHAR(30),
        nombreAlumno VARCHAR(20),
        paterno VARCHAR(20),
        materno VARCHAR(20),
        fechaNac DATE,
        correo VARCHAR(30),
        genero CHAR(1),
        materia VARCHAR(50)
  )
  BEGIN
      DECLARE EXIT HANDLER FOR SQLEXCEPTION
      BEGIN
          -- En caso de error, se realiza un ROLLBACK
          ROLLBACK;
          SELECT 'Ocurrió un error y se realizó un ROLLBACK.' AS mensaje;
      END;

      -- Iniciar la transacción
      START TRANSACTION;
      SET @nombrecampus = (SELECT idCampus FROM tbCampus
                           WHERE nombreCampus = campus);
      SET @nombrecarrera = (SELECT idCarrera FROM tbCarrera
                            WHERE nombreCarrera LIKE carrera);

                   CASE @nombrecampus
                   WHEN 1 THEN
                  INSERT INTO dbCampusAltamira.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera, idCampus)
              VALUES (nombreAlumno, paterno, materno, fechaNac, correo, genero, @nombrecarrera, @nombrecampus);
              WHEN 2 THEN
                   INSERT INTO dbCampusOriente.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera, idCampus)
              VALUES (nombreAlumno, paterno, materno, fechaNac, correo, genero, @nombrecarrera, @nombrecampus);

              ELSE
              SELECT 'El campus no existe';

                   -- Devolver el registro del alumno recién inscrito en Oriente
              SELECT *
              FROM dbCampusOriente.tbAlumno
              WHERE idCampus = CampusID
              ORDER BY MATRICULA DESC
              LIMIT 1;
              END CASE;



              -- Obtener la carrera del último alumno inscrito
              SET @IdCarrera = (SELECT idCarrera FROM tbAlumno WHERE matricula = Matricula);

              -- Obtener el campus del último alumno inscrito
              SET @Campus = (SELECT idCampus FROM tbCampus WHERE nombreCampus = Campus);

              -- Validar el campus y proceder según el nombre del campus
              IF @Campus = 'Altamira' THEN
                  INSERT INTO dbCampusAltamira.tbCalificacion (matricula, idmateria)
                  SELECT Matricula, idMateria
                  FROM dbCampusAltamira.tbMateria
                  INNER JOIN dbCampusAltamira.tbCarrera USING(idCarrera)
                  WHERE idCarrera = @IdCarrera;
              ELSEIF @Campus = 'Oriente' THEN
                  INSERT INTO dbCampusOriente.tbCalificacion (matricula, idmateria)
                  SELECT Matricula, idMateria
                  FROM dbCampusOriente.tbMateria
                  INNER JOIN dbCampusOriente.tbCarrera USING(idCarrera)
                  WHERE idCarrera = @IdCarrera;
              END IF;

      -- Confirmar la transacción
      COMMIT;
      -- Mostrar las calificaciones insertadas
      IF @Campus = 'Altamira' THEN
          SELECT * FROM dbCampusAltamira.tbCalificacion WHERE matricula = Matricula;
      ELSEIF @Campus = 'Oriente' THEN
          SELECT * FROM dbCampusOriente.tbCalificacion WHERE matricula = Matricula;
      END IF;
  END //

  DELIMITER ;

  CALL TransaccionCompleta('Oriente', 'Ingenieria en TICS', 'Ivone', 'Magon', 'Hernandez', '1996-05-09', 'imagon@udetijuana.edu.mx', 'F','Matematicas');
