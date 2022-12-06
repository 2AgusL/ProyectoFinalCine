create database CINE_FINAL
use CINE_FINAL

--DROP DATABASE CINE_FINAL


CREATE TABLE HORARIOS(
id_horario int,
horario varchar(8)
CONSTRAINT pk_horarios PRIMARY KEY (id_horario))

CREATE TABLE IDIOMAS
(id_idioma int,
idioma varchar(30)
CONSTRAINT pk_id_idioma PRIMARY KEY (id_idioma))

CREATE TABLE TIPOS_SALAS
(id_tipo int,
tipo varchar(30),
precio_base money
CONSTRAINT pk_id_tipo PRIMARY KEY (id_tipo))

CREATE TABLE GENEROS
(id_genero int,
genero varchar(30)
CONSTRAINT pk_id_genero PRIMARY KEY (id_genero))

CREATE TABLE CLASIFICACIONES
(id_clasificacion int,
clasificacion varchar(30)
CONSTRAINT pk_id_clasificacion PRIMARY KEY (id_clasificacion))

CREATE TABLE BUTACAS
(id_butaca int,
fila varchar(1),
numero int
CONSTRAINT pk_id_butaca PRIMARY KEY (id_butaca))

CREATE TABLE ESTADOS
(id_estado int,
estado varchar(30)
CONSTRAINT pk_id_estado PRIMARY KEY (id_estado))

CREATE TABLE FORMAS_DE_PAGO
(id_forma_de_pago int,
forma_de_pago varchar(50)
CONSTRAINT pk_id_forma_de_pago PRIMARY KEY (id_forma_de_pago))

CREATE TABLE PROMOCIONES
(id_promocion int,
nombre varchar(30),
descripcion varchar(100)
CONSTRAINT pk_id_promocion PRIMARY KEY (id_promocion))

CREATE TABLE CLIENTES
(id_cliente int,
nombre varchar(30),
apellido varchar(30),
dni varchar(20),
puntos int,
contraseña varchar(30)
CONSTRAINT id_cliente PRIMARY KEY (id_cliente))



--N# 2
CREATE TABLE PELICULAS
(id_pelicula int IDENTITY(1, 1),
nombre varchar(50),
id_clasificacion int,
duracion int,
id_estado int
CONSTRAINT pk_id_pelicula PRIMARY KEY (id_pelicula),
CONSTRAINT fk_id_clasificacion FOREIGN KEY(id_clasificacion)
REFERENCES CLASIFICACIONES (id_clasificacion),
CONSTRAINT fk_id_estado FOREIGN KEY (id_estado)
REFERENCES ESTADOS (id_estado))

CREATE TABLE SALAS
(nro_sala int,
id_tipo int,
asientos_max int
CONSTRAINT pk_nro_sala PRIMARY KEY (nro_sala),
CONSTRAINT fk_id_tipo FOREIGN KEY (id_tipo)
REFERENCES TIPOS_SALAS (id_tipo))

CREATE TABLE COMPROBANTES
(nro_comprobante int IDENTITY(1, 1),
id_forma_de_pago int,
id_cliente int,
fecha datetime,
id_estado int
CONSTRAINT pk_nro_comprobante PRIMARY KEY (nro_comprobante),
CONSTRAINT fk_id_forma_de_pago FOREIGN KEY (id_forma_de_pago)
REFERENCES FORMAS_DE_PAGO (id_forma_de_pago),
CONSTRAINT fk_id_estado_compro FOREIGN KEY (id_estado)
REFERENCES ESTADOS (id_estado))


--N# 3
CREATE TABLE PELICULAS_X_IDIOMAS
(id_pelicula_x_idioma int IDENTITY(1, 1),
id_pelicula int,
id_idioma int
CONSTRAINT pk_id_pelicula_x_idioma PRIMARY KEY (id_pelicula_x_idioma),
CONSTRAINT fk_id_pelicula_peliculas_x_idiomas FOREIGN KEY (id_pelicula)
REFERENCES PELICULAS (id_pelicula),
CONSTRAINT fk_idioma_peliculas_x_idiomas FOREIGN KEY (id_idioma)
REFERENCES IDIOMAS (id_idioma))

CREATE TABLE PELICULAS_X_GENEROS
(id_pelicula int,
id_genero int
CONSTRAINT pk_id_pelicula_x_id_genero PRIMARY KEY (id_pelicula, id_genero),
CONSTRAINT fk_id_pelicula_peliculas_x_generos FOREIGN KEY (id_pelicula)
REFERENCES PELICULAS (id_pelicula),
CONSTRAINT fk_id_genero_peliculas_x_generos FOREIGN KEY (id_genero)
REFERENCES GENEROS (id_genero))


