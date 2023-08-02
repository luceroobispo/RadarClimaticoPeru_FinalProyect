CREATE DATABASE Radar_Climatico_Peru
GO

USE Radar_Climatico_Peru
GO

CREATE TABLE Alerta (
    idAlerta int  NOT NULL primary key,
    idEvento int  NOT NULL,
    tipoAlerta char(1)  NOT NULL,
    fechaInicio date  NOT NULL,
    fecha_posible_fin date  NOT NULL,
    hora time(4)  NOT NULL,
    estado bit  NOT NULL
);

CREATE TABLE Comprobante_pago (
    idComprobante int  NOT NULL primary key,
    idMetodoPago int  NOT NULL,
    idTarifario int  NOT NULL,
    fechaEmision date  NOT NULL
);

CREATE TABLE Distrito (
    idDistrito int  NOT NULL primary key,
    nombre varchar(50)  NOT NULL,
    idProvincia int  NOT NULL
);

CREATE TABLE EventoClimatico (
    idEvento int  NOT NULL primary key,
    idDistrito int  NOT NULL,
    idTipo int  NOT NULL,
    grado char(1)  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    eventoVenidero bit  NOT NULL
);

CREATE TABLE MetodoPago (
    idMetodoPago int  NOT NULL primary key,
    tipo varchar(20)  NOT NULL,
    credencialTarjeta int  NOT NULL,
    fechaVencimiento date  NOT NULL,
    codSeguridad char(3)  NOT NULL,
    idUsuario int  NOT NULL
);

CREATE TABLE MetodoPrevencionDanio (
    idMetodo int  NOT NULL primary key,
    descripcion varchar(80)  NOT NULL,
    TipoEvento_idTipo int  NOT NULL
);

CREATE TABLE Notificacion (
    idNotificacion int  NOT NULL primary key,
    idAlerta int  NOT NULL,
    fecha date  NOT NULL,
    hora time(4)  NOT NULL,
    contenido varchar(100)  NOT NULL,
    estado bit  NOT NULL
);

CREATE TABLE PronosticoMeteorologico (
    idPronostico int  NOT NULL primary key,
    idReporte int  NOT NULL,
    temperatura decimal(10,2)  NOT NULL,
    precipitacion decimal(10,2)  NOT NULL,
    humedad decimal(10,2)  NOT NULL,
    velocidadViento decimal(10,2)  NOT NULL,
    direccionViento varchar(20)  NOT NULL,
    condicionCielo varchar(20)  NOT NULL
);

CREATE TABLE Provincia (
    idProvincia int  NOT NULL primary key,
    nombre varchar(30)  NOT NULL
);

CREATE TABLE ReporteClima (
    idReporte int  NOT NULL primary key,
    institucion varchar(30)  NOT NULL,
    fecha date  NOT NULL,
    hora time(4)  NOT NULL,
    nivelUrgencia varchar(10)  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    idDistrito int  NOT NULL
);

CREATE TABLE Tarifario (
    idTarifario int  NOT NULL primary key,
    Precio decimal(10,2)  NOT NULL,
    nombrePlan varchar(30)  NOT NULL,
    duracionMes int  NOT NULL
);

CREATE TABLE TipoEvento (
    idTipo int  NOT NULL primary key,
    descripcion varchar(30)  NOT NULL
);

CREATE TABLE Usuario (
    idUsuario int  NOT NULL primary key,
    nombre varchar(40)  NOT NULL,
    apellidoPaterno varchar(40)  NOT NULL,
    apellidoMaterno varchar(40)  NOT NULL,
    tipoDocumento char(3)  NOT NULL,
    nroDocumento char(11)  NOT NULL,
    telefonoFijo char(7)  NOT NULL,
    telefonoMovil varchar(9)  NOT NULL,
    correo varchar(120)  NOT NULL,
    fechaNacimiento date  NOT NULL,
    membresia bit  NOT NULL,
    idDistrito int  NOT NULL,
    idNotificacion int  NOT NULL
);

-- foreign keys

-- Reference: Alerta_EventoClimatico (table: Alerta)
ALTER TABLE Alerta ADD CONSTRAINT Alerta_EventoClimatico
    FOREIGN KEY (idEvento)
    REFERENCES EventoClimatico (idEvento);

