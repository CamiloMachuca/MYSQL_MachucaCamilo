## MySQL Machuca Camilo
Este repositorio contienen los trabajos de MySQL en los cuales se trabajaron con distintas bases de datos.

## Tabla de contenidos
Este repositorio cuenta con los siguientes proyectos.

| Índice | Título |
|--|--|
| 1 | Dia2 |
| 2 | Dia3 |
| 3 | Dia4 |
| 4 | Dia5 |

# Dia2
Esta carpeta contiene los trabajos de una base de datos de jardineria

## Descripción
La base de datos jardineria cuenta con las siguientes entidades o tablas en las cuales estan sus atributos correspondientes:

```sql
CREATE DATABASE DiagramaJardineria_Machuca_Camilo;

USE DiagramaJardineria_Machuca_Camilo;

create table oficina(
codigo_oficina varchar(10) not null primary key,
ciudad varchar(30) not null,
pais varchar(50) not null,
region varchar(50) not null,
codigo_postal varchar(10) not null,
telefono varchar(20) not null,
linea_direccion1 varchar(50) not null,
linea_direccion2 varchar(50) not null
);
create table empleado(
codigo_empleado INT(11) not null auto_increment primary key,
nombre varchar(50) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
extension varchar(10) not null,
email varchar(100) not null,
codigo_oficina varchar(10) not null,
foreign key (codigo_oficina ) references oficina (codigo_oficina),
codigo_jefe INT(11),
puesto varchar(50) not null
);

create table cliente(
codigo_cliente INT(11) not null auto_increment primary key,
nombre_cliente varchar(50) not null,
nombre_contacto varchar(30) not null,
apellido_contacto varchar(30) not null,
telefono varchar(15) not null,
tax varchar(15) not null,
linea_direccion1 varchar(50),
linea_direccion2 varchar(50),
ciudad varchar(50),
region varchar(50),
pais varchar(50),
codigo_postal varchar(10),
codigo_empleado_rep_ventas INT(11) not null,
foreign key (codigo_empleado_rep_ventas ) references empleado (codigo_empleado),
limite_credito DECIMAL(15,2)

);

create table pago(
codigo_cliente INT(11) not null,
foreign key (codigo_cliente) references cliente (codigo_cliente),
forma_pago varchar(40) not null,
id_transaccion varchar(50) not null primary key,
fecha_pago DATE not null,
total DECIMAL(15,2)
);
create table gama_producto(
gama varchar(50)  not null primary key,
descripcion_texto TEXT ,
descripcion_html TEXT,
imagen varchar(256)
);
-- drop database DiagramaJardineria_Machuca_Camilo;
create table producto(
codigo_producto varchar (15) not null primary key,
nombre varchar(70) not null,
gama varchar(50) not null,
foreign key (gama) references gama_producto (gama),
dimensiones varchar(25) not null,
proveedor varchar(50) not null,
descripción TEXT not null,
cantidad_en_stock SMALLINT(6) not null,
precio_venta DECIMAL(15,2) not null,
precio_proveedor DECIMAL(15,2) not null

);
create table pedido(
codigo_pedido INT(11) not null auto_increment primary key,
fecha_pedido DATE not null,
fecha_esperada DATE,
fecha_entrega DATE ,
estado VARCHAR(15) ,
comentarios TEXT,
codigo_cliente INT(11),
foreign key (codigo_cliente) references cliente (codigo_cliente)
);
create table detalle_pedido(
codigo_pedido INT(11) not null,
foreign key (codigo_pedido) references pedido (codigo_pedido),
codigo_producto VARCHAR(15) not null,
foreign key (codigo_producto) references producto(codigo_producto),
cantidad INT(11) not null,
precio_unidad DECIMAL(15,2) not null,
numero_linea SMALLINT(6) NOT NULL
);

```
# Dia3
Esta carpeta contiene la corrección del documento del examen

## Descripción
El documento consta de un word en el cual se explicaba los pasos para realizar todos los diagramas por los cules pasa una base de datos para su realización.

# Dia4
Esta carpeta contiene los trabajos de una base de datos de una universidad

## Descripción
La base de datos universidad cuenta con las siguientes entidades o tablas en las cuales estan sus atributos correspondientes:

```sql
DROP DATABASE IF EXISTS universidad_T2;
CREATE DATABASE universidad_T2 CHARACTER SET utf8mb4;
USE universidad_T2;

CREATE TABLE departamento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE alumno (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL
);
 
CREATE TABLE profesor (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    id_departamento INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
 
 CREATE TABLE grado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
 
CREATE TABLE asignatura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT UNSIGNED NOT NULL,
    tipo ENUM('básica', 'obligatoria', 'optativa') NOT NULL,
    curso TINYINT UNSIGNED NOT NULL,
    cuatrimestre TINYINT UNSIGNED NOT NULL,
    id_profesor INT UNSIGNED,
    id_grado INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);
 
CREATE TABLE curso_escolar (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    anyo_inicio YEAR NOT NULL,
    anyo_fin YEAR NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT UNSIGNED NOT NULL,
    id_asignatura INT UNSIGNED NOT NULL,
    id_curso_escolar INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);
 

```
# Dia5
Esta carpeta contiene los trabajos de una base de datos en la cual se trabajaron las consultas y funciones.

## Descripción
La base de datos cuenta con las siguientes entidades o tablas en las cuales estan sus atributos correspondientes:

```sql
create database consultas_funciones;
use consultas_funciones;

CREATE TABLE departamento (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
gastos DOUBLE UNSIGNED NOT NULL
); 


CREATE TABLE empleado (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nif VARCHAR(9) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
id_departamento INT UNSIGNED,
FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

```
## Tecnologías utilizadas
- MySQL

## Características
- Archivos [Dia]: Estos contienen el código principal.
- Archivo [Readme]: Este contiene el Readme.

## Desarrollado por:
Los proyectos fueron desarrollados por Camilo Machuca Vega como proyectos de MySQL.