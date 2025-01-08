
--Document By Israel Flores--

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


--Transacciones--

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


