	create table Asignaturas_Alumnos(
		Id_Asignatura int ,
		Id_Alumno int,
		Anio varchar(4) not null,
		constraint PK_Asignaturas_Alumnos primary key (Id_Asignatura,Id_Alumno),
		constraint FK_Asignaturas_Alumnos_Asignaturas foreign key(Id_Asignatura) references Asignaturas (Id),
		constraint FK_Asignaturas_Alumnos_Alumnos foreign key(Id_Asignatura) references Personas(Id),
	)