-- Reference: Comprobante_pago_MetodoPago (table: Comprobante_pago)
ALTER TABLE Comprobante_pago ADD CONSTRAINT Comprobante_pago_MetodoPago
    FOREIGN KEY (idMetodoPago)
    REFERENCES MetodoPago (idMetodoPago);

-- Reference: Comprobante_pago_Tarifario (table: Comprobante_pago)
ALTER TABLE Comprobante_pago ADD CONSTRAINT Comprobante_pago_Tarifario
    FOREIGN KEY (idTarifario)
    REFERENCES Tarifario (idTarifario);

-- Reference: Distrito_Provincia (table: Distrito)
ALTER TABLE Distrito ADD CONSTRAINT Distrito_Provincia
    FOREIGN KEY (idProvincia)
    REFERENCES Provincia (idProvincia);

-- Reference: EventoClimatico_Distrito (table: EventoClimatico)
ALTER TABLE EventoClimatico ADD CONSTRAINT EventoClimatico_Distrito
    FOREIGN KEY (idDistrito)
    REFERENCES Distrito (idDistrito);

-- Reference: EventoClimatico_TipoEvento (table: EventoClimatico)
ALTER TABLE EventoClimatico ADD CONSTRAINT EventoClimatico_TipoEvento
    FOREIGN KEY (idTipo)
    REFERENCES TipoEvento (idTipo);

-- Reference: MetodoPago_Usuario (table: MetodoPago)
ALTER TABLE MetodoPago ADD CONSTRAINT MetodoPago_Usuario
    FOREIGN KEY (idUsuario)
    REFERENCES Usuario (idUsuario);

-- Reference: MetodoPrevencionDanio_TipoEvento (table: MetodoPrevencionDanio)
ALTER TABLE MetodoPrevencionDanio ADD CONSTRAINT MetodoPrevencionDanio_TipoEvento
    FOREIGN KEY (TipoEvento_idTipo)
    REFERENCES TipoEvento (idTipo);

-- Reference: Notificacion_Alerta (table: Notificacion)
ALTER TABLE Notificacion ADD CONSTRAINT Notificacion_Alerta
    FOREIGN KEY (idAlerta)
    REFERENCES Alerta (idAlerta);

-- Reference: PronosticoMeteorologico_ReporteClima (table: PronosticoMeteorologico)
ALTER TABLE PronosticoMeteorologico ADD CONSTRAINT PronosticoMeteorologico_ReporteClima
    FOREIGN KEY (idReporte)
    REFERENCES ReporteClima (idReporte);

-- Reference: ReporteClima_Distrito (table: ReporteClima)
ALTER TABLE ReporteClima ADD CONSTRAINT ReporteClima_Distrito
    FOREIGN KEY (idDistrito)
    REFERENCES Distrito (idDistrito);

-- Reference: Usuario_Distrito (table: Usuario)
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Distrito
    FOREIGN KEY (idDistrito)
    REFERENCES Distrito (idDistrito);

-- Reference: Usuario_Notificacion (table: Usuario)
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Notificacion
    FOREIGN KEY (idNotificacion)
    REFERENCES Notificacion (idNotificacion);

-- INSERTS ---------------------------------------------


-- PROVINCIA
INSERT INTO Provincia VALUES (1, 'Lima')
INSERT INTO Provincia VALUES (2, 'Huancayo')
INSERT INTO Provincia VALUES (3, 'Iquitos')
INSERT INTO Provincia VALUES (4, 'Cajamarca')
INSERT INTO Provincia VALUES (5, 'Piura')
INSERT INTO Provincia VALUES (6, 'Ayacucho')
iNSERT INTO Provincia VALUES (7, 'Huanuco')
INSERT INTO Provincia VALUES (8, 'Lambayeque')
INSERT INTO Provincia VALUES (9, 'Puno')

-- DISTRITO

INSERT INTO Distrito VALUES (1, 'Lima', 1)
INSERT INTO Distrito VALUES (2, 'Chilca', 2)
INSERT INTO Distrito VALUES (3, 'Colca', 2)
INSERT INTO Distrito VALUES (4, 'Belen', 3)
INSERT INTO Distrito VALUES (5, 'Magdalena', 4)
INSERT INTO Distrito VALUES (6, 'Puquio', 6)
INSERT INTO Distrito VALUES (7, 'Quisqui', 7)
INSERT INTO Distrito VALUES (8, 'Olmos', 8)
INSERT INTO Distrito VALUES (9, 'Huata', 9)

