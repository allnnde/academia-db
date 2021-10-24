
if not exists (select 1 from sys.databases where name ='Academia')
begin
	create database Academia;
end;
go
use Academia
go

if not exists (select 1 from sys.tables where name = 'Roles')
begin 
	create table Roles(
		Id int identity,
		Nombre varchar(50) not null,
		constraint PK_Roles primary key (Id)
	)
end;
if not exists (select 1 from sys.tables where name = 'Personas')
begin 
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
end;
if not exists (select 1 from sys.tables where name = 'Materias')
begin 
	create table Materias(
		Id int identity,
		Nombre varchar(50) not null,
		constraint PK_Materias primary key (Id)
	)
end;
if not exists (select 1 from sys.tables where name = 'Cursos')
begin 
	create table Cursos(
		Id int identity,
		Nombre varchar(50) not null,
		constraint PK_Cursos primary key (Id)
	)
end;

if not exists (select 1 from sys.tables where name = 'Tipos_Notas')
begin 
	create table Tipos_Notas(
		Id int identity,
		Nombre varchar(50) not null,
		Activo bit not null,
		constraint PK_Tipos_Notas primary key (Id)
	)
end;

if not exists (select 1 from sys.tables where name = 'Asignaturas')
begin 
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
end;
if not exists (select 1 from sys.tables where name = 'Notas')
begin 
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
end;
if not exists (select 1 from sys.tables where name = 'Asistencias')
begin 
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
end;

if not exists (select 1 from sys.tables where name = 'Asignaturas_Alumnos')
begin 
	create table Asignaturas_Alumnos(
		Id_Asignatura int ,
		Id_Alumno int,
		Anio varchar(4) not null,
		constraint PK_Asignaturas_Alumnos primary key (Id_Asignatura,Id_Alumno),
		constraint FK_Asignaturas_Alumnos_Asignaturas foreign key(Id_Asignatura) references Asignaturas (Id),
		constraint FK_Asignaturas_Alumnos_Alumnos foreign key(Id_Asignatura) references Personas(Id),
	)
end;