--N# 4
CREATE TABLE FUNCIONES
(id_funcion int IDENTITY(1, 1),
id_pelicula_x_idioma int,
nro_sala int,
fecha date,
id_horario int,
id_estado int
CONSTRAINT pk_id_funcion PRIMARY KEY (id_funcion),
CONSTRAINT fk_id_pelicula_x_idioma FOREIGN KEY (id_pelicula_x_idioma)
REFERENCES PELICULAS_X_IDIOMAS (id_pelicula_x_idioma),
CONSTRAINT fk_nro_sala FOREIGN KEY (nro_sala)
REFERENCES SALAS (nro_sala),
CONSTRAINT fk_id_estado_func FOREIGN KEY (id_estado)
REFERENCES ESTADOS (id_estado),
CONSTRAINT fk_horario FOREIGN KEY (id_horario) REFERENCES HORARIOS (id_horario))


--N# 5
CREATE TABLE RESERVA_BUTACAS
(id_reserva int IDENTITY(1, 1),
id_funcion int,
id_butaca int,
id_estado int
CONSTRAINT pk_cod_reserva PRIMARY KEY (id_reserva),
CONSTRAINT fk_id_funcion FOREIGN KEY (id_funcion)
REFERENCES FUNCIONES (id_funcion),
CONSTRAINT fk_id_butaca FOREIGN KEY (id_butaca)
REFERENCES BUTACAS (id_butaca),
CONSTRAINT fk_id_estado_butaca FOREIGN KEY (id_estado)
REFERENCES ESTADOS (id_estado))
-- alta detalle tiene que retornar id detalle

CREATE TABLE DETALLE_COMPROBANTES
(id_detalle int identity(1,1),
nro_comprobante int,
precio_unitario money,
id_promocion int
CONSTRAINT pk_id_detalle PRIMARY KEY (id_detalle),
CONSTRAINT fk_nro_comprobante FOREIGN KEY (nro_comprobante)
REFERENCES COMPROBANTES (nro_comprobante),
CONSTRAINT fk_id_promocion FOREIGN KEY (id_promocion)
REFERENCES PROMOCIONES (id_promocion))

--N# 6
CREATE TABLE TICKETS
(nro_ticket int IDENTITY(1, 1),
id_detalle int,
id_reserva int
CONSTRAINT pk_nro_ticket PRIMARY KEY (nro_ticket),
CONSTRAINT fk_id_detalle_nro_comprobante FOREIGN KEY (id_detalle)
REFERENCES DETALLE_COMPROBANTES (id_detalle),
CONSTRAINT fk_id_reserva FOREIGN KEY (id_reserva)
REFERENCES RESERVA_BUTACAS (id_reserva))

-------------------------------------------INSERTS-------------------------------------------

--Horarios (id, horario)
insert into Horarios values(1, '15:00')
insert into Horarios values(2, '17:05')
insert into Horarios values(3, '19:30')
insert into Horarios values(4, '20:15')
insert into Horarios values(5, '21:45')
insert into Horarios values(6, '23:00')
--Idiomas (ID, IDIOMA)
insert into Idiomas values(1, 'Inglés')
insert into Idiomas values(2, 'Español')
insert into Idiomas values(3, 'Italiano')
insert into Idiomas values(4, 'Alemán')
insert into Idiomas values(5, 'Francés')

--Tipos de Salas (ID, TIPO, PRECIO)
insert into Tipos_Salas values(1,'2D', 750)
insert into Tipos_Salas values(2,'3D', 850)
insert into Tipos_Salas values(3,'4D', 1300)
insert into Tipos_Salas values(4,'VIP', 1700)

--Géneros (ID, Genero)
insert into Generos values(1, 'Acción')
insert into Generos values(2, 'Aventura')
insert into Generos values(3, 'Ciencia Ficción')
insert into Generos values(4, 'Comedia')
insert into Generos values(5, 'Documental')
insert into Generos values(6, 'Drama')
insert into Generos values(7, 'Fantasía')
insert into Generos values(8, 'Musical')
insert into Generos values(9, 'Suspenso')
insert into Generos values(10, 'Terror')
insert into Generos values(11, 'Religiosa') 
insert into Generos values(12, 'Futurista')
insert into Generos values(13, 'Policíaca')
insert into Generos values(14, 'Crimen')
insert into Generos values(15, 'Bélica')
insert into Generos values(16, 'Biografía')
insert into Generos values(17, 'Animación')
insert into Generos values(18, 'Thriller')
insert into Generos values(19, 'Misterio')
insert into Generos values(20, 'Sobrenatural')

--Clasificaciones (ID, Clasificacion)
insert into Clasificaciones values(1, 'ATP')
insert into Clasificaciones values(2, '+13')
insert into Clasificaciones values(3, '+16')
insert into Clasificaciones values(4, '+18')