-- REPORTE CLIMA 

INSERT INTO ReporteClima (idReporte, institucion, fecha, hora, nivelUrgencia, descripcion, idDistrito)
VALUES (1, 'Institución XYZ', '2023-06-17', '12:00:00', 'Alto', 'Reporte de clima actual', 1);

INSERT INTO ReporteClima (idReporte, institucion, fecha, hora, nivelUrgencia, descripcion, idDistrito)
VALUES (2, 'Institución ABC', '2023-06-18', '10:30:00', 'Medio', 'Reporte de clima semanal', 2);

INSERT INTO ReporteClima (idReporte, institucion, fecha, hora, nivelUrgencia, descripcion, idDistrito)
VALUES (3, 'Institución 123', '2023-06-19', '14:15:00', 'Bajo', 'Reporte de clima mensual', 3);

INSERT INTO ReporteClima (idReporte, institucion, fecha, hora, nivelUrgencia, descripcion, idDistrito)
VALUES (4, 'Institución XYZ', '2023-06-20', '09:45:00', 'Alto', 'Reporte de clima diario', 1);

INSERT INTO ReporteClima (idReporte, institucion, fecha, hora, nivelUrgencia, descripcion, idDistrito)
VALUES (5, 'Institución ABC', '2023-06-21', '16:30:00', 'Medio', 'Reporte de clima semanal', 4);

INSERT INTO ReporteClima (idReporte, institucion, fecha, hora, nivelUrgencia, descripcion, idDistrito)
VALUES (6, 'Institución ERT', '2023-06-24', '18:30:00', 'Medio', 'Reporte de clima mensual', 6);
INSERT INTO ReporteClima (idReporte, institucion, fecha, hora, nivelUrgencia, descripcion, idDistrito)
VALUES (7, 'Institucion Peruana del clima', '2023-06-25', '14:45:00', 'Medio', 'Reporte de clima mensual', 9);

-- PRONOSTICO METEOROLOGICO

INSERT INTO PronosticoMeteorologico VALUES (1, 1, 17.8, 24.6, 60.8, 25.3, 'Norte', 'Nublado')
INSERT INTO PronosticoMeteorologico VALUES (2, 2, 25.5, 2.02, 5.8, 30.3, 'Sur', 'Despejado')
INSERT INTO PronosticoMeteorologico VALUES (3, 3, 20.02, 1.9, 5.8, 20.4, 'Sur', 'Cubierto de Nubes')
INSERT INTO PronosticoMeteorologico VALUES (4, 4, -5.05, 25.6, 80.2, 50.5, 'Este', 'Con precipitaciones')
INSERT INTO PronosticoMeteorologico VALUES (5, 5, -10.02, 25.2, 85.6, 55.1, 'Oeste', 'Con precipitaciones')
INSERT INTO PronosticoMeteorologico VALUES (6, 6, 23.3, 25.3, 82.4, 52.2, 'Este', 'Nublado') 
INSERT INTO PronosticoMeteorologico VALUES (7, 7, 23.3, 25.3, 82.4, 52.2, 'Oeste', 'Despejado') 

-- TIPO EVENTO

INSERT INTO TipoEvento VALUES (1, 'Lluvia Torrencial')
INSERT INTO TipoEvento VALUES (2, 'Inundacion')
INSERT INTO TipoEvento VALUES (3, 'Huaico')
INSERT INTO TipoEvento VALUES (4, 'Graniso')

-- METODO DE PREVENCION DE DANIO

INSERT INTO MetodoPrevencionDanio VALUES (1, 'Poner baldes por donde entre el agua hara que el piso no se inunde', 1)
INSERT INTO MetodoPrevencionDanio VALUES (2, 'Mover a un lugar alto los elementos de mas valor y alejarse de postes electricos', 2)
INSERT INTO MetodoPrevencionDanio VALUES (3, 'Mantenerse en lugares altos mientras acaba el huaico',3)
INSERT INTO MetodoPrevencionDanio VALUES (4, 'Evitar salir a la calle si esta granizando', 4)

-- EVENTO CLIMATICO

INSERT INTO EventoClimatico VALUES (1, 1, 1, 'M', 'Lluvias Fuertes sobre Lima', 0) -- (L)eve, (M)edio o (A)lto
INSERT INTO EventoClimatico VALUES (2, 4, 2, 'M', 'Inundacion sobre Belen, Iquitos', 1)
INSERT INTO EventoClimatico VALUES (3,6,3, 'A','Huaico sobre Puquio, Ayacucho', 1)
INSERT INTO EventoClimatico VALUES (4, 9, 1, 'M', 'Fuerte lluvia por el distrito de Huata', 0)

