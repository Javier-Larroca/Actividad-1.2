/*Tabla NaN
Se genero la base de datos, pensando en la tablas necesarias para efectuar las ventas de un super mercado, 
encontrando en estas los detalles basicos de cada venta.
**/

create database super
GO
use super
GO
create table Productos(
	IDProducto bigint primary key not null identity(1,1),
	Marca varchar(20) not null,
	Descripcion varchar (40) not null,
	Precio money not null  check (Precio>0)
)

GO
create table Tickets(
	NroTicket bigint primary key not null identity(1,1),
	Sucursal varchar (20) not null,
	Fecha datetime not null check (Fecha <= getdate()),
	NombreVendedor varchar (30) null,
	NombreCliente varchar (30) null
)
GO
create table ProductoTickets(
	IDProducto bigint foreign key references Productos(IDProducto),
	NroTicket bigint foreign key references Tickets(NroTicket),
	CantidadVenta int not null check(CantidadVenta > 0), 
	primary key(IDProducto, NroTicket)
)