--Butacas (ID, FILA, NUMERO)
insert into Butacas values(1, 'A', 1) --Fila 1
insert into Butacas values(2, 'A', 2)
insert into Butacas values(3, 'A' ,3)
insert into Butacas values(4, 'A', 4)
insert into Butacas values(5, 'A', 5)
insert into Butacas values(6, 'A', 6)
insert into Butacas values(7, 'A', 7)
insert into Butacas values(8, 'A', 8)
insert into Butacas values(9, 'A', 9)
insert into Butacas values(10, 'A', 10)
insert into Butacas values(11, 'B', 1) --Fila 2
insert into Butacas values(12, 'B', 2)
insert into Butacas values(13, 'B', 3)
insert into Butacas values(14, 'B', 4)
insert into Butacas values(15, 'B', 5)
insert into Butacas values(16, 'B', 6)
insert into Butacas values(17, 'B', 7)
insert into Butacas values(18, 'B', 8)
insert into Butacas values(19, 'B', 9)
insert into Butacas values(20, 'B', 10)
insert into Butacas values(21, 'C', 1) --Fila 3
insert into Butacas values(22, 'C', 2)
insert into Butacas values(23, 'C', 3)
insert into Butacas values(24, 'C', 4)
insert into Butacas values(25, 'C', 5)
insert into Butacas values(26, 'C', 6)
insert into Butacas values(27, 'C', 7)
insert into Butacas values(28, 'C', 8)
insert into Butacas values(29, 'C', 9)
insert into Butacas values(30, 'C', 10)
insert into Butacas values(31, 'D', 1) --Fila 4
insert into Butacas values(32, 'D', 2)
insert into Butacas values(33, 'D', 3)
insert into Butacas values(34, 'D', 4)
insert into Butacas values(35, 'D', 5)
insert into Butacas values(36, 'D', 6)
insert into Butacas values(37, 'D', 7)
insert into Butacas values(38, 'D', 8)
insert into Butacas values(39, 'D', 9)
insert into Butacas values(40, 'D', 10)
insert into Butacas values(41, 'E', 1) --Fila 5
insert into Butacas values(42, 'E', 2)
insert into Butacas values(43, 'E', 3)
insert into Butacas values(44, 'E', 4)
insert into Butacas values(45, 'E', 5)
insert into Butacas values(46, 'E', 6)
insert into Butacas values(47, 'E', 7)
insert into Butacas values(48, 'E', 8)
insert into Butacas values(49, 'E' ,9)
insert into Butacas values(50, 'E', 10)

--Estados (ID, ESTADO)
insert into Estados values(1, 'Libre')
insert into Estados values(2, 'Ocupado')
insert into Estados values(3,'Activo')
insert into Estados values(4,'Inactivo')

--Formas de pago (ID, FORMA DE PAGO)
insert into Formas_de_pago values(1, 'Efectivo')
insert into Formas_de_pago values(2, 'Crédito')
insert into Formas_de_pago values(3, 'Débito')
insert into Formas_de_pago values(4, 'Prepago')


--Promociones(ID, PROMOCION, DESCRIPCION)
insert into Promociones values(1, '2x1 LA VOZ', 'Dos entradas al precio de una para socios club la voz')
insert into Promociones values(2, '2x1 BBVA', 'Dos entradas al precio de una para clientes BBVA')
insert into Promociones values(3, '50%OFF AMERICAN EXPRESS', 'Una entrada al 50% de su valor para clientes AMERICAN EXPRESS')
insert into Promociones values(4, '20%OFF MENORES', 'Una entrada con el 20% de descuento para menores de 12 años')
insert into Promociones values(5, '20%OFF JUBILADOS', 'Una entrada con el 20% de descuento para jubilados presentando su carnet')
insert into Promociones values(6, '2x1 CLUB LA NACION', 'Dos entradas al precio de una para clientes club nación')
insert into Promociones values(7, '20%OFF ESPECIAL', 'Una entrada con el 20% de descuento para personas con discapacidad mostrando certificado')
insert into Promociones values(8, '2x1 CLUB PERSONAL', 'Dos entradas al precio de una para clientes de la aplicación personal play')
insert into Promociones values(9, 'Sin Descuento', 'No se aplica ningun descuento en este caso')

--Clientes (ID, NOMBRE, APELLIDO, DNI, PUNTOS, CONTRASEÑA)
insert into Clientes values(1, 'Juan', 'Perez', '12345678', 120, 'contra')
insert into Clientes values(2,'Valerio', 'Gonzáles', '36252547', 50, '12345')
insert into Clientes values(3, 'María', 'Martínez', '42566032', 200, 'oscarbota')
insert into Clientes values(4, 'Horacio', 'Sánchez', '35332027', 0, 'contra')
insert into Clientes values(5, 'Manuel', 'Fernández', '41284502', 300, 'contraseña')
insert into Clientes values(6, 'Juliana', 'Díaz', '40122200', 120, 'admin')
insert into Clientes values(7, 'Luciana', 'Marengo', '39966520', 20, 'contraseña')
insert into Clientes values(8, 'Eugenia', 'Aimaretto', '42255870', 500, 'contraseña')
insert into Clientes values(9, 'Carlos', 'Cruz', '39520144', 100, 'contraseña')
insert into Clientes values(10, 'Leandro', 'Gutiérrez', '37588402', 30, 'contraseña')
insert into Clientes values(11, 'Jorge', 'Moine', '38550966', 20, 'contraseña')
insert into Clientes values(12, 'Daniela', 'Luciani', '40011236', 0, 'contraseña')
insert into Clientes values(13, 'Omar', 'Hernández', 36699800, 250, 'contraseña')
insert into Clientes values(14, 'Martina', 'Ortega', 41110589, 120, 'contraseña')
insert into Clientes values(15, 'Ana', 'Abraham', 43885711, 15, 'contraseña')


