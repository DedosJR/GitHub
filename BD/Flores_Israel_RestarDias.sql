 --//Restar dias a la fecha de creacion--FUNCIONA--//
DELIMITER //
CREATE FUNCTION restarDias()
RETURNS DATE 
BEGIN
     SET @fecha=curdate();
     RETURN @fecha - INTERVAL (SELECT (ROUND(RAND()*1000))) DAY;
END//
DELIMITER ;

UPDATE tblibro set fechaCreacion=restardias();

UPDATE tbautor set fechaCreacion=restardias();