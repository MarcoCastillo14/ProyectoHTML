CREATE PROCEDURE GridDetalles
AS
BEGIN
    SELECT * FROM Usuarios;
END;

SELECT * FROM Usuarios;
SELECT * FROM Tecnicos;
SELECT * FROM Reparaciones;
SELECT * FROM Equipos;
SELECT * FROM DetallesReparacion;
SELECT * FROM Asignaciones;

Drop table Usuarios
Drop table Tecnicos
Drop table Equipos
Drop table Reparaciones
Drop table DetallesReparacion
Drop table Asignaciones

Create table Usuarios(
UsuarioID int identity primary key,
Nombre varchar(25) not null,
Correo varchar(50) null,
Telefono char(8) null
)
Create table Equipos(
EquipoID int identity primary key,
UsuarioID int foreign key references Usuarios(UsuarioID),
TipoEquipo varchar(50) not null,
Modelo varchar(50) null
)
Create table Tecnicos(
TecnicoID int identity primary key,
Nombre varchar(25) not null,
Especialidad varchar(25) null
)
Create table Reparaciones(
ReparacionID int identity primary key,
EquipoID int foreign key references Equipos(EquipoID),
FechaSolicitud date not null,
Estado varchar(20) not null
)
Create table DetallesReparacion(
DetalleID int identity primary key,
ReparacionID int foreign key references Reparaciones(ReparacionID),
Descripcion varchar(50) null,
FechaInicio date not null,
FechaFin date null
)
Create table Asignaciones(
AsignacionID int identity primary key,
ReparacionID int foreign key references Reparaciones(ReparacionID),
TecnicoID int foreign key references Tecnicos(TecnicoID),
FechaAsignacion date not null
)
Drop Procedure Solicitudes
Drop Procedure PorAsignar
Drop Procedure Completada
Drop Procedure Pendientes

CREATE PROCEDURE Solicitudes
AS
BEGIN
SELECT 
    r.ReparacionID AS Reparacion,
	a.AsignacionID AS Asignacion,
    u.Nombre AS Nombre, 
    COALESCE(t.Nombre, 'No asignado') AS Tecnico,
    r.FechaSolicitud AS Fecha,
    r.Estado AS Estado
FROM Reparaciones r
JOIN 
    Equipos E ON R.EquipoID = E.EquipoID
JOIN 
    Usuarios U ON E.UsuarioID = U.UsuarioID
LEFT JOIN Asignaciones a ON r.ReparacionID = a.ReparacionID
LEFT JOIN Tecnicos t ON a.TecnicoID = t.TecnicoID
END;


CREATE PROCEDURE PorAsignar
AS
BEGIN
SELECT 
    r.ReparacionID AS Reparacion,
	a.AsignacionID AS Asignacion,
    u.Nombre AS Nombre, 
    COALESCE(t.Nombre, 'No asignado') AS Tecnico,
    r.FechaSolicitud AS Fecha,
    r.Estado AS Estado
FROM Reparaciones r
JOIN 
    Equipos E ON R.EquipoID = E.EquipoID
JOIN 
    Usuarios U ON E.UsuarioID = U.UsuarioID
LEFT JOIN Asignaciones a ON r.ReparacionID = a.ReparacionID
LEFT JOIN Tecnicos t ON a.TecnicoID = t.TecnicoID
WHERE r.Estado = 'Por Asignar';
END;


CREATE PROCEDURE Completada
AS
BEGIN
SELECT 
    r.ReparacionID AS Reparacion,
	a.AsignacionID AS Asignacion,
    u.Nombre AS Nombre, 
    COALESCE(t.Nombre, 'No asignado') AS Tecnico,
    r.FechaSolicitud AS Fecha,
    r.Estado AS Estado
FROM Reparaciones r
JOIN 
    Equipos E ON R.EquipoID = E.EquipoID
JOIN 
    Usuarios U ON E.UsuarioID = U.UsuarioID
LEFT JOIN Asignaciones a ON r.ReparacionID = a.ReparacionID
LEFT JOIN Tecnicos t ON a.TecnicoID = t.TecnicoID
WHERE r.Estado = 'Completada';
END;


CREATE PROCEDURE Pendientes
AS
BEGIN
SELECT 
    r.ReparacionID AS Reparacion,
	a.AsignacionID AS Asignacion,
    u.Nombre AS Nombre, 
    COALESCE(t.Nombre, 'No asignado') AS Tecnico,
    r.FechaSolicitud AS Fecha,
    r.Estado AS Estado