--N# 2
--Peliculas (nombre, id clasificacion, duracion, estado)
insert into Peliculas values('Jurassic World Dominion', 2, 147, 3)
insert into Peliculas values('Tren Bala', 3, 126, 3)
insert into Peliculas values('Elvis',2 , 160, 3)
insert into Peliculas values('DC LIGA DE SUPERMASCOTAS',1 , 106, 3)
insert into Peliculas values('Bestia', 2, 93, 3)
insert into Peliculas values('Telefono negro',3 , 104, 3)
insert into Peliculas values('Again 2022', 3, 180, 3)
insert into Peliculas values('Esclavos y Reyes', 2, 126, 3)


--Salas (id sala, id tipo, asientos max)
insert into Salas values(1, 1, 50) --2D
insert into Salas values(2, 1, 50) --2D
insert into Salas values(3, 2, 50) --3D
insert into Salas values(4, 2, 50) --3D
insert into Salas values(5, 3, 50) --4D
insert into Salas values(6, 4, 50) --VIP

set dateformat dmy
--Comprobantes (id comprobante, forma de pago, cliente, fecha, estado 3)
insert into Comprobantes values (4, 4, '01/10/2020', 3)
insert into Comprobantes values (2,2,'23/03/2021', 3)
insert into Comprobantes values (3,5,'17/05/2021', 3)
insert into Comprobantes values (1,4,'11/12/2019', 3)
insert into Comprobantes values (3,1,'03/01/2022', 3)
insert into Comprobantes values (3,1,'22/02/2018', 3)
insert into Comprobantes values (4,8,'07/07/2018', 3)
insert into Comprobantes values (2,6,'31/10/2020', 3)
insert into Comprobantes values (4,9,'12/04/2022', 3)
insert into Comprobantes values (1,7,'29/02/2020', 3)


--N# 3
--Peliculas x Idioma (pelicula, idioma)
insert into Peliculas_x_idiomas values(1, 1)
insert into Peliculas_x_idiomas values(1, 2)
insert into Peliculas_x_idiomas values(2, 1)
insert into Peliculas_x_idiomas values(2, 2)
insert into Peliculas_x_idiomas values(2, 5)
insert into Peliculas_x_idiomas values(3, 2)
insert into Peliculas_x_idiomas values(3, 4)
insert into Peliculas_x_idiomas values(4, 2)
insert into Peliculas_x_idiomas values(5, 1)
insert into Peliculas_x_idiomas values(5, 4)
insert into Peliculas_x_idiomas values(6, 4)
insert into Peliculas_x_idiomas values(6, 5)
insert into Peliculas_x_idiomas values(7, 1)
insert into Peliculas_x_idiomas values(8, 3)


--Peliculas x Géneros (id pelicula, id genero)
insert into Peliculas_x_generos values(1, 1)
insert into Peliculas_x_generos values(1, 3)
insert into Peliculas_x_generos values(1, 4)
insert into Peliculas_x_generos values(2, 1)
insert into Peliculas_x_generos values(2, 9)
insert into Peliculas_x_generos values(2, 2)
insert into Peliculas_x_generos values(2, 19)
insert into  Peliculas_x_generos values(3, 16)
insert into  Peliculas_x_generos values(4, 17)
insert into  Peliculas_x_generos values(5, 2)
insert into  Peliculas_x_generos values(5, 18)
insert into  Peliculas_x_generos values(6, 18)
insert into  Peliculas_x_generos values(6, 6)
insert into  Peliculas_x_generos values(6, 20)
insert into  Peliculas_x_generos values(7, 6)
insert into  Peliculas_x_generos values(8, 11)


--N# 4
--Funciones (pelicula, sala, fecha, hora, estado)
insert into Funciones values(1, 1, '01/10/2020', 1, 3)
insert into Funciones values(2, 3, '23/03/2021', 2, 3)
insert into Funciones values(2, 3, '17/05/2021', 2, 3)
insert into Funciones values(3, 5, '11/12/2019', 3, 3)
insert into Funciones values(4, 2, '11/12/2019', 1, 3)
insert into Funciones values(5, 1, '16/12/2019', 5, 3)
insert into Funciones values(5, 5, '03/01/2022', 5, 3)
insert into Funciones values(5, 1, '03/01/2022', 3, 3)
insert into Funciones values(6, 3, '03/01/2022', 1, 3)
insert into Funciones values(7, 5, '22/02/2018', 1, 3)
insert into Funciones values(8, 4, '22/02/2018', 1, 3)
insert into Funciones values(8, 4, '07/07/2018', 6, 3)
insert into Funciones values(9, 5, '31/10/2020', 2, 3)
insert into Funciones values(10, 6, '12/04/2022', 6, 3)
insert into Funciones values(11, 1, '12/04/2022', 6, 3)
insert into Funciones values(12, 5, '12/04/2022', 1, 3)
insert into Funciones values(12, 3, '29/02/2020', 4, 3)
insert into Funciones values(13, 4, '29/02/2020', 4, 3)
insert into Funciones values(14, 4, '29/02/2020', 1, 3)
insert into Funciones values(14, 5, '29/02/2020', 4, 3)