-- ALERTA
--(V-Verde: posible impacto, A-Amarillo: el usuario debe estar preparado para el evento, R-Roja: el usuario se encuentra en una zona con mayor peligro)
INSERT INTO Alerta VALUES (1, 1, 'V', '2023-06-23', '2023-06-25', '12:20:40', 1)
INSERT INTO Alerta VALUES (2, 2, 'R', '2023-06-24', '2023-12-01', '12:20:50', 1)
INSERT INTO Alerta VALUES (3, 3, 'A', '2023-06-27', '2023-06-30', '12:30:50', 1)
INSERT INTO Alerta VALUES (4, 4, 'A', '2023-06-26', '2023-06-27', '08:00:00', 0)

-- NOTIFICACION
INSERT INTO Notificacion VALUES (1, 1, '2023-06-23', '12:30:13', 'Lluvias Fuertes se ciernen sobre Lima, Lima. Halle Refugio', 1)
INSERT INTO Notificacion VALUES (2, 2, '2023-06-24', '12:40:01', 'Se aproximan inundaciones sobre Belen, Iquitos. No ubicarse cerca de postes de electricidad', 1)
INSERT INTO Notificacion VALUES (3, 3, '2023-06-27', '15:35:10', 'Fuertes Huaico azota, Puquio. Porfavor encontrar una zona segura', 1)
INSERT INTO Notificacion VALUES (4, 4, '2024-06-23', '16:00:30', 'Granizo por la zona de Olmos,Lambayeque. Halle Refugio', 1)


-- USUARIO
INSERT INTO Usuario (idUsuario, nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, nroDocumento, telefonoFijo, telefonoMovil, correo, fechaNacimiento, membresia, idDistrito, idNotificacion)
VALUES (1, 'John', 'Doe', 'Smith', 'DNI', '12345678', '1234567', '987654321', 'john.doe@example.com', '1990-01-01', 1, 1, 1);

INSERT INTO Usuario (idUsuario, nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, nroDocumento, telefonoFijo, telefonoMovil, correo, fechaNacimiento, membresia, idDistrito, idNotificacion)
VALUES (2, 'Jane', 'Smith', 'Doe', 'DNI', '87654321', '7654321', '123456789', 'jane.smith@example.com', '1992-05-15', 1, 4, 2);

INSERT INTO Usuario (idUsuario, nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, nroDocumento, telefonoFijo, telefonoMovil, correo, fechaNacimiento, membresia, idDistrito, idNotificacion)
VALUES (3, 'Michael', 'Johnson', 'Williams', 'DNI', '56789123', '9876543', '456789123', 'michael.johnson@example.com', '1985-09-10', 1, 3, 3);

INSERT INTO Usuario (idUsuario, nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, nroDocumento, telefonoFijo, telefonoMovil, correo, fechaNacimiento, membresia, idDistrito, idNotificacion)
VALUES (4, 'Emily', 'Brown', 'Davis', 'DNI', '98765432', '8765432', '789123456', 'emily.brown@example.com', '1998-03-25', 0, 2, 4);

INSERT INTO Usuario (idUsuario, nombre, apellidoPaterno, apellidoMaterno, tipoDocumento, nroDocumento, telefonoFijo, telefonoMovil, correo, fechaNacimiento, membresia, idDistrito, idNotificacion)
VALUES (5, 'Daniel', 'Wilson', 'Taylor', 'DNI', '54321678', '6543216', '321654987', 'daniel.wilson@example.com', '1994-07-12', 1, 4, 2);

-- TARIFARIO
INSERT INTO Tarifario VALUES (1, 15.4, 'Trimestral', 3)
INSERT INTO Tarifario VALUES (2, 6.70, 'Mensual', 1)
INSERT INTO Tarifario VALUES (3, 26.0,'Semestral', 6)
INSERT INTO Tarifario VALUES (4, 48.9, 'Anual', 12)

