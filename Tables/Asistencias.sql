	create table Asistencias(
		Id int identity,
		Fecha datetime not null,
		Presente bit not null,
		Id_Asignatura int not null,
		Id_Alumno int not null,
		Id_Profesor_Carga int not null,
		constraint PK_Asistencias primary key (Id),
		constraint FK_Asistencias_Asignaturas foreign key (Id_Asignatura) references Asignaturas(Id),
		constraint FK_Asistencias_Alumnos foreign key (Id_Alumno) references Personas(Id),
		constraint FK_Asistencias_Profesores foreign key (Id_Profesor_Carga) references  Personas(Id),
	)