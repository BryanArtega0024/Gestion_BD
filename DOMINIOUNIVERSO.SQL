
CREATE DATABASE HOTEL_n
USE HOTEL_n

GO


CREATE TABLE MODO_PAGO
(
Id_Modo_Pago INT PRIMARY KEY,
Modo_Pago VARCHAR(50),
)


CREATE TABLE TIPO_HABITACION
(
Id_Tipo_Habitacion INT PRIMARY KEY,
Tipo VARCHAR(50),
Numero_Cama VARCHAR(50), 
)

CREATE TABLE MINI_RESTAURANTE 
(
Id_Mini_Restaurante INT PRIMARY KEY,
Nombre VARCHAR(50),
Telefono VARCHAR(50),
)

CREATE TABLE HOTEL
(
Id_Hotel INT PRIMARY KEY,
Nombre VARCHAR(50),
Direccion VARCHAR(50),
Telefono VARCHAR(50),
Id_Mini_Restaurante INT,
CONSTRAINT FK_Id_Mini_Restaurante FOREIGN KEY (Id_Mini_Restaurante) REFERENCES MINI_RESTAURANTE (Id_Mini_Restaurante)
)


CREATE TABLE TIPO_EMPLEADO
(
Id_Tipo_Empleado INT PRIMARY KEY,
Cargo VARCHAR(50),
Salario MONEY,
)


CREATE TABLE EMPLEADO
(
Id_Empleado INT PRIMARY KEY,
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Fecha_Nacimiento DATE ,
Sexo CHAR(50),
Telefono VARCHAR(50),
Direccion VARCHAR(50),
Tarjeta_Identidad VARCHAR(50),
Turno VARCHAR(50),
Correo VARCHAR (50),
Id_Hotel INT,
Id_Tipo_Empleado INT
CONSTRAINT FK_Id_Hotel FOREIGN KEY (Id_Hotel) REFERENCES HOTEL(Id_Hotel),
CONSTRAINT FK_Id_Tipo_Empleado FOREIGN KEY (Id_Tipo_Empleado) REFERENCES TIPO_EMPLEADO (Id_Tipo_Empleado)
)

CREATE TABLE CLIENTE
(
Id_Cliente INT PRIMARY KEY,
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Telefono VARCHAR(50),
Tarjeta_Identidad VARCHAR(50),
Direccion VARCHAR (50),
Id_Modo_Pago INT,
Id_Empleado INT,
CONSTRAINT FK_Id_Empleado FOREIGN KEY (Id_Empleado) REFERENCES EMPLEADO (Id_Empleado),
CONSTRAINT FK_Id_Modo_Pago2 FOREIGN KEY (Id_Modo_Pago) REFERENCES MODO_PAGO (Id_Modo_Pago)
)



CREATE TABLE SERVICIO
(
Id_Servicio INT PRIMARY KEY,
Tipo_Servicio VARCHAR(50),
Precio_Servicio MONEY,
Descripcion VARCHAR(50),
Id_Modo_Pago INT,
CONSTRAINT FK_Id_Modo_Pago3 FOREIGN KEY (Id_Modo_Pago) REFERENCES MODO_PAGO (Id_Modo_Pago)
)


CREATE TABLE HABITACION
(
Id_Habitacion INT PRIMARY KEY,
Numero_Habitacion VARCHAR(50),
Id_Hotel INT,
Id_Tipo_Habitacion INT,
CONSTRAINT FK_Id_Hotel1 FOREIGN KEY (Id_Hotel) REFERENCES HOTEL (Id_Hotel),
CONSTRAINT FK_Id_Tipo_Habitacion FOREIGN KEY (Id_Tipo_Habitacion) REFERENCES TIPO_HABITACION (Id_Tipo_Habitacion)
)

CREATE TABLE CLIENTE_HABITACION
(
Id_Cliente_Habitacion INT PRIMARY KEY,
Fecha_Entrada VARCHAR(50),
Fecha_Salida VARCHAR(50),
Id_Cliente INT,
Id_Habitacion INT,
Id_Modo_Pago INT,
CONSTRAINT FK_Id_Cliente2  FOREIGN KEY (Id_Cliente ) REFERENCES CLIENTE (Id_Cliente),
CONSTRAINT FK_Id_Habitacion  FOREIGN KEY (Id_Habitacion) REFERENCES HABITACION (Id_Habitacion),
CONSTRAINT FK_Id_Modo_Pago FOREIGN KEY (Id_Modo_Pago) REFERENCES MODO_PAGO (Id_Modo_Pago),
)

******************************************************************************************************************************************



--Llenado de la tabla MODO_PAGO
INSERT INTO MODO_PAGO VALUES(101,'Tarjeta')
INSERT INTO MODO_PAGO VALUES(202,'Efectivo')
INSERT INTO MODO_PAGO VALUES(303,'Cheques')