-- METODO DE PAGO
INSERT INTO MetodoPago VALUES (1, 'Tarjeta de credito', 72364987, '2027-04-01', 431, 1)
INSERT INTO MetodoPago VALUES (2, 'Tarjeta de debito', 72312345, '2028-03-11', 521, 2)
INSERT INTO MetodoPago VALUES (3, 'Tarjeta de credito', 45575487, '2029-07-03', 897, 3)
INSERT INTO MetodoPago VALUES (4, 'Tarjeta de debito', 45586920, '2026-11-02', 641, 5)

-- COMPROBANTE DE PAGO
INSERT INTO Comprobante_pago VALUES (1, 1, 1, '2023-06-22')
INSERT INTO Comprobante_pago VALUES (2, 2, 2, '2023-07-01')
INSERT INTO Comprobante_pago VALUES (3, 3, 3, '2023-08-13')
INSERT INTO Comprobante_pago VALUES (4, 4, 4, '2023-07-25')

-- VISUALIZAR TABLAS ---------------------------------------------

SELECT * FROM Provincia GO
SELECT * FROM Distrito GO

SELECT * FROM ReporteClima GO
SELECT * FROM PronosticoMeteorologico GO

SELECT * FROM TipoEvento GO
SELECT * FROM MetodoPrevencionDanio GO
SELECT * FROM EventoClimatico GO
SELECT * FROM Alerta GO
SELECT * FROM Notificacion GO

SELECT * FROM Usuario GO
SELECT * FROM Tarifario GO
SELECT * FROM MetodoPago GO
SELECT * FROM Comprobante_pago GO


-- DATA MANIPULATION LANGUAGE ---------------------------------------------

-- Creación de procedimientos almacenados y/o funciones, agregaciones, joins, subconsultas, cursores. Para cada una de las consultas se indica el propósito de la misma

-- 1) Diseñar la función que retorne una tabla indicando la cantidad de usuarios por plan de tarifa.
CREATE FUNCTION	dbo.uf_ObtenerCantUsuarios_PlanTarifa()
RETURNS TABLE
AS
RETURN (
SELECT T.nombrePlan AS [Plan de tarifa], COUNT(MP.idUsuario) AS [Cantidad de usuarios]
FROM Comprobante_pago CP 
INNER JOIN Tarifario T ON CP.idTarifario = T.idTarifario
INNER JOIN MetodoPago MP ON CP.idMetodoPago = MP.idMetodoPago
GROUP BY T.nombrePlan
)
GO

SELECT * FROM uf_ObtenerCantUsuarios_PlanTarifa() GO

-- 2) Diseñar el procedimiento almacenado que permita calcular nuestra ganancia total por el pago de las membresias, en un año determinado
CREATE FUNCTION	dbo.uf_ObtenerTBMembresia_anio( 
@YEAR INT 
)
RETURNS TABLE
AS
RETURN (
	SELECT CP.idComprobante, CP.fechaEmision, T.*, MP.*
	FROM Comprobante_pago CP 
	INNER JOIN Tarifario T ON CP.idTarifario = T.idTarifario
	INNER JOIN MetodoPago MP ON CP.idMetodoPago = MP.idMetodoPago
	WHERE YEAR(CP.fechaEmision) = @YEAR
)

SELECT * FROM uf_ObtenerTBMembresia_anio('2023') GO

CREATE PROCEDURE usp_gananciaTotal_membresia_anio
@YEAR INT,
@GANANCIA INT OUTPUT
AS
	SELECT @GANANCIA = SUM(Tb.Total)
	FROM
	(
		SELECT nombrePlan AS [Plan de tarifa], COUNT(idUsuario) AS [Cantidad de usuarios], Precio AS [Precio de tarifa], COUNT(idUsuario)*Precio AS[Total]
		FROM uf_ObtenerTBMembresia_anio(@YEAR) M
		GROUP BY nombrePlan, Precio
	)Tb
GO

DECLARE @OUTGANANCIA INT
EXEC usp_gananciaTotal_membresia_anio '2023', @GANANCIA = @OUTGANANCIA OUTPUT
PRINT 'La ganancia por el pago de las membresias es de ' + CONVERT(VARCHAR(5), @OUTGANANCIA)

-- 3) Diseñar una función que retorne una tabla mostrando la(s) provincia(s) en donde se ha detectado la maxima cantidad de eventos climaticos
CREATE VIEW vw_tbProvinciasxEventosClimaticos
AS
SELECT P.idProvincia, P.nombre, COUNT(EC.idEvento) AS [Nro Eventos Climaticos]
FROM EventoClimatico EC
INNER JOIN Distrito D ON EC.idDistrito = D.idDistrito
INNER JOIN Provincia P ON D.idProvincia = P.idProvincia
GROUP BY P.idProvincia, P.nombre 
GO

