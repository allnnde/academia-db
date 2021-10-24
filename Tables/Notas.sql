	create table Notas(
		Id int identity,
		Fecha datetime not null,
		Puntuacion varchar(3) not null,
		Id_Asignatura int not null,
		Id_Alumno int not null,
		Id_Profesor_Carga int not null,
		Id_Tipo_Nota int not null,
		constraint PK_Notas primary key (Id),
		constraint FK_Notas_Asignaturas foreign key (Id_Asignatura) references Asignaturas(Id),
		constraint FK_Notas_Alumnos foreign key (Id_Alumno) references Personas(Id),
		constraint FK_Notas_Profesores foreign key (Id_Profesor_Carga) references  Personas(Id),
		constraint FK_Notas_Tipos_Notas foreign key (Id_Tipo_Nota) references  Tipos_Notas(Id),
	)