--Llenado de la tabla TIPO HABITACION
INSERT INTO TIPO_HABITACION VALUES (1,'Habitacion Individual','1')
INSERT INTO TIPO_HABITACION VALUES (2,'Habitacion Doble','2')
INSERT INTO TIPO_HABITACION VALUES (3,'Habitacion Triple','3')
INSERT INTO TIPO_HABITACION VALUES (4,'Junior Suites','1')
INSERT INTO TIPO_HABITACION VALUES (5,'Suites Presidencial','4')


select * from CLIENTE_HABITACION

--Llenado de la tabla MINI_RESTAURANTE
INSERT INTO MINI_RESTAURANTE VALUES (255,'R_n','22382036')


--Llenado de la tabla HOTEL
INSERT INTO HOTEL VALUES (1,'N_ART','Calle Morelos 7ma y 8va avenida',
'22382035',255) 


--Llenado de la tabla TIPO_EMPLEADO
INSERT INTO TIPO_EMPLEADO VALUES (1,'Recepcionista',950)
INSERT INTO TIPO_EMPLEADO VALUES (2,'Botones',600)
INSERT INTO TIPO_EMPLEADO VALUES (3,'Limpieza',500)
INSERT INTO TIPO_EMPLEADO VALUES (4,'Seguridad',900)
INSERT INTO TIPO_EMPLEADO VALUES (5,'Chef',1500)
INSERT INTO TIPO_EMPLEADO VALUES (6,'Meseros',800)
INSERT INTO TIPO_EMPLEADO VALUES (7,'Bartender',1000)

--Llenado de la tabla EMPLEADO
INSERT INTO EMPLEADO VALUES (1,'Bryan','Zambrano','13/01/1957','M','98563254','Santa Marta','0801-1236-96523','Matutino','Br@hotmail.com',1,1)
INSERT INTO EMPLEADO VALUES (2,'Pedro','Salazar','13/01/1960','M','33659863','Taqui','0801-2365-96533','Matutino','ped@hotmail.com',1,2)
INSERT INTO EMPLEADO VALUES (3,'Marta','Rivera','13/01/1958','F','96526655','Los Geraneos','0601-1362-98655','Vespertino','mara@hotmail.com',1,3)
INSERT INTO EMPLEADO VALUES (4,'Mery','Murillo','13/01/1975','F','33223322','Cuba','0801-0123-12544','Nocturno','mee@hotmail.com',1,4)
INSERT INTO EMPLEADO VALUES (5,'Fernando','Medina','13/01/1980','M','96999985','Ulbiorrios','0801-1256-11125','Matutino','fer@hotmail.com',1,5)
INSERT INTO EMPLEADO VALUES (6,'Fernanda','Arteaga','13/01/1987','F','98578596','San Pedro','0801-1236-11452','Matutino','mart@hotmail.com',1,6)
INSERT INTO EMPLEADO VALUES (7,'Alisson','Lopez','13/01/1995','F','33256988','Altamira','0801-1236-88955','Vespertino','ali@hotmail.com',1,6)
INSERT INTO EMPLEADO VALUES (8,'Lisa','Zambrano','13/01/2000','F','96528899','El Palmar','0801-1995-12596','Vespertino','lis@hotmail.com',1,7)
INSERT INTO EMPLEADO VALUES (9,'Juan','Tomala','13/01/1999','M','99885599','Ulbiorrio','0801-1562-19566','Nocturno','toj@hotmail.com',1,6)
INSERT INTO EMPLEADO VALUES (10,'Diego','Mendoza','13/01/1959','M','96200012','Los Geraneos','0601-1356-12563','Nocturno','mendoza_p@hotmail.com',1,6)



--Llenado de la tabla CLIENTE
INSERT INTO CLIENTE VALUES (1,'Alex','Casas','96356985','0801-1998-25639','Los Geraneos',101,1)
INSERT INTO CLIENTE VALUES (2,'Maria','Lopez','33658962','0801-1845-03625','Ulbiorrios',101,2)
INSERT INTO CLIENTE VALUES (3,'Jordana','Ramirez','33269865','0601-1956-25369','Cuba',202,3)
INSERT INTO CLIENTE VALUES (4,'Mario','Espinales','96528697','0801-1991-05021','Choloma',202,4)
INSERT INTO CLIENTE VALUES (5,'Katherine','Zambrano','33201546','0612-1896-25369','San Pedro',202,5)
INSERT INTO CLIENTE VALUES (6,'Dayana','Muñoz','98969299','0801-1996-01526','Floron',303,6)
INSERT INTO CLIENTE VALUES (7,'Leodan','Medina','33447070','0801-1999-15263','Altamira',303,7)
INSERT INTO CLIENTE VALUES (8,'Genesis','Mendoza','96959897','0801-2001-15263','La Revancha',202,8)
INSERT INTO CLIENTE VALUES (9,'Karol','Lopez','96352610','0601-2563-96589','Gracias a Dios',202,9)
INSERT INTO CLIENTE VALUES (10,'Maximiliano','Medina','97130160','0801-1972-07482','Valle de angeles',303,10)

