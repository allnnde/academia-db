	create table Asignaturas(
		Id int identity,
		Id_Materia int not null,
		Id_Curso int not null,
		Id_Profesor_Carga int not null,
		constraint PK_Asignaturas primary key (Id),
		constraint FK_Asignaturas_Materias foreign key (Id_Materia) references Materias(Id),
		constraint FK_Asignaturas_Cuersos foreign key (Id_Curso) references Cursos(Id),
		constraint FK_Asignaturas_Profesores foreign key (Id_Profesor_Carga) references  Personas(Id),
	)