--N# 5
--RESERVA_BUTACAS (id_funcion, id_butaca, id_estado)
insert into Reserva_butacas values(1, 1, 1)
insert into Reserva_butacas values(1, 2, 1)
insert into Reserva_butacas values(2, 2, 2)
insert into Reserva_butacas values(3, 42, 2)
insert into Reserva_butacas values(3, 43, 2)
insert into Reserva_butacas values(4, 36, 2)
insert into Reserva_butacas values(5, 15, 2)
insert into Reserva_butacas values(5, 14, 2)
insert into Reserva_butacas values(6, 18, 1)
insert into Reserva_butacas values(6, 18, 1)
insert into Reserva_butacas values(7, 17, 2)
insert into Reserva_butacas values(8, 23, 2)
insert into Reserva_butacas values(9, 28, 2)
insert into Reserva_butacas values(10, 29, 2)
insert into Reserva_butacas values(11, 14, 1)
insert into Reserva_butacas values(12, 31, 1)
insert into Reserva_butacas values(13, 2, 2)
insert into Reserva_butacas values(14, 13, 2)
insert into Reserva_butacas values(15, 18, 2)


--DETALLE_COMPROBANTES (detalle, comprobante, precio unitario, promocion)
insert into DETALLE_COMPROBANTES VALUES(1,700,2)
insert into DETALLE_COMPROBANTES VALUES(1,700,4)
insert into DETALLE_COMPROBANTES VALUES(2,800,2)
insert into DETALLE_COMPROBANTES VALUES(3,800,5)
insert into DETALLE_COMPROBANTES VALUES(4,600,1)
insert into DETALLE_COMPROBANTES VALUES(5,900,6)
insert into DETALLE_COMPROBANTES VALUES(6,500,8)
insert into DETALLE_COMPROBANTES VALUES(7,500,3)
insert into DETALLE_COMPROBANTES VALUES(8,700,5)
insert into DETALLE_COMPROBANTES VALUES(9,900,4)
insert into DETALLE_COMPROBANTES VALUES(10,700,7)
insert into DETALLE_COMPROBANTES VALUES(10,700,3)
insert into DETALLE_COMPROBANTES VALUES(9,900,6)


--N# 6
--Tickets (id_detalle, id_reserva)
insert into Tickets values(1, 1)
insert into Tickets values(1, 2)
insert into Tickets values(2, 3)
insert into Tickets values(3, 4)
insert into Tickets values(3, 5)
insert into Tickets values(4, 6)
insert into Tickets values(5, 7)
insert into Tickets values(5, 8)
insert into Tickets values(6, 9)
insert into Tickets values(6, 10)
insert into Tickets values(7, 11)
insert into Tickets values(7, 12)
insert into Tickets values(8, 13)
insert into Tickets values(9, 14)
insert into Tickets values(10, 15)
insert into Tickets values(11, 16)
insert into Tickets values(12, 17)
insert into Tickets values(13, 18)
insert into Tickets values(13, 19)

-------------------------------------------PROCEDIMIENTOS ALMACENADOS------------------------------

-----------ALTA---------
go
create proc SP_Alta_Comprobante
@nro_comprobante int output,
@forma_pago int,
@id_cliente int,
@fecha datetime
as
Insert into COMPROBANTES values(@forma_pago, @id_cliente, @fecha, 3)
set @nro_comprobante = SCOPE_IDENTITY();
go

go
create proc SP_Alta_Detalle
@nro_comprobante int,
@precio money,
@id_promo int,
@id_detalle int OUTPUT
as

Insert into DETALLE_COMPROBANTES values(@nro_comprobante, @precio, @id_promo)

SET @id_detalle = SCOPE_IDENTITY();
go

create proc SP_Alta_Funcion
@id_peli_idioma int,
@nro_sala int,
@fecha datetime,
@id_horario int
as
Insert into FUNCIONES values(@id_peli_idioma, @nro_sala, @fecha, @id_horario, 3)
go

go
create proc SP_Alta_Pelicula
@id_peli int output,
@nombre varchar(50),
@id_clasificacion int,
@duracion int
as
Insert into PELICULAS values(@nombre, @id_clasificacion, @duracion, 3)
set @id_peli = SCOPE_IDENTITY();
go

go
create proc SP_Alta_Pelicula_Genero
@id_peli int,
@id_gen int
as
Insert into PELICULAS_X_GENEROS values(@id_peli, @id_gen)
go

go
create proc SP_Alta_Pelicula_Idioma
@id_peli int,
@id_idio int
as 
Insert into PELICULAS_X_IDIOMAS values(@id_peli, @id_idio)
go