SELECT * FROM vw_tbProvinciasxEventosClimaticos GO

CREATE FUNCTION	dbo.uf_ObtenerProvincia_MaxEventosClimaticos()
RETURNS TABLE
AS
RETURN (
	SELECT Tb.nombre
	FROM vw_tbProvinciasxEventosClimaticos Tb
	WHERE Tb.[Nro Eventos Climaticos] = (
		SELECT MAX(Tb.[Nro Eventos Climaticos])
		FROM vw_tbProvinciasxEventosClimaticos Tb
	)
)
GO

SELECT * FROM uf_ObtenerProvincia_MaxEventosClimaticos()

-- 4) Obtener la lista de usuarios que han recibido una notificación específica.
CREATE FUNCTION ObtenerUsuariosPorNotificacion(@idNotificacion int)
RETURNS TABLE
AS
RETURN
  SELECT u.*
  FROM Usuario u
  JOIN Notificacion n ON u.idNotificacion = n.idNotificacion
  WHERE n.idNotificacion = @idNotificacion;

SELECT * FROM ObtenerUsuariosPorNotificacion(1)

-- 5) Obtener el promedio de temperatura para un distrito en un rango de fechas.

CREATE FUNCTION ObtenerPromedioTemperatura(@idDistrito int, @fechaInicio date, @fechaFin date)
RETURNS DECIMAL(10,2)
AS
BEGIN
  DECLARE @promedioTemperatura DECIMAL(10,2);

  SELECT @promedioTemperatura = AVG(pm.temperatura)
  FROM PronosticoMeteorologico pm
  JOIN ReporteClima rc ON pm.idReporte = rc.idReporte
  WHERE rc.idDistrito = @idDistrito
    AND rc.fecha BETWEEN @fechaInicio AND @fechaFin;

  RETURN @promedioTemperatura;
END;

PRINT 'El promedio de temperatura del distrito es: ' + CONVERT(VARCHAR(5),dbo.ObtenerPromedioTemperatura(1, '2023-01-01', '2023-12-31'))

-- 6) Obtener el nombre de los distritos que tienen al menos una alerta activa.

SELECT d.nombre
FROM Distrito d
JOIN EventoClimatico ec ON d.idDistrito = ec.idDistrito
JOIN Alerta a ON ec.idEvento = a.idEvento
WHERE a.estado = 1;

-- 7) Obtener los distritos junto con la cantidad de usuarios que pertenecen a estos 

Select d.idDistrito, d.nombre, count(*) as nro_usuarios 
from Usuario u  
left join Distrito d on u.idDistrito = d.idDistrito 
Group by d.idDistrito, d.nombre 
Go 
 
-- 8) Devolver la tabla de los eventos climaticos a partir del id de un TipoEvento ingresado (funcion) 

create function dbo.EventosxTipoEvento( 
 	@idTipoEvento int 
) 
returns table 
as  
return 
   Select * 
   from EventoClimatico e  
   Where e.idTipo = @idTipoEvento 
Go 
  
select * from EventosxTipoEvento(1) 
 
-- 9) Mostrar todas las notificaciones en un rango de fechas para un usuario cuyo id es ingresado (procedure) 

create procedure usp_NotifsxIdUsuarioxRangoFechas 
    	      @fecha_ini date, 	
                  @fecha_fin date,		
                  @id_Usuario int 
as 
begin 
	Select * 
            from Notificacion n 
             left join Usuario u on n.idNotificacion = u.idNotificacion 
             where (n.fecha between @fecha_ini and @fecha_fin) 
             and u.idUsuario = @id_Usuario 
end 
Go 
  
Declare 
	@fecha_ini date, 
    @fecha_fin date
Set @fecha_ini = '2023-01-01' 
Set @fecha_fin = '2023-07-01' 
execute usp_NotifsxIdUsuarioxRangoFechas @fecha_ini, @fecha_fin, 1 
Go 


-- 10)Obtener la cantidad de reportes y el nivel de urgencia por cada distrito
SELECT
    D.idDistrito,
    D.nombre AS Nombre_De_Distrito,
    COUNT(r.idReporte) AS Cantidad_De_Reportes,
    R.nivelUrgencia AS Nivel_De_Urgencia
