create database AutoRental;
use AutoRental;
-- drop database autorental;
create table sucursales (
id_sucursal int not null auto_increment primary key,
celular varchar(50),
direccion varchar(50),
ciudad varchar(50),
telefono_fijo varchar(50),
correo_electronico varchar(50)
);

create table empleados (
id_empleado int not null auto_increment primary key,
ciudad_residencia varchar(85),
cedula varchar(50),
nombre varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
dirección varchar(50),
celular varchar(50),
id_sucursal int,
foreign key (id_sucursal) references sucursales(id_sucursal),
correo_electronico varchar(50)
);

create table clientes (
id_cliente int not null auto_increment primary key,
cedula varchar(50),
nombre varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
direccion varchar(50),
correo_electronico varchar(50),
celular varchar(50),
ciudad_residencia varchar(50)
);

create table vehiculos (
id_vehiculo int not null auto_increment primary key,
sunroof varchar(50),
capacidad varchar(50),
tipo varchar(50),
placa varchar(50),
referencia varchar(50),
modelo varchar(50),
puertas int,
color varchar(50),
motor varchar(50)
);

create table alquileres (
id_alquiler int not null auto_increment primary key,
fecha_llegada date,
id_cliente int,
foreign key(id_cliente) references clientes(id_cliente),
id_empleado int,
foreign key(id_empleado) references empleados(id_empleado),
id_vehiculo int,
foreign key(id_vehiculo) references vehiculos(id_vehiculo),
id_sucursal int,
foreign key(id_sucursal) references sucursales(id_sucursal),
fecha_salida date,
fecha_esperada_llegada date,
valor_alquiler_dia decimal(10,2),
valor_alquiler_semana decimal(10,2),
valor_cotizado decimal(10,2),
valor_pagado decimal(10,2),
porcentaje_descuento decimal(10,2)
);
