CREATE DATABASE ventas;
USE ventas;

CREATE TABLE cliente (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  categoria INT UNSIGNED
);

CREATE TABLE comercial (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comision FLOAT
);

CREATE TABLE pedido (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  total DOUBLE NOT NULL,
  fecha DATE,
  id_cliente INT UNSIGNED NOT NULL,
  id_comercial INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES
(1, 'Carlos', 'Martínez', 'González', 'Madrid', 100),
(2, 'Lucía', 'Pérez', 'Fernández', 'Barcelona', 200),
(3, 'Ricardo', 'Gómez', 'López', 'Valencia', NULL),
(4, 'Ana', 'Díaz', 'Sánchez', 'Sevilla', 300),
(5, 'Sofía', 'Ramírez', 'Moreno', 'Zaragoza', 200),
(6, 'Juan', 'López', 'García', 'Bilbao', 100),
(7, 'Beatriz', 'González', 'Rodríguez', 'Málaga', 300),
(8, 'David', 'Martínez', 'Hernández', 'Alicante', 200),
(9, 'Pedro', 'Ruiz', 'Santos', 'Palma de Mallorca', 225),
(10, 'Laura', 'Vázquez', 'Pérez', 'Murcia', 125);

INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES
(1, 'Antonio', 'Vega', 'Pérez', 0.18),
(2, 'Isabel', 'Moreno', 'Sánchez', 0.15),
(3, 'Javier', 'Fernández', 'Martín', 0.14),
(4, 'Elena', 'Hernández', 'Díaz', 0.13),
(5, 'Ricardo', 'Martínez', 'Gómez', 0.12),
(6, 'Laura', 'Sánchez', 'López', 0.10),
(7, 'Marta', 'Rodríguez', 'García', 0.11),
(8, 'Francisco', 'Gómez', 'Ruiz', 0.09);

INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES
(1, 350.75, '2024-02-15', 5, 2),
(2, 1200.50, '2024-03-01', 1, 5),
(3, 530.10, '2024-01-22', 2, 1),
(4, 800.20, '2023-12-14', 8, 3),
(5, 5000.00, '2023-11-30', 5, 2),
(6, 2200.99, '2023-10-25', 7, 1),
(7, 6000.50, '2023-09-10', 2, 1),
(8, 1900.30, '2023-08-21', 4, 6),
(9, 2300.45, '2023-07-10', 8, 3),
(10, 280.95, '2023-06-15', 8, 2),
(11, 150.60, '2023-05-17', 3, 7),
(12, 2500.99, '2024-04-05', 2, 1),
(13, 550.80, '2023-11-18', 6, 1),
(14, 135.75, '2023-10-25', 6, 1),
(15, 480.45, '2024-05-12', 1, 5),
(16, 1200.60, '2024-06-03', 1, 5);

-- ####################################################################################
-- 1. obtener el total de pedidos realizados por un cliente.
delimiter // 
create function total_pedidos( id int)
returns int 
deterministic
begin 
declare total int;
select count(p.id_cliente) into total from pedido p inner join cliente c on p.id_cliente=C.id where p.id_cliente=id;
return total;
end //
delimiter ;
select total_pedidos(1);



-- select count(p.id_cliente) from pedido p inner join cliente c on p.id_cliente=C.id where p.id_cliente=2;
-- drop function total_pedidos;
-- select total_pedidos(id) from pedido;

-- ####################################################################################
-- 2. calcular la comision total ganada por un comercial
delimiter // 
create function comision_total( id int)
returns int 
deterministic
begin 
declare total int;
declare comision2 float;
select sum(p.total) into total from comercial c inner join pedido p on c.id=p.id_comercial where c.id=id limit 1;
select comision into comision2 from comercial c inner join pedido p on c.id=p.id_comercial where c.id=id limit 1;
set total  = total* comision2;
return total;
end //
delimiter ;
select comision_total(2) as comisionTotal;
-- select sum(p.total) from comercial c inner join pedido p on c.id=p.id_comercial where c.id=2;
-- select * from comercial;
-- select * from pedido;
-- drop function comision_total;

-- ####################################################################################
-- 3. obtener el cliente con mayor total en pedidos
delimiter // 
create function mayor_pedido()
returns varchar(50)
deterministic
begin 
declare nombre_cliente varchar(50);
select c.nombre into nombre_cliente from pedido p inner join cliente c on p.id_cliente=C.id group by 1 order by sum(p.total) desc limit 1 ;
return nombre_cliente;
end //
delimiter ;

-- drop function mayor_pedido;
select mayor_pedido() as clienteConMayorTotal, p.total from pedido p inner join cliente c on p.id_cliente=C.id order by p.total desc limit 1 ;

-- ####################################################################################

-- 4. contar la cantidad de pedidos realizados en un año en especifico
-- select count(p.id_cliente) from pedido p inner join cliente c on p.id_cliente=C.id where year(p.fecha)= 2024;

delimiter // 
create function cantidadPedidos_año( año int)
returns int
deterministic
begin 
declare total int;
select count(p.fecha) into total from pedido p inner join cliente c on p.id_cliente=C.id where year(p.fecha)= año limit 1;
return total;
end //
delimiter ;
select cantidadPedidos_año(2024) as Cantidad_pedidos_año;

-- drop function cantidadPedidos_año;


-- ####################################################################################
-- 5. obtener el promedio de total de pedidos por cliente
delimiter // 
create function promedioPedidoCliente(id int)
returns decimal(10,2)
deterministic
begin 
declare total_cliente decimal(10,2);
select avg(p.total) into total_cliente  from pedido p where p.id_cliente= id;
return total_cliente;
end //
delimiter ;
-- drop function promedioPedidoCliente;
select promedioPedidoCliente(1) as promedio_pedidos;