FROM Reparaciones r
JOIN 
    Equipos E ON R.EquipoID = E.EquipoID
JOIN 
    Usuarios U ON E.UsuarioID = U.UsuarioID
LEFT JOIN Asignaciones a ON r.ReparacionID = a.ReparacionID
LEFT JOIN Tecnicos t ON a.TecnicoID = t.TecnicoID
WHERE r.Estado = 'Pendiente';
END;


CREATE PROCEDURE GridUsuariosID
AS
BEGIN
select UsuarioID, Nombre from Usuarios
END;

CREATE PROCEDURE DLUser
AS
BEGIN
select UsuarioID from Usuarios
END;

CREATE PROCEDURE DLEquipo
AS
BEGIN
select EquipoID from Equipos
END;


CREATE PROCEDURE GridEquiposID
AS
BEGIN
select
E.EquipoID As EquipoID,
U.Nombre AS Usuario,
E.TipoEquipo AS Tipo,
E.Modelo AS Modelo
FROM 
Equipos E
Join Usuarios U ON E.UsuarioID = U.UsuarioID
END;

CREATE PROCEDURE DLReparacion
AS
BEGIN
select ReparacionID from Reparaciones
END;

CREATE PROCEDURE DLEquipo
AS
BEGIN
select EquipoID from Equipos
END;

CREATE PROCEDURE GridReparacionID
AS
BEGIN
select 
R.ReparacionID AS ReparacionID,
R.EquipoID AS EquipoID,
E.TipoEquipo AS Equipo,
U.Nombre AS Usuario,
R.Estado AS Estado
FROM
Reparaciones R
JOIN Equipos E ON R.EquipoID=E.EquipoID
JOIN Usuarios U ON E.UsuarioID= U.UsuarioID
END;


CREATE PROCEDURE DLTecnicos
AS
BEGIN
select TecnicoID from Tecnicos
END;

CREATE PROCEDURE BUser
    @Nombre varchar(25)
AS
BEGIN
    SELECT * 
    FROM Usuarios
    WHERE Nombre LIKE '%' + @Nombre + '%';
END;

CREATE PROCEDURE BEquipos
    @ID int
AS
BEGIN
    SELECT * 
    FROM Equipos
    WHERE UsuarioID = @ID ;
END;

CREATE PROCEDURE BTecnico
    @Nombre varchar(25)
AS
BEGIN
    SELECT * 
    FROM Tecnicos
    WHERE Nombre LIKE '%' + @Nombre + '%';
END;

CREATE PROCEDURE BReparacion
    @Estado varchar(20)
AS
BEGIN
    SELECT * 
    FROM Reparaciones
    WHERE Estado = @Estado ;
END;

CREATE PROCEDURE BDetalle
    @ID int
AS
BEGIN
    SELECT * 
    FROM DetallesReparacion
    WHERE ReparacionID = @ID ;
END;


CREATE PROCEDURE BAsignacion
    @ID int
AS
BEGIN
    SELECT * 
    FROM Asignaciones
    WHERE ReparacionID = @ID ;
END;

CREATE PROCEDURE MUser
    @ID int
AS
BEGIN
    SELECT * 
    FROM Usuarios
    WHERE UsuarioID = @ID ;
END;

CREATE PROCEDURE MTecnicos
    @ID int
AS
BEGIN
    SELECT * 
    FROM Tecnicos
    WHERE TecnicoID = @ID ;
END;

CREATE PROCEDURE MEquipos
    @ID int
AS
BEGIN
    SELECT * 
    FROM Equipos
    WHERE EquipoID = @ID ;
END;

CREATE PROCEDURE MReparaciones
    @ID int
AS
BEGIN
    SELECT * 
    FROM Reparaciones
    WHERE ReparacionID = @ID ;
END;

CREATE PROCEDURE MDetalles
    @ID int
AS
BEGIN
    SELECT * 
    FROM DetallesReparacion
    WHERE DetalleID = @ID ;
END;

CREATE PROCEDURE MAsignacion
    @ID int
AS
BEGIN
    SELECT * 
    FROM Asignaciones
    WHERE AsignacionID = @ID ;
END;

select * from Equipos where UsuarioID=50

ALTER TABLE Equipos 
ADD CONSTRAINT FK_Equipos_Usuarios 
FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID) 
ON DELETE CASCADE;


