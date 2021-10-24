	create table Tipos_Notas(
		Id int identity,
		Nombre varchar(50) not null,
		Activo bit not null,
		constraint PK_Tipos_Notas primary key (Id)
	)