go
create proc SP_Cambiar_Estado
@id int,
@tabla varchar(15),
@nuevo_estado int --1 BAJA, 2 ALTA
as
if @tabla = 'Comprobantes' 
	begin

		if @nuevo_estado = 1
			begin
				update COMPROBANTES set id_estado = 4
				where nro_comprobante = @id
			end
		else
			begin
				print 'NO SE PUEDE DAR DE ALTA UN COMPROBANTE UNA VEZ ANULADO'
			end
	end
if @tabla = 'Funciones'
	begin
		if @nuevo_estado = 1
			begin
				update funciones set id_estado = 4
				where id_funcion = @id
			end
		else
			begin
				update funciones set id_estado = 3
				where id_funcion = @id
			end
	end
if @tabla = 'Peliculas'
	begin	
		if @nuevo_estado = 1
			begin 
				update peliculas set id_estado = 4
				where id_pelicula = @id
			end
		else
			begin
				update peliculas set id_estado = 3
				where id_pelicula = @id
			end
	end
go

go
create proc SP_Login
@dni varchar(50),
@contra varchar(50)
as
select id_cliente 'ID', nombre 'Nombre', apellido 'Apellido', dni 'DNI', puntos 'Puntos', contraseña 'Contraseña'
from Clientes
where dni = @dni and CONTRASEÑA = @contra
go
------------------------------------------ALTA FUNCION----------------------------------
go
create proc SP_Obtener_Peliculas_Activas
as
select id_pelicula ID, nombre Pelicula from PELICULAS
WHERE id_estado = 3
go

go
create proc SP_Obtener_Idiomas_Peli
@id_pelicula int
as
select pxi.id_idioma ID, idioma Idioma from PELICULAS_X_IDIOMAS
pxi join IDIOMAS i on pxi.id_idioma = i.id_idioma
where pxi.id_pelicula = @id_pelicula
go

go
create proc SP_Obtener_Salas_Desocupadas
@fecha datetime
as
select nro_sala ID, 'Sala ' + convert(varchar(2), nro_sala)+ ' - ' + tipo SalaTipo
from SALAS s join TIPOS_SALAS t on s.id_tipo = t.id_tipo
where nro_sala not in (select nro_sala from FUNCIONES where fecha = @fecha)
go

go
create proc SP_Horarios_Disponibles            
@nro_sala int
as
select id_horario ID, horario Horario
from HORARIOS 
where id_horario not in (select id_horario from FUNCIONES where nro_sala = @nro_sala)
exec [SP_Horarios_Disponibles] 1
go

---------------------------------------MODIFICAR-----------------------------
go
create proc [dbo].[SP_Editar_Funcion]
@id_funcion int,
@nro_sala int,
@fecha datetime,
@id_horario int
as
update FUNCIONES set nro_sala = @nro_sala, fecha = @fecha, id_horario = @id_horario
        where id_funcion = @id_funcion
go
---------------------------------------------CONSULTAR--------------------------------
go
create view vis_funciones
    as
    select id_funcion ID, f.id_pelicula_x_idioma ID_PXI, nombre Pelicula, i.id_idioma ID_Idioma, idioma Idioma, f.nro_sala NroSala, 'Sala ' + convert(varchar(2), f.nro_sala)+ ' - ' + tipo SalaTipo, fecha Fecha, f.id_horario ID_Horario, h.horario Horario, f.id_estado ID_Estado
        from FUNCIONES f join PELICULAS_X_IDIOMAS pxi on f.id_pelicula_x_idioma = pxi.id_pelicula_x_idioma
        join PELICULAS p on p.id_pelicula = pxi.id_pelicula
        join IDIOMAS i on i.id_idioma = pxi.id_idioma
        join HORARIOS h on h.id_horario = f.id_horario
        join SALAS s on s.nro_sala = f.nro_sala
        join TIPOS_SALAS ts on ts.id_tipo = s.id_tipo
go

go
create view Vis_Peliculas
as
SELECT p.id_pelicula AS ID, p.nombre AS Pelicula, p.id_clasificacion AS ID_Clas, c.clasificacion, p.duracion, p.id_estado
FROM     dbo.PELICULAS AS p INNER JOIN
                  dbo.CLASIFICACIONES AS c ON p.id_clasificacion = c.id_clasificacion
go

go
create proc SP_Obtener_Funciones
@estado int
as
if @estado = 1               -----ACTIVAS
	begin

		select * from Vis_Funciones
		where ID_Estado = 3
	end
if @estado = 2               ------INACTIVAS
	begin
		select * from Vis_Funciones
		where ID_Estado = 4
	end
if @estado = 3               -----TODAS
	begin
		select * from Vis_funciones
	end
go

go
create proc SP_Obtener_Ultimo_Comprobante
@ultimo int output
as
set @ultimo = (select max(nro_comprobante) + 1 from COMPROBANTES)
go