ALTER TABLE Reparaciones 
ADD CONSTRAINT FK_Reparaciones_Equipos 
FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID) 
ON DELETE CASCADE;


ALTER TABLE DetallesReparacion 
ADD CONSTRAINT FK_DetallesReparacion_Reparaciones 
FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID) 
ON DELETE CASCADE;


ALTER TABLE Asignaciones 
ADD CONSTRAINT FK_Asignaciones_Reparaciones 
FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID) 
ON DELETE CASCADE;


ALTER TABLE Asignaciones 
ADD CONSTRAINT FK_Asignaciones_Tecnicos 
FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID) 
ON DELETE CASCADE;


CREATE PROCEDURE AdiUser
    @Nombre VARCHAR(25),
    @Correo VARCHAR(50) = NULL,
    @Telefono CHAR(8) = NULL
AS
BEGIN
    INSERT INTO Usuarios (Nombre, Correo, Telefono)
    VALUES (@Nombre, @Correo, @Telefono);
END;

CREATE PROCEDURE AdiEquipo
    @UsuarioID INT,
    @TipoEquipo VARCHAR(50),
    @Modelo VARCHAR(50) = NULL
AS
BEGIN
    INSERT INTO Equipos (UsuarioID, TipoEquipo, Modelo)
    VALUES (@UsuarioID, @TipoEquipo, @Modelo);
END;

CREATE PROCEDURE AdiTecnico
    @Nombre VARCHAR(25),
    @Especialidad VARCHAR(25) = NULL
AS
BEGIN
    INSERT INTO Tecnicos (Nombre, Especialidad)
    VALUES (@Nombre, @Especialidad);
END;

CREATE PROCEDURE AdiReparacion
    @EquipoID INT,
    @FechaSolicitud DATE,
    @Estado VARCHAR(20)
AS
BEGIN
    INSERT INTO Reparaciones (EquipoID, FechaSolicitud, Estado)
    VALUES (@EquipoID, @FechaSolicitud, @Estado);
END;

CREATE PROCEDURE AdiDetalle
    @ReparacionID INT,
    @Descripcion VARCHAR(50) = NULL,
    @FechaInicio DATE,
    @FechaFin DATE = NULL
AS
BEGIN
    INSERT INTO DetallesReparacion (ReparacionID, Descripcion, FechaInicio, FechaFin)
    VALUES (@ReparacionID, @Descripcion, @FechaInicio, @FechaFin);
END;

Drop PROCEDURE AdiAsignacion

CREATE PROCEDURE AdiAsignacion
    @ReparacionID INT,
    @TecnicoID INT,
    @FechaAsignacion DATE
AS
BEGIN
    INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaAsignacion);
	UPDATE Reparaciones
	SET Estado='Pendiente' 
	WHERE ReparacionID=@ReparacionID AND Estado='Por Asignar'
END;


CREATE PROCEDURE UpdateUsuario
    @UsuarioID INT,
    @Nombre VARCHAR(25) = NULL,
    @Correo VARCHAR(50) = NULL,
    @Telefono CHAR(8) = NULL
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = COALESCE(@Nombre, Nombre),
	Correo = COALESCE(@Correo, Correo),
    Telefono = COALESCE(@Telefono, Telefono)
    WHERE UsuarioID = @UsuarioID;
END;


CREATE PROCEDURE UpdateTecnico
    @TecnicoID INT,
    @Nombre VARCHAR(25) = NULL,
    @Especialidad VARCHAR(25) = NULL
AS
BEGIN
    UPDATE Tecnicos
    SET Nombre = COALESCE(@Nombre, Nombre),
        Especialidad = COALESCE(@Especialidad, Especialidad)
    WHERE TecnicoID = @TecnicoID;
END;

CREATE PROCEDURE UpdateEquipo
    @EquipoID INT,
    @UsuarioID INT = NULL,
    @TipoEquipo VARCHAR(50) = NULL,
    @Modelo VARCHAR(50) = NULL
AS
BEGIN
    UPDATE Equipos
    SET UsuarioID = COALESCE(@UsuarioID, UsuarioID),
        TipoEquipo = COALESCE(@TipoEquipo, TipoEquipo),
        Modelo = COALESCE(@Modelo, Modelo)
    WHERE EquipoID = @EquipoID;
END;

CREATE PROCEDURE UpdateReparacion
    @ReparacionID INT,
    @EquipoID INT = NULL,
    @FechaSolicitud DATE = NULL,
    @Estado VARCHAR(20) = NULL