FROM
    Distrito D
LEFT JOIN
    ReporteClima R ON R.idDistrito = D.idDistrito
GROUP BY
    D.idDistrito, D.nombre, R.nivelUrgencia;


-- 11)FUNCION PARA Obtener todos los usuarios con su respectivo método de pago:
CREATE FUNCTION ObtenerUsuariosConMetodoPago()
RETURNS TABLE
AS
RETURN
(
    SELECT
        U.idUsuario,
        CONCAT(U.nombre, ' ', U.apellidoPaterno, ' ', U.apellidoMaterno) AS Nombre_Completo,
        MP.tipo AS tipoMetodoPago,
        MP.credencialTarjeta AS Credencial_De_Tarjeta,
        MP.fechaVencimiento AS Fecha_De_Vencimiento,
        MP.codSeguridad AS Codigo_De_Seguridad
    FROM
        Usuario U
    INNER JOIN
        MetodoPago MP ON U.idUsuario = MP.idUsuario
);
--VER LA FUNCION
SELECT * FROM dbo.ObtenerUsuariosConMetodoPago();
GO


-- 12) PROCEDURE para Obtener todos los métodos de prevención y tipo de evento climático dependiendo del tipo de alerta y estado
CREATE PROCEDURE usp_ObtenerMPrevencionXAlertaEstado
    @tipoAlerta CHAR(1),
    @estadoAlerta BIT
AS
BEGIN
    SELECT
A.tipoAlerta AS TipoAlerta,
        A.estado AS EstadoAlerta,
        TE.descripcion AS TipoEvento,
        MP.descripcion AS MetodoPrevencion
    FROM
        MetodoPrevencionDanio MP
    INNER JOIN
        TipoEvento TE ON MP.TipoEvento_idTipo = TE.idTipo
    INNER JOIN
        EventoClimatico EC ON EC.idTipo = TE.idTipo
    INNER JOIN
        Alerta A ON A.idEvento = EC.idEvento
    WHERE
        A.tipoAlerta = @tipoAlerta
        AND A.estado = @estadoAlerta;
END;
--EJECUTAR DEPENDIENDO DEL tipoAlerta y el estado del mismo
EXEC usp_ObtenerMPrevencionXAlertaEstado @tipoAlerta = 'A', @estadoAlerta = 1;
EXEC usp_ObtenerMPrevencionXAlertaEstado @tipoAlerta = 'R', @estadoAlerta = 1;
EXEC usp_ObtenerMPrevencionXAlertaEstado @tipoAlerta = 'A', @estadoAlerta = 0;


-- 13) Obtener el nombre de los distritos, id evento, grado y descripción de los que tienen al menos un evento climático venidero activo (Simple).

SELECT d.nombre, ec.idEvento, ec.grado, ec.descripcion, ec.eventoVenidero
FROM Distrito d
JOIN EventoClimatico ec ON d.idDistrito = ec.idDistrito
AND ec.eventoVenidero = 1;


-- 14) Función para obtener a los usuarios dependiendo de la provincia a la que pertenece.

CREATE FUNCTION OUsuariosPorProvincia(@nombreProvincia VARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT U.idUsuario, U.nombre, U.apellidoPaterno, U.apellidoMaterno, U.correo, U.telefonoMovil, U.idDistrito,
           P.nombre AS nombreProvincia
    FROM Usuario U
    INNER JOIN Distrito D ON U.idDistrito = D.idDistrito
    INNER JOIN Provincia P ON D.idProvincia = P.idProvincia
    WHERE P.nombre = @nombreProvincia
);

SELECT * FROM OUsuariosPorProvincia('Huancayo');


-- 15) Muestra datos relevantes de pronóstico meteorológico y reporte clima en el transcurso del tiempo solicitado.

CREATE FUNCTION obtenerClimaticaporanio(@fechaInicio DATE, @fechaFin DATE)
RETURNS TABLE
AS
RETURN (
    SELECT PM.*, RC.fecha, RC.hora, RC.descripcion
    FROM PronosticoMeteorologico PM
    INNER JOIN ReporteClima RC ON PM.idReporte = RC.idReporte
    WHERE RC.fecha BETWEEN @fechaInicio AND @fechaFin
);

SELECT * FROM obtenerClimaticaporanio('2023-01-01', '2023-12-31');