go
create proc [dbo].[SP_Filtrar_Pelicula_Nombre_Estado]
@nombre varchar(60),
@eleccion int 
as
if @eleccion = 1                --INACTIVA
        begin
            select ID, Pelicula, Clasificacion, Duracion, ID_Estado
            from Vis_Peliculas
            where Pelicula like CONCAT('%', @nombre, '%') and ID_Estado = 4
        end
if @eleccion = 2                --ACTIVA
    begin
        select ID, Pelicula, Clasificacion, Duracion, ID_Estado
        from Vis_Peliculas
        where Pelicula like CONCAT('%', @nombre, '%') and ID_Estado = 3
    end
if @eleccion = 3                --TODAS
    begin
        select ID, Pelicula, Clasificacion, Duracion, ID_Estado
        from Vis_Peliculas
        where Pelicula like CONCAT('%', @nombre, '%')
    end
go

go
create proc [dbo].[SP_Editar_Estado_Pelicula]
@id_pelicula int,
@cambio int                      --1 desactivar 2 activar
as
if @cambio = 1
    begin
        update PELICULAS set id_estado = 4
        where id_pelicula = @id_pelicula
    end
if @cambio = 2
    begin
        update PELICULAS set id_estado = 3
        where id_pelicula = @id_pelicula
    end
go

go
create proc [dbo].[SP_Obtener_Idiomas_Peliculas]
@id_peli int
as
select pxi.id_idioma ID, idioma Idioma 
from PELICULAS_X_IDIOMAS pxi join IDIOMAS i on pxi.id_idioma = i.id_idioma
where pxi.id_pelicula = @id_peli
go

go
create proc SP_Filtrar_Comprobante_Dni
@dni int
as
select nro_comprobante ID, f.forma_de_pago FormaPago, apellido + ' ' + nombre Cliente, fecha Fecha
from COMPROBANTES c join FORMAS_DE_PAGO f on c.id_forma_de_pago = f.id_forma_de_pago
join CLIENTES cli on cli.id_cliente = c.id_cliente
where cli.dni = @dni
go

go
create proc SP_Baja_Comprobante
@nro_comprobante int
as
update comprobantes set id_estado = 4   --Inactivo
where nro_comprobante = @nro_comprobante
go

go
create proc [dbo].[SP_Vis_Funciones]
    as
    select ID, Pelicula, ID_Idioma, Idioma, NroSala, ID_Horario, Horario, Fecha from vis_funciones
    where ID_Estado = 3
go

go
create proc [dbo].[SP_Consultar_Tablas_Auxiliares]
@tabla int--varchar(20)
as
if @tabla = 1--'FormasPago'
    begin
        select * from FORMAS_DE_PAGO
    end
if @tabla = 2--'Idiomas'
    begin 
        select * from IDIOMAS
    end
if @tabla = 3--'Generos'
    begin
        select * from GENEROS
    end
if @tabla = 4--'Clasificaciones'
    begin 
        select * from CLASIFICACIONES
    end
if @tabla = 5--'Promociones'
    begin 
        select * from PROMOCIONES
    end
if @tabla = 6--'Butacas'
    begin
        select id_butaca ID, fila + CONVERT(varchar(1), numero) FilaYNumero from BUTACAS
    end
if @tabla = 7--'Horarios'
    begin
        select * from HORARIOS
    end
if @tabla = 8--'Salas'
    begin
        select nro_sala ID, 'Sala ' + convert(varchar(2), nro_sala)+ ' - ' + tipo TipoSala from SALAS s join TIPOS_SALAS t on s.id_tipo = t.id_tipo
    end
go

go
create proc SP_Reservas_Peliculas
as
select distinct p.id_pelicula ID, nombre Pelicula                --DE LAS FUNCIONES ACTIVAS
from funciones f join peliculas_x_idiomas pxi on f.id_pelicula_x_idioma = pxi.id_pelicula_x_idioma
join Peliculas p on p.id_pelicula = pxi.id_pelicula      
where f.id_estado = 3 --ID PELI
go

go
create proc SP_Reservas_Idiomas
@id_peli int				--ID IDIOMA
as
select distinct pxi.id_idioma ID, i.idioma IDIOMA
from Idiomas i join PELICULAS_X_IDIOMAS pxi on i.id_idioma = pxi.id_idioma
join FUNCIONES f on f.id_pelicula_x_idioma = pxi.id_pelicula_x_idioma
where pxi.id_pelicula = @id_peli and pxi.id_pelicula_x_idioma in (select id_pelicula_x_idioma from funciones)
go

go
create proc SP_Reservas_Salas
@id_peli int, --AMBAS ESTAN EN UNA FUNCION
@id_idioma int
as
declare @id_pxi int
set @id_pxi = (select id_pelicula_x_idioma from PELICULAS_X_IDIOMAS where id_idioma = @id_idioma and id_pelicula = @id_peli)

select distinct f.nro_sala ID, tipo Tipo, precio_base Precio
from SALAS s join TIPOS_SALAS t on s.id_tipo = t.id_tipo
join FUNCIONES f on f.nro_sala = s.nro_sala
where f.id_pelicula_x_idioma = @id_pxi
go