AS
BEGIN
    UPDATE Reparaciones
    SET EquipoID = COALESCE(@EquipoID, EquipoID),
        FechaSolicitud = COALESCE(@FechaSolicitud, FechaSolicitud),
        Estado = COALESCE(@Estado, Estado)
    WHERE ReparacionID = @ReparacionID;
END;

CREATE PROCEDURE UpdateDetalle
    @DetalleID INT,
    @ReparacionID INT = NULL,
    @Descripcion VARCHAR(50) = NULL,
    @FechaInicio DATE = NULL,
    @FechaFin DATE = NULL
AS
BEGIN
    UPDATE DetallesReparacion
    SET ReparacionID = COALESCE(@ReparacionID, ReparacionID),
        Descripcion = COALESCE(@Descripcion, Descripcion),
        FechaInicio = COALESCE(@FechaInicio, FechaInicio),
        FechaFin = COALESCE(@FechaFin, FechaFin)
    WHERE DetalleID = @DetalleID;
END;

CREATE PROCEDURE UpdateAsignacion
    @AsignacionID INT,
    @ReparacionID INT = NULL,
    @TecnicoID INT = NULL,
    @FechaAsignacion DATE = NULL
AS
BEGIN
    UPDATE Asignaciones
    SET ReparacionID = COALESCE(@ReparacionID, ReparacionID),
        TecnicoID = COALESCE(@TecnicoID, TecnicoID),
        FechaAsignacion = COALESCE(@FechaAsignacion, FechaAsignacion)
    WHERE AsignacionID = @AsignacionID;
END;


CREATE PROCEDURE DelUsuario
    @UsuarioID INT
AS
BEGIN
    DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID;
END;


CREATE PROCEDURE DelTecnico
    @TecnicoID INT
AS
BEGIN
    DELETE FROM Tecnicos WHERE TecnicoID = @TecnicoID;
END;

CREATE PROCEDURE DelEquipo
    @EquipoID INT
AS
BEGIN
    DELETE FROM Equipos WHERE EquipoID = @EquipoID;
END;

CREATE PROCEDURE DelReparacion
    @ReparacionID INT
AS
BEGIN
    DELETE FROM Reparaciones WHERE ReparacionID = @ReparacionID;
END;

CREATE PROCEDURE DelDetalle
    @DetalleID INT
AS
BEGIN
    DELETE FROM DetallesReparacion WHERE DetalleID = @DetalleID;
END;

CREATE PROCEDURE DelAsignacion
    @AsignacionID INT
AS
BEGIN
    DELETE FROM Asignaciones WHERE AsignacionID = @AsignacionID;
END;

INSERT INTO Usuarios (Nombre, Correo, Telefono) VALUES
('Carlos López', 'carlos.lopez@email.com', '12345678'),
('María Fernández', 'maria.fernandez@email.com', '23456789'),
('José Martínez', 'jose.martinez@email.com', '34567890'),
('Laura Sánchez', 'laura.sanchez@email.com', '45678901'),
('Pedro Ramírez', 'pedro.ramirez@email.com', '56789012'),
('Ana Torres', 'ana.torres@email.com', '67890123'),
('Luis Gómez', 'luis.gomez@email.com', '78901234'),
('Carmen Díaz', 'carmen.diaz@email.com', '89012345'),
('Jorge Herrera', 'jorge.herrera@email.com', '90123456'),
('Elena Castro', 'elena.castro@email.com', '12345098'),
('Roberto Ruiz', 'roberto.ruiz@email.com', '23456098'),
('Patricia Jiménez', 'patricia.jimenez@email.com', '34567098'),
('Diego Morales', 'diego.morales@email.com', '45678098'),
('Andrea Vargas', 'andrea.vargas@email.com', '56789098'),
('Francisco Mendoza', 'francisco.mendoza@email.com', '67890198');


