/*Tabla 1aN
Se genera la BBDD "Torneos" pensada para administrar en los torneos de futbol a los equipos con sus correspondientes fubolistas.
**/

create database Torneo
GO
use Torneo
GO
CREATE TABLE Equipos(
	IDEquipo int not null primary key identity (100,1),
	Nombre varchar(20) not null,
	Categoria char not null check (Categoria = 'A' OR Categoria = 'B' OR Categoria = 'C'),
	Pais varchar(20) not null
)
GO
CREATE TABLE Futbolistas(
	DNI int not null primary key,
	IdEquipo int not null foreign key REFERENCES Equipos(IDEquipo),
	Nombre varchar(20) not null,
	Apellido varchar(20) not null,
	Nacionalidad varchar(20) not null,
	FechaNac datetime not null check (FechaNac <= getdate())
)