/*Tabla 1a1
Se penso en este ejemplo de tablas 1a1 para una empresa de logistica, la cual puede tener diferentes choferes, 
pero cada uno tendra asignado un solo vehiculo, vinculado a ellos mediante el nro de DNI, en esta tabla se encontraran los datos del vehiculo.
**/

create database logistica
GO
use logistica
create table Choferes(
	DNI int primary key,
	Apellido varchar (20) not null,
	Nombre varchar (40) not null,
	FechaNac datetime not null check (cast(datediff(dd,FechaNac,GETDATE()) / 365.25 as int) >= 18),
	FechaIngreso datetime not null check (FechaIngreso <= getdate())
)
GO
create table VehiculoAsignado(
	DNI int primary key foreign key references Choferes (DNI),
	Dominio varchar(7) unique not null,
	Marca varchar(20) not null,
	Modelo varchar(30) not null
)