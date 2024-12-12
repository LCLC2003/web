create domain "sexo" as text
check(value='Hombre' or value='Mujer');

create domain Costo as float
constraint validar_Costo
check(value>0);

CREATE TABLE cliente(
ID_Cliente serial NOT NULL,
Nombre varchar(25) NOT NULL,
Apellido varchar(25) NOT NULL,
Telefono varchar(10) NOT NULL,
Correo varchar(50) NOT NULL unique,
Sexo sexo NOT NULL,
contrasena varchar(20) not null,
primary key(ID_Cliente)
);

CREATE TABLE administrador(
ID_Admin serial NOT NULL,
Nombre varchar(25) NOT NULL,
Apellido varchar(25) NOT NULL,
Correo varchar(50) NOT NULL unique,
contrasena varchar(20) not null,
primary key(ID_Admin)
);

CREATE TABLE Servicio(
ID_Servicio serial NOT NULL,
Nombre varchar(30) NOT NULL,
Descripcion text NOT NULL,
Costo Costo NOT NULL,
primary key(ID_Servicio)
);

CREATE TABLE Historial(
ID_Historial serial NOT NULL,
Fecha Date,
Descripcion text not NULL,
ID_Servicio int not null,
ID_Mascota int NOT NULL,
primary key(ID_Historial),
FOREIGN key(ID_Mascota)	references Mascota(ID_Mascota),
FOREIGN key(ID_Servicio)references servicio(ID_servicio)
);
CREATE TABLE Cita(
ID_Cita serial NOT NULL,
Fecha Date NOT null,
Hora Time NOT null,
Motivo varchar(60) NOT NULL,
ID_Mascota INT NOT NULL,
ID_Servicio int NOT NULL,
primary key(ID_Cita),
FOREIGN key(ID_Servicio) references Servicio(ID_Servicio),
FOREIGN key(ID_Mascota)	references Mascota(ID_Mascota)
);

CREATE TABLE Mascota(
ID_Mascota serial NOT NULL,
Nombre_Mascota varchar(25) NOT NULL,
Especie varchar(25) NOT NULL,
Raza varchar(20) NOT NULL,
Fecha_Nacimiento Date not null,
ID_Cliente INT NOT NULL,
primary key(ID_Mascota),
FOREIGN key(ID_Cliente)	references CLIENTE(ID_Cliente)
);

CREATE TABLE Veterinario(
ID_Veterinario serial NOT NULL,
Nombre varchar(25) NOT NULL,
Apellido varchar(25) NOT NULL,
Telefono varchar(10) NOT NULL,
Especialidad varchar(25) NOT NULL,
primary key(ID_Veterinario)
);