INSERT INTO Equipos (UsuarioID, TipoEquipo, Modelo) VALUES
(1, 'Celulares', 'Samsung Galaxy S23'),
(2, 'Celulares', 'iPhone 14'),
(3, 'Celulares', 'Xiaomi Redmi Note 12'),
(4, 'Celulares', 'Google Pixel 7'),
(5, 'Celulares', 'OnePlus 11'),
(6, 'Televisores', 'LG OLED C2'),
(7, 'Televisores', 'Samsung QLED Q80B'),
(8, 'Televisores', 'Sony Bravia XR'),
(9, 'Televisores', 'Hisense U8H'),
(10, 'Televisores', 'TCL 6-Series'),
(11, 'Computadoras', 'Dell XPS 15'),
(12, 'Computadoras', 'MacBook Pro 16'),
(13, 'Computadoras', 'Lenovo ThinkPad X1'),
(14, 'Computadoras', 'HP Spectre x360'),
(15, 'Computadoras', 'Asus ROG Zephyrus G15'),
(1, 'Otros', 'Mouse Razer'),
(3, 'Otros', 'Teclado Logitech'),
(5, 'Otros', 'Monitor Samsung 27"'),
(7, 'Otros', 'Router TP-Link'),
(9, 'Otros', 'Webcam Logitech C920');


INSERT INTO Tecnicos (Nombre, Especialidad) VALUES
('Sergio Rodríguez', 'Celulares'),
('Alberto Vázquez', 'Televisores'),
('Fernanda Castillo', 'Computadoras'),
('Gabriel Pérez', 'Celulares'),
('Lucía Ramírez', 'Computadoras');


INSERT INTO Reparaciones (EquipoID, FechaSolicitud, Estado) VALUES
(1, '2025-02-03', 'Por Asignar'),
(2, '2025-02-05', 'Pendiente'),
(3, '2025-02-08', 'Completada'),
(4, '2025-02-10', 'Por Asignar'),
(5, '2025-02-14', 'Pendiente'),
(6, '2025-02-17', 'Completada'),
(7, '2025-02-20', 'Por Asignar'),
(8, '2025-02-23', 'Pendiente'),
(9, '2025-02-25', 'Completada'),
(10, '2025-02-28', 'Por Asignar'),
(11, '2025-03-02', 'Pendiente'),
(12, '2025-03-05', 'Completada'),
(13, '2025-03-08', 'Por Asignar'),
(14, '2025-03-10', 'Pendiente'),
(15, '2025-03-13', 'Completada'),
(16, '2025-03-16', 'Pendiente'),
(17, '2025-03-18', 'Completada'),
(18, '2025-03-20', 'Pendiente'),
(19, '2025-03-21', 'Completada'),
(20, '2025-03-22', 'Pendiente');


INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion) VALUES
(2, 1, '2025-02-06'),
(3, 1, '2025-02-09'),
(5, 4, '2025-02-15'),
(6, 4, '2025-02-18'),
(8, 2, '2025-02-24'),
(9, 2, '2025-02-26'),
(11, 3, '2025-03-03'),
(12, 3, '2025-03-06'),
(14, 5, '2025-03-11'),
(15, 5, '2025-03-14'),
(16, 3, '2025-03-17'),
(17, 3, '2025-03-19'),
(18, 2, '2025-03-20'),
(19, 1, '2025-03-21'),
(20, 4, '2025-03-22');


INSERT INTO DetallesReparacion (ReparacionID, Descripcion, FechaInicio, FechaFin) VALUES
(1, 'Pantalla rota', '2025-02-04', NULL),
(2, 'Batería dañada', '2025-02-06', NULL),
(3, 'No enciende', '2025-02-09', '2025-02-12'),
(4, 'Botones no funcionan', '2025-02-11', NULL),
(5, 'Carga defectuosa', '2025-02-15', NULL),
(6, 'Fallo en el software', '2025-02-18', '2025-02-22'),
(7, 'Pantalla negra', '2025-02-21', NULL),
(8, 'Sin sonido', '2025-02-24', NULL),
(9, 'Imagen distorsionada', '2025-02-26', '2025-02-28'),
(10, 'No reconoce USB', '2025-02-28', NULL),
(11, 'Fallo en la red', '2025-03-03', NULL),
(12, 'Problema con drivers', '2025-03-06', '2025-03-09'),
(13, 'Teclas no responden', '2025-03-09', NULL),
(14, 'Altavoces dañados', '2025-03-11', NULL),
(15, 'Fallo en la GPU', '2025-03-14', '2025-03-16'),
(16, 'No enciende', '2025-03-17', NULL),
(17, 'Carga intermitente', '2025-03-19', '2025-03-21'),
(18, 'Se apaga solo', '2025-03-20', NULL),
(19, 'WiFi no funciona', '2025-03-21', '2025-03-23'),
(20, 'Problema de conexión HDMI', '2025-03-22', NULL);