--Llenado de la tabla Servicio
INSERT INTO SERVICIO VALUES (1,'internet','10','por dia',101)
INSERT INTO SERVICIO VALUES (2,'Limpieza','20','por una dia',101)
INSERT INTO SERVICIO VALUES (3,'Seguridad','20','por dia',202)
INSERT INTO SERVICIO VALUES (4,'Atencion','20','por dia',202)
INSERT INTO SERVICIO VALUES (5,'Telefono','1', 'por hora',202)
INSERT INTO SERVICIO VALUES (6,'CableTV','5','por dia',202)
INSERT INTO SERVICIO VALUES (7,'Lavanderia','5','por hora',303)
INSERT INTO SERVICIO VALUES (8,'Secador de Cabello','10','por servicio',202)
INSERT INTO SERVICIO VALUES (9,'Gimnasio','2','por hora',303)
INSERT INTO SERVICIO VALUES (10,'Spa','10','por servicio',101)

--Llenado de la tabla HABITACION
INSERT INTO HABITACION VALUES (1,1501,1,5)
INSERT INTO HABITACION VALUES (2,1052,1,2)
INSERT INTO HABITACION VALUES (3,1503,1,4)
INSERT INTO HABITACION VALUES (4,1504,1,3)
INSERT INTO HABITACION VALUES (5,1505,1,5)
INSERT INTO HABITACION VALUES (6,1506,1,1)
INSERT INTO HABITACION VALUES (7,1507,1,2)
INSERT INTO HABITACION VALUES (8,1508,1,3)
INSERT INTO HABITACION VALUES (9,1509,1,4)
INSERT INTO HABITACION VALUES (10,1601,1,5)


--Llenado de la tabla CLIENTE_HABITACION
INSERT INTO CLIENTE_HABITACION VALUES (1,'20/03/2020','21/03/2020',1,1,101)
INSERT INTO CLIENTE_HABITACION VALUES (2,'25/01/2020','29/01/2020',2,2,101)
INSERT INTO CLIENTE_HABITACION VALUES (3,'10/01/2020','11/02/2020',3,3,202)
INSERT INTO CLIENTE_HABITACION VALUES (4,'15/03/2020','17/03/2020',4,4,303)
INSERT INTO CLIENTE_HABITACION VALUES (5,'20/10/2020','29/10/2020',5,5,303)
INSERT INTO CLIENTE_HABITACION VALUES (6,'21/11/2020','22/11/2020',6,6,101)
INSERT INTO CLIENTE_HABITACION VALUES (7,'13/10/2020','15/10/2020',7,7,202)
INSERT INTO CLIENTE_HABITACION VALUES (8,'13/10/2020','15/10/2020',8,8,303)
INSERT INTO CLIENTE_HABITACION VALUES (9,'02/04/2020','05/04/2020',9,9,101)
INSERT INTO CLIENTE_HABITACION VALUES (10,'11/07/2020','15/07/2020',10,10,202)


**************************************************************************************************************************************************************
SELECT CLIENTE.Id_Cliente, CLIENTE.Nombre, CLIENTE.Apellido, CLIENTE_HABITACION.Fecha_Entrada, CLIENTE_HABITACION.Fecha_Salida
FROM     CLIENTE_HABITACION INNER JOIN
                  CLIENTE ON CLIENTE_HABITACION.Id_Cliente = CLIENTE.Id_Cliente
				  where (Fecha_Entrada >'01/07/2020' and  Fecha_Salida <= '15/07/2020' )
				  order by Fecha_Entrada;


---------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT DATEDIFF(YEAR,EMPLEADO.Fecha_Nacimiento,GETDATE()) AS Edad ,  EMPLEADO.Nombre, EMPLEADO.Apellido, 
EMPLEADO.Sexo, EMPLEADO.Turno, TIPO_EMPLEADO.Cargo, TIPO_EMPLEADO.Salario,EMPLEADO.Fecha_Nacimiento

FROM     EMPLEADO INNER JOIN
                 TIPO_EMPLEADO ON EMPLEADO.Id_Tipo_Empleado = TIPO_EMPLEADO.Id_Tipo_Empleado
 where ( Fecha_Nacimiento<'1960-01-03' and Sexo ='M')
 order by Edad
				  
----------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT TIPO_HABITACION.Tipo , COUNT (HABITACION.Id_Tipo_Habitacion) AS CANTIDAD 
FROM HABITACION inner join TIPO_HABITACION ON HABITACION.Id_Tipo_Habitacion = TIPO_HABITACION.Id_Tipo_Habitacion
GROUP BY TIPO_HABITACION.Tipo
order by CANTIDAD

----------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT TIPO_EMPLEADO.Cargo, COUNT (TIPO_EMPLEADO.Cargo) AS Cantidad, sum(salario) AS Total_mensual
FROM EMPLEADO inner join TIPO_EMPLEADO ON EMPLEADO.Id_Tipo_Empleado = TIPO_EMPLEADO.Id_Tipo_Empleado
GROUP BY TIPO_EMPLEADO.Cargo
order by CANTIDAD

