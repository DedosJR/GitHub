DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALTAMATERIAS`()
BEGIN
SET @MATRICULA = (SELECT matricula FROM tbAlumno ORDER BY matricula DESC LIMIT 1);
      SET @idcarrera = (SELECT idCarrera FROM tbAlumno ORDER BY matricula DESC limit 1);
      
      insert into tbCalificacion (matricula, idmateria) 
      SELECT @MATRICULA as matricula, idMateria FROM tbMateria INNER JOIN tbCarrera USING(idCarrera) WHERE idCarrera = @idCarrera;
      
    SELECT * FROM tbCalificacion WHERE MATRICULA = @MATRICULA;
    END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALTAS`(campus varchar(20), carrera varchar(30), nombreAlumno varchar(20), paterno varchar(20), materno varchar(20), fechaNac date, correo varchar(30), genero char(1))
BEGIN
		SET @NOMBRECAMPUS = (select idcampus from tbcampus where nombreCampus=campus);
		SET @NOMBRECARRERA = (select idcarrera from tbcarrera where nombreCarrera LIKE carrera);
		INSERT INTO dbCampusAltamira.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera,idCampus) VALUES
		(nombreAlumno,paterno,materno,fechaNac,correo,genero, @NOMBRECARRERA,@NOMBRECAMPUS);
		SELECT MATRICULA FROM dbCampusAltamira.TBALUMNO order by matricula desc limit 1;
	END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AltaAlumno`(IN `campus` VARCHAR(20), IN `carrera` VARCHAR(30), IN `nombreAlumno` VARCHAR(20), IN `paterno` VARCHAR(20), IN `materno` VARCHAR(20), IN `fechaNac` DATE, IN `correo` VARCHAR(30), IN `genero` CHAR(1))
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

           -- Devolver el registro del alumno recién inscrito en Oriente
              SELECT *
              FROM dbCampusOriente.tbAlumno
              WHERE idCampus = CampusID
              ORDER BY MATRICULA DESC
              LIMIT 1;
              END CASE;
        END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlumnosAlta`(
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
    DECLARE AlumnoExistente INT;

    CASE campus
        WHEN 'Altamira' THEN
            SELECT idcampus INTO CampusID FROM dbCampusAltamira.tbcampus WHERE nombreCampus = campus;
            SELECT idcarrera INTO CarreraID FROM dbCampusAltamira.tbcarrera WHERE nombreCarrera = carrera;

            SELECT COUNT(*) INTO AlumnoExistente
            FROM dbCampusAltamira.tbAlumno
            WHERE nombreAlumno = nombreAlumno AND paterno = paterno AND materno = materno AND fechaNac = fechaNac AND correo = correo;

            IF AlumnoExistente = 0 THEN
                INSERT INTO dbCampusAltamira.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera, idCampus)
                VALUES (nombreAlumno, paterno, materno, fechaNac, correo, genero, CarreraID, CampusID);
            ELSE
                SELECT 'El alumno ya existe en el campus Altamira.' AS mensaje;
            END IF;

        WHEN 'Oriente' THEN
            SELECT idcampus INTO CampusID FROM dbCampusOriente.tbcampus WHERE nombreCampus = campus;
            SELECT idcarrera INTO CarreraID FROM dbCampusOriente.tbcarrera WHERE nombreCarrera = carrera;

            SELECT COUNT(*) INTO AlumnoExistente
            FROM dbCampusOriente.tbAlumno
            WHERE nombreAlumno = nombreAlumno AND paterno = paterno AND materno = materno AND fechaNac = fechaNac AND correo = correo;

            IF AlumnoExistente = 0 THEN
                INSERT INTO dbCampusOriente.tbAlumno (nombreAlumno, paterno, materno, fechaNac, correo, genero, idcarrera, idCampus)
                VALUES (nombreAlumno, paterno, materno, fechaNac, correo, genero, CarreraID, CampusID);
            ELSE
                SELECT 'El alumno ya existe en el campus Oriente.' AS mensaje;
            END IF;
    END CASE;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InscribeAlumno`(IN `campus` VARCHAR(20), IN `carrera` VARCHAR(30), IN `nombreAlumno` VARCHAR(20), IN `paterno` VARCHAR(20), IN `materno` VARCHAR(20), IN `fechaNac` DATE, IN `correo` VARCHAR(30), IN `genero` CHAR(1))
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
        END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Materias`()
BEGIN
     DECLARE Matricula INT;
     DECLARE IdCarrera INT;
     DECLARE Campus VARCHAR(20);
 
     -- Obtener la matrícula del último alumno inscrito
     SET Matricula = (SELECT matricula FROM tbAlumno ORDER BY matricula DESC LIMIT 1);
 
     -- Obtener la carrera del último alumno inscrito
     SET IdCarrera = (SELECT idCarrera FROM tbAlumno WHERE matricula = Matricula);
 
      -- Obtener el campus del último alumno inscrito
     SET Campus = (SELECT idCampus
                   FROM tbCampus
                   WHERE nombreCampus = Campus);

 
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
 END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Transaccion`(IN `campus` VARCHAR(20), IN `carrera` VARCHAR(30), IN `nombreAlumno` VARCHAR(20), IN `paterno` VARCHAR(20), IN `materno` VARCHAR(20), IN `fechaNac` DATE, IN `correo` VARCHAR(30), IN `genero` CHAR(1), IN `materia` VARCHAR(50))
BEGIN
    DECLARE Matricula INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- En caso de error, se realiza un ROLLBACK
        ROLLBACK;
        SELECT 'Ocurrió un error y se realizó un ROLLBACK.' AS mensaje;
    END;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Llamar al procedimiento InscribeAlumno
    CALL AltaAlumno(campus, carrera, nombreAlumno, paterno, materno, fechaNac, correo, genero);

    -- Obtener la matrícula del último alumno inscrito
    IF campus = 'Altamira' THEN
        SELECT MAX(MATRICULA) INTO Matricula 
        FROM dbCampusAltamira.tbAlumno;
    ELSEIF campus = 'Oriente' THEN
        SELECT MAX(MATRICULA) INTO Matricula 
        FROM dbCampusOriente.tbAlumno;
    END IF;

    -- Llamar al procedimiento Materias
    CALL Materias(campus, Matricula, materia);

    -- Confirmar la transacción
    COMMIT;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TransaccionCompleta`(
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
  END$$
DELIMITER ;