go
create proc SP_Reservas_Fecha
@id_sala int,
@id_peli int ,
@id_idioma int
as							--FECHA
declare @id_pxi int
set @id_pxi = (select id_pelicula_x_idioma from PELICULAS_X_IDIOMAS where id_idioma = @id_idioma and id_pelicula = @id_peli)

select distinct 0 'IDFALSO', fecha Fecha
from FUNCIONES 
where nro_sala = @id_sala and id_pelicula_x_idioma = @id_pxi
go

go
create proc SP_Reservas_Horario
@id_sala int,
@id_peli int ,
@id_idioma int,
@fecha datetime
as
declare @id_pxi int
set @id_pxi = (select id_pelicula_x_idioma from PELICULAS_X_IDIOMAS where id_idioma = @id_idioma and id_pelicula = @id_peli)

select f.id_horario ID, horario Horario
from Funciones f join horarios h on f.id_horario = h.id_horario
where f.nro_sala = @id_sala and f.id_pelicula_x_idioma = @id_pxi and f.fecha = @fecha
go

go
create proc SP_Obtener_Id_Funcion
@id_sala int,
@id_peli int,
@id_idioma int,
@fecha datetime,
@id_horario int,
@id_funcion int output
as
declare @id_pxi int
set @id_pxi = (select id_pelicula_x_idioma from PELICULAS_X_IDIOMAS where id_idioma = @id_idioma and id_pelicula = @id_peli)

set @id_funcion = (select id_funcion from funciones 
where id_pelicula_x_idioma = @id_pxi and nro_sala = @id_sala and fecha = @fecha and id_horario = @id_horario)
go

go
create proc SP_Funciones_Butacas_Ocupadas
@id_funcion int
as
select b.id_butaca ID, convert(varchar(1), b.fila) + '' + convert(varchar(1), b.numero) Nombre, r.id_estado Id_Estado
from RESERVA_BUTACAS r join BUTACAS b on r.id_butaca = b.id_butaca
join FUNCIONES f on f.id_funcion = r.id_funcion
where r.id_funcion = @id_funcion and r.id_estado = 2
go

go
create proc SP_Obtener_ID_PXI
@id_pelicula int,
@id_idioma int,
@id_pxi int output
as
set @id_pxi = (select id_pelicula_x_idioma from Peliculas_x_idiomas
where id_pelicula = @id_pelicula and id_idioma = @id_idioma)
go

go
create proc SP_Baja_Butaca
@id_funcion int,
@id_butaca int
as
insert into Reserva_Butacas values(@id_funcion, @id_butaca, 2)
go

go
create proc [dbo].[SP_Editar_Estado_Funcion]
@id_funcion int,
@cambio int                      --1 desactivar 2 activar
as
if @cambio = 1
	begin	
		update FUNCIONES set id_estado = 4
		where id_funcion = @id_funcion
	end
if @cambio = 2
	begin
		update FUNCIONES set id_estado = 3
		where id_funcion = @id_funcion
	end
go

go

go
create proc [dbo].[SP_Obtener_Idioma_Pelicula]
@id_pelicula int
as
select id_pelicula_x_idioma ID_PXI, idioma Idioma
from idiomas i join peliculas_x_idiomas pxi on i.id_idioma = pxi.id_idioma
where id_pelicula = @id_pelicula
go

go
create proc [dbo].[SP_Obtener_Pelicula]
as
select ID, Pelicula 
from Vis_Peliculas
go
--Codigo que necesito:

go
create proc [SP_Top_Peliculas_Por_Anio]
@anio int = 2018
as
select top 3 p.id_pelicula 'código pelicula', nombre 'Pelicula', clasificacion 'Clasificacion', idioma 'Idioma', duracion 'Duracion'
from funciones f join reserva_butacas rv on f.id_funcion = rv.id_funcion
join tickets t on t.id_reserva = rv.id_reserva
join detalle_comprobantes d on d.id_detalle = t.id_detalle
join comprobantes c on c.nro_comprobante = d.nro_comprobante
join peliculas_x_idiomas pxi on pxi.id_pelicula_x_idioma = f.id_pelicula_x_idioma
join peliculas p on pxi.id_pelicula=p.id_pelicula
join peliculas_x_generos pg on p.id_pelicula = pg.id_pelicula
join clasificaciones cl on cl.id_clasificacion=p.id_clasificacion
join idiomas i on i.id_idioma = pxi.id_idioma
where year(c.fecha)= @anio
group by p.id_pelicula, nombre, clasificacion, idioma, duracion
order by count(f.id_pelicula_x_idioma) desc
go

create proc SP_Alta_Reserva
@id_funcion int,
@id_butaca int,
@cod_reserva int output
as
insert into RESERVA_BUTACAS values(@id_funcion, @id_butaca, 3)

set @cod_reserva = SCOPE_IDENTITY();

GO

create proc SP_Alta_Ticket
@id_detalle int,
@id_reserva int
as
insert into Tickets values(@id_detalle, @id_reserva)