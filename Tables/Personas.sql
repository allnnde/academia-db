	create table Personas(
		Id int identity,
		Nombre varchar(150) not null,
		Apellido varchar(150) not null,
		Documento varchar(20) not null,
		Direccion varchar(20) not null,
		Telefono varchar (10) not null,
		Fecha_Nacimiento datetime not null,
		Activo bit not null,
		Id_Rol int not null,
		constraint PK_Personas primary key (Id),
		constraint FK_Personas_Roles foreign key (Id_Rol) references Roles(Id),
	)