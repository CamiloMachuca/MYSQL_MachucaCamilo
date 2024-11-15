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
direccion varchar(50),
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

create table descuento(
id_descuento int not null auto_increment primary key,
id_vehiculo int,
foreign key(id_vehiculo) references vehiculos(id_vehiculo),
porcentaje_descuento decimal(10,2),
inicio_descuento date,
fin_descuento date

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
id_descuento int,
foreign key(id_descuento) references descuento (id_descuento)
);

INSERT INTO sucursales (celular, direccion, ciudad, telefono_fijo, correo_electronico) VALUES
('3123456789', 'Calle 1 #10-20', 'Bogotá', '6012345678', 'sucursal1@ejemplo.com'),
('3134567890', 'Calle 2 #15-30', 'Medellín', '6042345678', 'sucursal2@ejemplo.com'),
('3145678901', 'Calle 3 #20-40', 'Cali', '6022345678', 'sucursal3@ejemplo.com'),
('3156789012', 'Carrera 4 #25-50', 'Barranquilla', '6052345678', 'sucursal4@ejemplo.com'),
('3167890123', 'Avenida 5 #30-60', 'Cartagena', '6013456789', 'sucursal5@ejemplo.com'),
('3178901234', 'Calle 6 #35-70', 'Bucaramanga', '6072345678', 'sucursal6@ejemplo.com'),
('3189012345', 'Carrera 7 #40-80', 'Pereira', '6023456789', 'sucursal7@ejemplo.com'),
('3190123456', 'Calle 8 #45-90', 'Manizales', '6033456789', 'sucursal8@ejemplo.com'),
('3201234567', 'Avenida 9 #50-100', 'Santa Marta', '6043456789', 'sucursal9@ejemplo.com'),
('3212345678', 'Calle 10 #55-110', 'Bucaramanga', '6053456789', 'sucursal10@ejemplo.com'),
('3223456789', 'Carrera 11 #60-120', 'Neiva', '6014567890', 'sucursal11@ejemplo.com'),
('3234567890', 'Avenida 12 #65-130', 'Valledupar', '6024567890', 'sucursal12@ejemplo.com'),
('3245678901', 'Calle 13 #70-140', 'Armenia', '6034567890', 'sucursal13@ejemplo.com'),
('3256789012', 'Carrera 14 #75-150', 'Cúcuta', '6044567890', 'sucursal14@ejemplo.com'),
('3267890123', 'Avenida 15 #80-160', 'Pasto', '6054567890', 'sucursal15@ejemplo.com'),
('3278901234', 'Calle 16 #85-170', 'Popayán', '6015678901', 'sucursal16@ejemplo.com'),
('3289012345', 'Carrera 17 #90-180', 'Ibagué', '6025678901', 'sucursal17@ejemplo.com'),
('3290123456', 'Avenida 18 #95-190', 'Montería', '6035678901', 'sucursal18@ejemplo.com'),
('3301234567', 'Calle 19 #100-200', 'Chía', '6045678901', 'sucursal19@ejemplo.com'),
('3312345678', 'Carrera 20 #105-210', 'Soledad', '6055678901', 'sucursal20@ejemplo.com'),
('3323456789', 'Avenida 21 #110-220', 'Villavicencio', '6016789012', 'sucursal21@ejemplo.com'),
('3334567890', 'Calle 22 #115-230', 'Pereira', '6026789012', 'sucursal22@ejemplo.com'),
('3345678901', 'Carrera 23 #120-240', 'Bucaramanga', '6036789012', 'sucursal23@ejemplo.com'),
('3356789012', 'Avenida 24 #125-250', 'Neiva', '6046789012', 'sucursal24@ejemplo.com'),
('3367890123', 'Calle 25 #130-260', 'Valledupar', '6056789012', 'sucursal25@ejemplo.com'),
('3378901234', 'Carrera 26 #135-270', 'Cúcuta', '6017890123', 'sucursal26@ejemplo.com'),
('3389012345', 'Avenida 27 #140-280', 'Popayán', '6027890123', 'sucursal27@ejemplo.com'),
('3390123456', 'Calle 28 #145-290', 'Manizales', '6037890123', 'sucursal28@ejemplo.com'),
('3401234567', 'Carrera 29 #150-300', 'Cartagena', '6047890123', 'sucursal29@ejemplo.com'),
('3412345678', 'Avenida 30 #155-310', 'Santa Marta', '6057890123', 'sucursal30@ejemplo.com'),
('3423456789', 'Calle 31 #160-320', 'Bucaramanga', '6018901234', 'sucursal31@ejemplo.com'),
('3434567890', 'Carrera 32 #165-330', 'Bogotá', '6028901234', 'sucursal32@ejemplo.com'),
('3445678901', 'Avenida 33 #170-340', 'Medellín', '6038901234', 'sucursal33@ejemplo.com'),
('3456789012', 'Calle 34 #175-350', 'Cali', '6048901234', 'sucursal34@ejemplo.com'),
('3467890123', 'Carrera 35 #180-360', 'Barranquilla', '6058901234', 'sucursal35@ejemplo.com'),
('3478901234', 'Avenida 36 #185-370', 'Pereira', '6019012345', 'sucursal36@ejemplo.com'),
('3489012345', 'Calle 37 #190-380', 'Cúcuta', '6029012345', 'sucursal37@ejemplo.com'),
('3490123456', 'Carrera 38 #195-390', 'Pasto', '6039012345', 'sucursal38@ejemplo.com'),
('3501234567', 'Avenida 39 #200-400', 'Manizales', '6049012345', 'sucursal39@ejemplo.com'),
('3512345678', 'Calle 40 #205-410', 'Ibagué', '6059012345', 'sucursal40@ejemplo.com'),
('3523456789', 'Carrera 41 #210-420', 'Montería', '6010123456', 'sucursal41@ejemplo.com'),
('3534567890', 'Avenida 42 #215-430', 'Chía', '6020123456', 'sucursal42@ejemplo.com'),
('3545678901', 'Calle 43 #220-440', 'Villavicencio', '6030123456', 'sucursal43@ejemplo.com'),
('3556789012', 'Carrera 44 #225-450', 'Valledupar', '6040123456', 'sucursal44@ejemplo.com'),
('3567890123', 'Avenida 45 #230-460', 'Neiva', '6050123456', 'sucursal45@ejemplo.com'),
('3578901234', 'Calle 46 #235-470', 'Cali', '6011234567', 'sucursal46@ejemplo.com'),
('3589012345', 'Carrera 47 #240-480', 'Barranquilla', '6021234567', 'sucursal47@ejemplo.com'),
('3590123456', 'Avenida 48 #245-490', 'Pereira', '6031234567', 'sucursal48@ejemplo.com'),
('3601234567', 'Calle 49 #250-500', 'Medellín', '6041234567', 'sucursal49@ejemplo.com'),
('3612345678', 'Carrera 50 #255-510', 'Bogotá', '6051234567', 'sucursal50@ejemplo.com'),
('3623456789', 'Avenida 51 #260-520', 'Cúcuta', '6012345678', 'sucursal51@ejemplo.com'),
('3634567890', 'Calle 52 #265-530', 'Cartagena', '6022345678', 'sucursal52@ejemplo.com'),
('3645678901', 'Carrera 53 #270-540', 'Santa Marta', '6032345678', 'sucursal53@ejemplo.com'),
('3656789012', 'Avenida 54 #275-550', 'Bucaramanga', '6042345678', 'sucursal54@ejemplo.com'),
('3667890123', 'Calle 55 #280-560', 'Ibagué', '6052345678', 'sucursal55@ejemplo.com'),
('3678901234', 'Carrera 56 #285-570', 'Manizales', '6013456789', 'sucursal56@ejemplo.com'),
('3689012345', 'Avenida 57 #290-580', 'Cúcuta', '6023456789', 'sucursal57@ejemplo.com'),
('3690123456', 'Calle 58 #295-590', 'Pasto', '6033456789', 'sucursal58@ejemplo.com'),
('3701234567', 'Carrera 59 #300-600', 'Valledupar', '6043456789', 'sucursal59@ejemplo.com'),
('3712345678', 'Avenida 60 #305-610', 'Popayán', '6053456789', 'sucursal60@ejemplo.com'),
('3723456789', 'Calle 61 #310-620', 'Bucaramanga', '6014567890', 'sucursal61@ejemplo.com'),
('3734567890', 'Carrera 62 #315-630', 'Cali', '6024567890', 'sucursal62@ejemplo.com'),
('3745678901', 'Avenida 63 #320-640', 'Barranquilla', '6034567890', 'sucursal63@ejemplo.com'),
('3756789012', 'Calle 64 #325-650', 'Medellín', '6044567890', 'sucursal64@ejemplo.com'),
('3767890123', 'Carrera 65 #330-660', 'Bogotá', '6054567890', 'sucursal65@ejemplo.com'),
('3778901234', 'Avenida 66 #335-670', 'Pereira', '6015678901', 'sucursal66@ejemplo.com'),
('3789012345', 'Calle 67 #340-680', 'Cúcuta', '6025678901', 'sucursal67@ejemplo.com'),
('3790123456', 'Carrera 68 #345-690', 'Santa Marta', '6035678901', 'sucursal68@ejemplo.com'),
('3801234567', 'Avenida 69 #350-700', 'Valledupar', '6045678901', 'sucursal69@ejemplo.com'),
('3812345678', 'Calle 70 #355-710', 'Ibagué', '6055678901', 'sucursal70@ejemplo.com'),
('3823456789', 'Carrera 71 #360-720', 'Popayán', '6016789012', 'sucursal71@ejemplo.com'),
('3834567890', 'Avenida 72 #365-730', 'Bucaramanga', '6026789012', 'sucursal72@ejemplo.com'),
('3845678901', 'Calle 73 #370-740', 'Medellín', '6036789012', 'sucursal73@ejemplo.com'),
('3856789012', 'Carrera 74 #375-750', 'Barranquilla', '6046789012', 'sucursal74@ejemplo.com'),
('3867890123', 'Avenida 75 #380-760', 'Cali', '6056789012', 'sucursal75@ejemplo.com'),
('3878901234', 'Calle 76 #385-770', 'Pereira', '6017890123', 'sucursal76@ejemplo.com'),
('3889012345', 'Carrera 77 #390-780', 'Cúcuta', '6027890123', 'sucursal77@ejemplo.com'),
('3890123456', 'Avenida 78 #395-790', 'Santa Marta', '6037890123', 'sucursal78@ejemplo.com'),
('3901234567', 'Calle 79 #400-800', 'Ibagué', '6047890123', 'sucursal79@ejemplo.com'),
('3912345678', 'Carrera 80 #405-810', 'Manizales', '6057890123', 'sucursal80@ejemplo.com'),
('3923456789', 'Avenida 81 #410-820', 'Popayán', '6018901234', 'sucursal81@ejemplo.com'),
('3934567890', 'Calle 82 #415-830', 'Valledupar', '6028901234', 'sucursal82@ejemplo.com'),
('3945678901', 'Carrera 83 #420-840', 'Bucaramanga', '6038901234', 'sucursal83@ejemplo.com'),
('3956789012', 'Avenida 84 #425-850', 'Cartagena', '6048901234', 'sucursal84@ejemplo.com'),
('3967890123', 'Calle 85 #430-860', 'Cali', '6058901234', 'sucursal85@ejemplo.com'),
('3978901234', 'Carrera 86 #435-870', 'Barranquilla', '6019012345', 'sucursal86@ejemplo.com'),
('3989012345', 'Avenida 87 #440-880', 'Pereira', '6029012345', 'sucursal87@ejemplo.com'),
('3990123456', 'Calle 88 #445-890', 'Medellín', '6039012345', 'sucursal88@ejemplo.com'),
('4001234567', 'Carrera 89 #450-900', 'Bogotá', '6049012345', 'sucursal89@ejemplo.com'),
('4012345678', 'Avenida 90 #455-910', 'Ibagué', '6059012345', 'sucursal90@ejemplo.com'),
('4023456789', 'Calle 91 #460-920', 'Cúcuta', '6010123456', 'sucursal91@ejemplo.com'),
('4034567890', 'Carrera 92 #465-930', 'Pasto', '6020123456', 'sucursal92@ejemplo.com'),
('4045678901', 'Avenida 93 #470-940', 'Santa Marta', '6030123456', 'sucursal93@ejemplo.com'),
('4056789012', 'Calle 94 #475-950', 'Cali', '6040123456', 'sucursal94@ejemplo.com'),
('4067890123', 'Carrera 95 #480-960', 'Barranquilla', '6050123456', 'sucursal95@ejemplo.com'),
('4078901234', 'Avenida 96 #485-970', 'Medellín', '6011234567', 'sucursal96@ejemplo.com'),
('4089012345', 'Calle 97 #490-980', 'Valledupar', '6021234567', 'sucursal97@ejemplo.com'),
('4090123456', 'Carrera 98 #495-990', 'Popayán', '6031234567', 'sucursal98@ejemplo.com'),
('4101234567', 'Avenida 99 #500-1000', 'Bucaramanga', '6041234567', 'sucursal99@ejemplo.com'),
('4112345678', 'Calle 100 #505-1010', 'Cúcuta', '6051234567', 'sucursal100@ejemplo.com');


INSERT INTO empleados (ciudad_residencia, cedula, nombre, apellido1, apellido2, direccion, celular, id_sucursal, correo_electronico) VALUES
('Bogotá', '1012345678', 'Carlos', 'González', 'Ramírez', 'Calle 1 #10-20', '3123456789', 1, 'carlos.gonzalez@ejemplo.com'),
('Medellín', '1023456789', 'Laura', 'Pérez', 'Hernández', 'Carrera 2 #15-30', '3134567890', 2, 'laura.perez@ejemplo.com'),
('Cali', '1034567890', 'Miguel', 'Rodríguez', 'Torres', 'Calle 3 #20-40', '3145678901', 3, 'miguel.rodriguez@ejemplo.com'),
('Barranquilla', '1045678901', 'Ana', 'Martínez', 'Sánchez', 'Carrera 4 #25-50', '3156789012', 4, 'ana.martinez@ejemplo.com'),
('Cartagena', '1056789012', 'Luis', 'Fernández', 'Gómez', 'Avenida 5 #30-60', '3167890123', 5, 'luis.fernandez@ejemplo.com'),
('Bucaramanga', '1067890123', 'Paola', 'García', 'Jiménez', 'Calle 6 #35-70', '3178901234', 6, 'paola.garcia@ejemplo.com'),
('Pereira', '1078901234', 'Andrés', 'Lopez', 'Vargas', 'Carrera 7 #40-80', '3189012345', 7, 'andres.lopez@ejemplo.com'),
('Manizales', '1089012345', 'María', 'Díaz', 'Ramírez', 'Calle 8 #45-90', '3190123456', 8, 'maria.diaz@ejemplo.com'),
('Santa Marta', '1090123456', 'Javier', 'Muñoz', 'Reyes', 'Avenida 9 #50-100', '3201234567', 9, 'javier.munoz@ejemplo.com'),
('Bucaramanga', '1101234567', 'Sofía', 'Álvarez', 'Mendoza', 'Calle 10 #55-110', '3212345678', 10, 'sofia.alvarez@ejemplo.com'),
('Neiva', '1112345678', 'Pedro', 'Ramírez', 'López', 'Carrera 11 #60-120', '3223456789', 11, 'pedro.ramirez@ejemplo.com'),
('Valledupar', '1123456789', 'Mónica', 'Martínez', 'Figueroa', 'Avenida 12 #65-130', '3234567890', 12, 'monica.martinez@ejemplo.com'),
('Armenia', '1134567890', 'Ricardo', 'Hernández', 'López', 'Calle 13 #70-140', '3245678901', 13, 'ricardo.hernandez@ejemplo.com'),
('Cúcuta', '1145678901', 'Isabel', 'Gómez', 'Torres', 'Carrera 14 #75-150', '3256789012', 14, 'isabel.gomez@ejemplo.com'),
('Pasto', '1156789012', 'Felipe', 'Vásquez', 'Jiménez', 'Avenida 15 #80-160', '3267890123', 15, 'felipe.vasquez@ejemplo.com'),
('Popayán', '1167890123', 'Claudia', 'Martínez', 'Pérez', 'Calle 16 #85-170', '3278901234', 16, 'claudia.martinez@ejemplo.com'),
('Ibagué', '1178901234', 'Oscar', 'Rodríguez', 'García', 'Carrera 17 #90-180', '3289012345', 17, 'oscar.rodriguez@ejemplo.com'),
('Montería', '1189012345', 'Sandra', 'López', 'Vargas', 'Avenida 18 #95-190', '3290123456', 18, 'sandra.lopez@ejemplo.com'),
('Chía', '1190123456', 'Juan', 'Torres', 'Díaz', 'Calle 19 #100-200', '3301234567', 19, 'juan.torres@ejemplo.com'),
('Soledad', '1201234567', 'Carolina', 'Sánchez', 'Gutiérrez', 'Carrera 20 #105-210', '3312345678', 20, 'carolina.sanchez@ejemplo.com'),
('Villavicencio', '1212345678', 'Luis', 'Ríos', 'Suárez', 'Avenida 21 #110-220', '3323456789', 21, 'luis.rios@ejemplo.com'),
('Pereira', '1223456789', 'José', 'Cordero', 'Vásquez', 'Calle 22 #115-230', '3334567890', 22, 'jose.cordero@ejemplo.com'),
('Bucaramanga', '1234567890', 'Verónica', 'Torres', 'Guzmán', 'Carrera 23 #120-240', '3345678901', 23, 'veronica.torres@ejemplo.com'),
('Neiva', '1245678901', 'Alejandro', 'Vargas', 'González', 'Avenida 24 #125-250', '3356789012', 24, 'alejandro.vargas@ejemplo.com'),
('Valledupar', '1256789012', 'Natalia', 'Rivas', 'Sánchez', 'Calle 25 #130-260', '3367890123', 25, 'natalia.rivas@ejemplo.com'),
('Cúcuta', '1267890123', 'Carlos', 'Mendoza', 'Soto', 'Carrera 26 #135-270', '3378901234', 26, 'carlos.mendoza@ejemplo.com'),
('Popayán', '1278901234', 'Sofía', 'Rodríguez', 'Martínez', 'Avenida 27 #140-280', '3389012345', 27, 'sofia.rodriguez@ejemplo.com'),
('Pasto', '1289012345', 'Luis', 'Díaz', 'Torres', 'Calle 28 #145-290', '3390123456', 28, 'luis.diaz@ejemplo.com'),
('Montería', '1290123456', 'Laura', 'Vásquez', 'Suárez', 'Carrera 29 #150-300', '3401234567', 29, 'laura.vasquez@ejemplo.com'),
('Chía', '1301234567', 'Ricardo', 'Fernández', 'Moreno', 'Avenida 30 #155-310', '3412345678', 30, 'ricardo.fernandez@ejemplo.com'),
('Villavicencio', '1312345678', 'María', 'López', 'Figueroa', 'Calle 31 #160-320', '3423456789', 31, 'maria.lopez@ejemplo.com'),
('Santa Marta', '1323456789', 'Miguel', 'Ramírez', 'González', 'Carrera 32 #165-330', '3434567890', 32, 'miguel.ramirez@ejemplo.com'),
('Neiva', '1334567890', 'Elena', 'Gutiérrez', 'Vargas', 'Avenida 33 #170-340', '3445678901', 33, 'elena.gutierrez@ejemplo.com'),
('Pereira', '1345678901', 'Juan', 'López', 'Ramírez', 'Calle 34 #175-350', '3456789012', 34, 'juan.lopez@ejemplo.com'),
('Bucaramanga', '1356789012', 'Javier', 'Fernández', 'Gutiérrez', 'Carrera 35 #180-360', '3467890123', 35, 'javier.fernandez@ejemplo.com'),
('Cúcuta', '1367890123', 'Carmen', 'Vargas', 'Ríos', 'Avenida 36 #185-370', '3478901234', 36, 'carmen.vargas@ejemplo.com'),
('Barranquilla', '1378901234', 'Ricardo', 'González', 'Moreno', 'Calle 37 #190-380', '3489012345', 37, 'ricardo.gonzalez@ejemplo.com'),
('Manizales', '1389012345', 'José', 'Mendoza', 'Torres', 'Carrera 38 #195-390', '3490123456', 38, 'jose.mendoza@ejemplo.com'),
('Medellín', '1390123456', 'Gabriela', 'Ríos', 'García', 'Avenida 39 #200-400', '3501234567', 39, 'gabriela.rios@ejemplo.com'),
('Popayán', '1401234567', 'Carlos', 'Vargas', 'Gómez', 'Calle 40 #205-410', '3512345678', 40, 'carlos.vargas@ejemplo.com'),
('Cali', '1412345678', 'Luis', 'Muñoz', 'Figueroa', 'Carrera 41 #210-420', '3523456789', 41, 'luis.munoz@ejemplo.com'),
('Bucaramanga', '1423456789', 'Sara', 'Gómez', 'López', 'Avenida 42 #215-430', '3534567890', 42, 'sara.gomez@ejemplo.com'),
('Chía', '1434567890', 'David', 'Rodríguez', 'Mora', 'Calle 43 #220-440', '3545678901', 43, 'david.rodriguez@ejemplo.com'),
('Cúcuta', '1445678901', 'Margarita', 'Hernández', 'Sánchez', 'Carrera 44 #225-450', '3556789012', 44, 'margarita.hernandez@ejemplo.com'),
('Valledupar', '1456789012', 'Sofía', 'González', 'Reyes', 'Avenida 45 #230-460', '3567890123', 45, 'sofia.gonzalez@ejemplo.com'),
('Santa Marta', '1467890123', 'Carlos', 'Mora', 'Rodríguez', 'Calle 46 #235-470', '3578901234', 46, 'carlos.mora@ejemplo.com'),
('Cali', '1478901234', 'Laura', 'Vásquez', 'Gómez', 'Carrera 47 #240-480', '3589012345', 47, 'laura.vasquez@ejemplo.com'),
('Medellín', '1489012345', 'Pedro', 'Díaz', 'Hernández', 'Avenida 48 #245-490', '3590123456', 48, 'pedro.diaz@ejemplo.com'),
('Popayán', '1490123456', 'Antonio', 'Vargas', 'Torres', 'Calle 49 #250-500', '3601234567', 49, 'antonio.vargas@ejemplo.com'),
('Barranquilla', '1501234567', 'Camila', 'Fernández', 'López', 'Carrera 50 #255-510', '3612345678', 50, 'camila.fernandez@ejemplo.com'),
('Popayán', '1512345678', 'Martín', 'López', 'Díaz', 'Calle 51 #260-520', '3623456789', 51, 'martin.lopez@ejemplo.com'),
('Medellín', '1523456789', 'Beatriz', 'Torres', 'González', 'Carrera 52 #265-530', '3634567890', 52, 'beatriz.torres@ejemplo.com'),
('Barranquilla', '1534567890', 'Eduardo', 'Gómez', 'Vargas', 'Avenida 53 #270-540', '3645678901', 53, 'eduardo.gomez@ejemplo.com'),
('Santa Marta', '1545678901', 'Liliana', 'Hernández', 'Ramírez', 'Calle 54 #275-550', '3656789012', 54, 'liliana.hernandez@ejemplo.com'),
('Bucaramanga', '1556789012', 'Ricardo', 'Sánchez', 'Mora', 'Carrera 55 #280-560', '3667890123', 55, 'ricardo.sanchez@ejemplo.com'),
('Pereira', '1567890123', 'Antonio', 'Ríos', 'Martínez', 'Avenida 56 #285-570', '3678901234', 56, 'antonio.rios@ejemplo.com'),
('Cúcuta', '1578901234', 'Natalia', 'Vargas', 'Reyes', 'Calle 57 #290-580', '3689012345', 57, 'natalia.vargas@ejemplo.com'),
('Popayán', '1589012345', 'Carlos', 'Vásquez', 'González', 'Carrera 58 #295-590', '3690123456', 58, 'carlos.vasquez@ejemplo.com'),
('Montería', '1590123456', 'Sara', 'Torres', 'Gutiérrez', 'Avenida 59 #300-600', '3701234567', 59, 'sara.torres@ejemplo.com'),
('Cali', '1601234567', 'Oscar', 'Ramírez', 'Moreno', 'Calle 60 #305-610', '3712345678', 60, 'oscar.ramirez@ejemplo.com'),
('Medellín', '1612345678', 'Luis', 'López', 'Hernández', 'Carrera 61 #310-620', '3723456789', 61, 'luis.lopez@ejemplo.com'),
('Valledupar', '1623456789', 'Elena', 'González', 'Ramírez', 'Avenida 62 #315-630', '3734567890', 62, 'elena.gonzalez@ejemplo.com'),
('Barranquilla', '1634567890', 'José', 'Martínez', 'Torres', 'Calle 63 #320-640', '3745678901', 63, 'jose.martinez@ejemplo.com'),
('Cúcuta', '1645678901', 'Claudia', 'Gómez', 'Ramírez', 'Carrera 64 #325-650', '3756789012', 64, 'claudia.gomez@ejemplo.com'),
('Pereira', '1656789012', 'María', 'Rodríguez', 'Vásquez', 'Avenida 65 #330-660', '3767890123', 65, 'maria.rodriguez@ejemplo.com'),
('Popayán', '1667890123', 'Juan', 'Vásquez', 'López', 'Calle 66 #335-670', '3778901234', 66, 'juan.vasquez@ejemplo.com'),
('Chía', '1678901234', 'Daniela', 'Fernández', 'González', 'Carrera 67 #340-680', '3789012345', 67, 'daniela.fernandez@ejemplo.com'),
('Cali', '1689012345', 'Felipe', 'Gómez', 'Mora', 'Avenida 68 #345-690', '3790123456', 68, 'felipe.gomez@ejemplo.com'),
('Medellín', '1690123456', 'Oscar', 'Muñoz', 'Sánchez', 'Calle 69 #350-700', '3801234567', 69, 'oscar.munoz@ejemplo.com'),
('Barranquilla', '1701234567', 'Paola', 'Sánchez', 'Moreno', 'Carrera 70 #355-710', '3812345678', 70, 'paola.sanchez@ejemplo.com'),
('Montería', '1712345678', 'Ricardo', 'Rodríguez', 'González', 'Avenida 71 #360-720', '3823456789', 71, 'ricardo.rodriguez@ejemplo.com'),
('Bucaramanga', '1723456789', 'Sofía', 'López', 'Gutiérrez', 'Calle 72 #365-730', '3834567890', 72, 'sofia.lopez@ejemplo.com'),
('Cúcuta', '1734567890', 'José', 'Martínez', 'Vargas', 'Carrera 73 #370-740', '3845678901', 73, 'jose.martinez@ejemplo.com'),
('Popayán', '1745678901', 'Carolina', 'Reyes', 'Muñoz', 'Avenida 74 #375-750', '3856789012', 74, 'carolina.reyes@ejemplo.com'),
('Pereira', '1756789012', 'Luis', 'Sánchez', 'López', 'Calle 75 #380-760', '3867890123', 75, 'luis.sanchez@ejemplo.com'),
('Medellín', '1767890123', 'Andrés', 'González', 'Moreno', 'Carrera 76 #385-770', '3878901234', 76, 'andres.gonzalez@ejemplo.com'),
('Cali', '1778901234', 'Claudia', 'Díaz', 'Sánchez', 'Avenida 77 #390-780', '3889012345', 77, 'claudia.diaz@ejemplo.com'),
('Barranquilla', '1789012345', 'Javier', 'Rodríguez', 'Vásquez', 'Calle 78 #395-790', '3890123456', 78, 'javier.rodriguez@ejemplo.com'),
('Popayán', '1790123456', 'Carlos', 'Muñoz', 'González', 'Carrera 79 #400-800', '3901234567', 79, 'carlos.munoz@ejemplo.com'),
('Bucaramanga', '1801234567', 'Verónica', 'Gómez', 'Torres', 'Avenida 80 #405-810', '3912345678', 80, 'veronica.gomez@ejemplo.com'),
('Cúcuta', '1812345678', 'Felipe', 'Vargas', 'Ramírez', 'Calle 81 #410-820', '3923456789', 81, 'felipe.vargas@ejemplo.com'),
('Pereira', '1823456789', 'Natalia', 'Díaz', 'López', 'Carrera 82 #415-830', '3934567890', 82, 'natalia.diaz@ejemplo.com'),
('Medellín', '1834567890', 'José', 'Sánchez', 'Muñoz', 'Avenida 83 #420-840', '3945678901', 83, 'jose.sanchez@ejemplo.com'),
('Barranquilla', '1845678901', 'María', 'González', 'Moreno', 'Calle 84 #425-850', '3956789012', 84, 'maria.gonzalez@ejemplo.com'),
('Cali', '1856789012', 'Carlos', 'Torres', 'Díaz', 'Carrera 85 #430-860', '3967890123', 85, 'carlos.torres@ejemplo.com'),
('Popayán', '1867890123', 'Beatriz', 'Vásquez', 'Reyes', 'Avenida 86 #435-870', '3978901234', 86, 'beatriz.vasquez@ejemplo.com'),
('Pereira', '1878901234', 'Luis', 'Martínez', 'Fernández', 'Calle 87 #440-880', '3989012345', 87, 'luis.martinez@ejemplo.com'),
('Medellín', '1889012345', 'Andrés', 'López', 'González', 'Carrera 88 #445-890', '3990123456', 88, 'andres.lopez@ejemplo.com'),
('Barranquilla', '1890123456', 'Felipe', 'Martínez', 'Muñoz', 'Avenida 89 #450-900', '4001234567', 89, 'felipe.martinez@ejemplo.com'),
('Bucaramanga', '1901234567', 'Carlos', 'González', 'Torres', 'Calle 90 #455-910', '4012345678', 90, 'carlos.gonzalez@ejemplo.com'),
('Cali', '1912345678', 'Javier', 'Sánchez', 'Reyes', 'Carrera 91 #460-920', '4023456789', 91, 'javier.sanchez@ejemplo.com'),
('Chía', '1923456789', 'Margarita', 'López', 'González', 'Avenida 92 #465-930', '4034567890', 92, 'margarita.lopez@ejemplo.com'),
('Montería', '1934567890', 'Antonio', 'Rodríguez', 'Gutiérrez', 'Calle 93 #470-940', '4045678901', 93, 'antonio.rodriguez@ejemplo.com'),
('Cúcuta', '1945678901', 'Gabriela', 'Vásquez', 'Ramírez', 'Carrera 94 #475-950', '4056789012', 94, 'gabriela.vasquez@ejemplo.com'),
('Popayán', '1956789012', 'José', 'Rodríguez', 'Torres', 'Avenida 95 #480-960', '4067890123', 95, 'jose.rodriguez@ejemplo.com'),
('Medellín', '1967890123', 'Ricardo', 'Martínez', 'Moreno', 'Calle 96 #485-970', '4078901234', 96, 'ricardo.martinez@ejemplo.com'),
('Pereira', '1978901234', 'Carolina', 'Sánchez', 'Gómez', 'Carrera 97 #490-980', '4089012345', 97, 'carolina.sanchez@ejemplo.com'),
('Cali', '1989012345', 'Margarita', 'Reyes', 'Fernández', 'Avenida 98 #495-990', '4090123456', 98, 'margarita.reyes@ejemplo.com'),
('Barranquilla', '1990123456', 'Felipe', 'López', 'González', 'Calle 99 #500-1000', '4101234567', 99, 'felipe.lopez@ejemplo.com'),
('Valledupar', '2001234567', 'José', 'González', 'Muñoz', 'Carrera 100 #505-1010', '4112345678', 100, 'jose.gonzalez@ejemplo.com');


INSERT INTO clientes (cedula, nombre, apellido1, apellido2, direccion, correo_electronico, celular, ciudad_residencia) VALUES
('1012345678', 'Carlos', 'González', 'Ramírez', 'Calle 1 #10-20', 'carlos.gonzalez@ejemplo.com', '3123456789', 'Bogotá'),
('1023456789', 'Laura', 'Pérez', 'Hernández', 'Carrera 2 #15-30', 'laura.perez@ejemplo.com', '3134567890', 'Medellín'),
('1034567890', 'Miguel', 'Rodríguez', 'Torres', 'Calle 3 #20-40', 'miguel.rodriguez@ejemplo.com', '3145678901', 'Cali'),
('1045678901', 'Ana', 'Martínez', 'Sánchez', 'Carrera 4 #25-50', 'ana.martinez@ejemplo.com', '3156789012', 'Barranquilla'),
('1056789012', 'Luis', 'Fernández', 'Gómez', 'Avenida 5 #30-60', 'luis.fernandez@ejemplo.com', '3167890123', 'Cartagena'),
('1067890123', 'Paola', 'García', 'Jiménez', 'Calle 6 #35-70', 'paola.garcia@ejemplo.com', '3178901234', 'Bucaramanga'),
('1078901234', 'Andrés', 'Lopez', 'Vargas', 'Carrera 7 #40-80', 'andres.lopez@ejemplo.com', '3189012345', 'Pereira'),
('1089012345', 'María', 'Díaz', 'Ramírez', 'Calle 8 #45-90', 'maria.diaz@ejemplo.com', '3190123456', 'Manizales'),
('1090123456', 'Javier', 'Muñoz', 'Reyes', 'Avenida 9 #50-100', 'javier.munoz@ejemplo.com', '3201234567', 'Santa Marta'),
('1101234567', 'Sofía', 'Álvarez', 'Mendoza', 'Calle 10 #55-110', 'sofia.alvarez@ejemplo.com', '3212345678', 'Neiva'),
('1112345678', 'Pedro', 'Ramírez', 'López', 'Carrera 11 #60-120', 'pedro.ramirez@ejemplo.com', '3223456789', 'Valledupar'),
('1123456789', 'Mónica', 'Martínez', 'Figueroa', 'Avenida 12 #65-130', 'monica.martinez@ejemplo.com', '3234567890', 'Armenia'),
('1134567890', 'Ricardo', 'Hernández', 'López', 'Calle 13 #70-140', 'ricardo.hernandez@ejemplo.com', '3245678901', 'Cúcuta'),
('1145678901', 'Isabel', 'Gómez', 'Torres', 'Carrera 14 #75-150', 'isabel.gomez@ejemplo.com', '3256789012', 'Pasto'),
('1156789012', 'Felipe', 'Vásquez', 'Jiménez', 'Avenida 15 #80-160', 'felipe.vasquez@ejemplo.com', '3267890123', 'Popayán'),
('1167890123', 'Claudia', 'Martínez', 'Pérez', 'Calle 16 #85-170', 'claudia.martinez@ejemplo.com', '3278901234', 'Ibagué'),
('1178901234', 'Oscar', 'Rodríguez', 'García', 'Carrera 17 #90-180', 'oscar.rodriguez@ejemplo.com', '3289012345', 'Montería'),
('1189012345', 'Sandra', 'López', 'Vargas', 'Avenida 18 #95-190', 'sandra.lopez@ejemplo.com', '3290123456', 'Chía'),
('1190123456', 'Juan', 'Torres', 'Díaz', 'Calle 19 #100-200', 'juan.torres@ejemplo.com', '3301234567', 'Soledad'),
('1201234567', 'Carolina', 'Sánchez', 'Gutiérrez', 'Carrera 20 #105-210', 'carolina.sanchez@ejemplo.com', '3312345678', 'Villavicencio'),
('1212345678', 'Luis', 'Ríos', 'Suárez', 'Avenida 21 #110-220', 'luis.rios@ejemplo.com', '3323456789', 'Pereira'),
('1223456789', 'José', 'Cordero', 'Vásquez', 'Calle 22 #115-230', 'jose.cordero@ejemplo.com', '3334567890', 'Bucaramanga'),
('1234567890', 'Verónica', 'Torres', 'Guzmán', 'Carrera 23 #120-240', 'veronica.torres@ejemplo.com', '3345678901', 'Neiva'),
('1245678901', 'Alejandro', 'Vargas', 'González', 'Avenida 24 #125-250', 'alejandro.vargas@ejemplo.com', '3356789012', 'Valledupar'),
('1256789012', 'Natalia', 'Rivas', 'Sánchez', 'Calle 25 #130-260', 'natalia.rivas@ejemplo.com', '3367890123', 'Cúcuta'),
('1267890123', 'Carlos', 'Mendoza', 'Soto', 'Carrera 26 #135-270', 'carlos.mendoza@ejemplo.com', '3378901234', 'Cartagena'),
('1278901234', 'Sofía', 'Rodríguez', 'Martínez', 'Avenida 27 #140-280', 'sofia.rodriguez@ejemplo.com', '3389012345', 'Popayán'),
('1289012345', 'Luis', 'Díaz', 'Torres', 'Calle 28 #145-290', 'luis.diaz@ejemplo.com', '3390123456', 'Manizales'),
('1290123456', 'Laura', 'Vásquez', 'Suárez', 'Carrera 29 #150-300', 'laura.vasquez@ejemplo.com', '3401234567', 'Montería'),
('1301234567', 'Ricardo', 'Fernández', 'Moreno', 'Avenida 30 #155-310', 'ricardo.fernandez@ejemplo.com', '3412345678', 'Villavicencio'),
('1312345678', 'María', 'López', 'Figueroa', 'Calle 31 #160-320', 'maria.lopez@ejemplo.com', '3423456789', 'Santa Marta'),
('1323456789', 'Miguel', 'Ramírez', 'González', 'Carrera 32 #165-330', 'miguel.ramirez@ejemplo.com', '3434567890', 'Chía'),
('1334567890', 'Elena', 'Gutiérrez', 'Vargas', 'Avenida 33 #170-340', 'elena.gutierrez@ejemplo.com', '3445678901', 'Popayán'),
('1345678901', 'Juan', 'López', 'Ramírez', 'Calle 34 #175-350', 'juan.lopez@ejemplo.com', '3456789012', 'Barranquilla'),
('1356789012', 'Javier', 'Fernández', 'Gutiérrez', 'Carrera 35 #180-360', 'javier.fernandez@ejemplo.com', '3467890123', 'Medellín'),
('1367890123', 'Carmen', 'Vargas', 'Ríos', 'Avenida 36 #185-370', 'carmen.vargas@ejemplo.com', '3478901234', 'Ibagué'),
('1378901234', 'Ricardo', 'González', 'Moreno', 'Calle 37 #190-380', 'ricardo.gonzalez@ejemplo.com', '3489012345', 'Cali'),
('1389012345', 'José', 'Mendoza', 'Torres', 'Carrera 38 #195-390', 'jose.mendoza@ejemplo.com', '3490123456', 'Cúcuta'),
('1390123456', 'Gabriela', 'Ríos', 'García', 'Avenida 39 #200-400', 'gabriela.rios@ejemplo.com', '3501234567', 'Valledupar'),
('1401234567', 'Carlos', 'Vargas', 'Gómez', 'Calle 40 #205-410', 'carlos.vargas@ejemplo.com', '3512345678', 'Santa Marta'),
('1412345678', 'Luis', 'Muñoz', 'Figueroa', 'Carrera 41 #210-420', 'luis.munoz@ejemplo.com', '3523456789', 'Cali'),
('1423456789', 'Sara', 'Gómez', 'López', 'Avenida 42 #215-430', 'sara.gomez@ejemplo.com', '3534567890', 'Bucaramanga'),
('1434567890', 'David', 'Rodríguez', 'Mora', 'Calle 43 #220-440', 'david.rodriguez@ejemplo.com', '3545678901', 'Chía'),
('1445678901', 'Margarita', 'Hernández', 'Sánchez', 'Carrera 44 #225-450', 'margarita.hernandez@ejemplo.com', '3556789012', 'Cúcuta'),
('1456789012', 'Sofía', 'González', 'Reyes', 'Avenida 45 #230-460', 'sofia.gonzalez@ejemplo.com', '3567890123', 'Valledupar'),
('1467890123', 'Carlos', 'Mora', 'Rodríguez', 'Calle 46 #235-470', 'carlos.mora@ejemplo.com', '3578901234', 'Santa Marta'),
('1478901234', 'Laura', 'Vásquez', 'Gómez', 'Carrera 47 #240-480', 'laura.vasquez@ejemplo.com', '3589012345', 'Cali'),
('1489012345', 'Pedro', 'Díaz', 'Hernández', 'Avenida 48 #245-490', 'pedro.diaz@ejemplo.com', '3590123456', 'Medellín'),
('1490123456', 'Antonio', 'Vargas', 'Torres', 'Calle 49 #250-500', 'antonio.vargas@ejemplo.com', '3601234567', 'Popayán'),
('1501234567', 'Camila', 'Fernández', 'López', 'Carrera 50 #255-510', 'camila.fernandez@ejemplo.com', '3612345678', 'Barranquilla'),
('1512345678', 'Ricardo', 'Muñoz', 'Rodríguez', 'Calle 51 #260-520', 'ricardo.munoz@ejemplo.com', '3623456789', 'Cartagena'),
('1523456789', 'Valentina', 'Ramírez', 'Sánchez', 'Carrera 52 #265-530', 'valentina.ramirez@ejemplo.com', '3634567890', 'Cali'),
('1534567890', 'Alejandro', 'Torres', 'Mendoza', 'Avenida 53 #270-540', 'alejandro.torres@ejemplo.com', '3645678901', 'Bucaramanga'),
('1545678901', 'Elena', 'Gómez', 'Martínez', 'Calle 54 #275-550', 'elena.gomez@ejemplo.com', '3656789012', 'Popayán'),
('1556789012', 'José', 'Rodríguez', 'Muñoz', 'Carrera 55 #280-560', 'jose.rodriguez@ejemplo.com', '3667890123', 'Barranquilla'),
('1567890123', 'Andrea', 'Vásquez', 'Ramírez', 'Avenida 56 #285-570', 'andrea.vasquez@ejemplo.com', '3678901234', 'Montería'),
('1578901234', 'David', 'González', 'Vásquez', 'Calle 57 #290-580', 'david.gonzalez@ejemplo.com', '3689012345', 'Cúcuta'),
('1589012345', 'Carmen', 'Martínez', 'Vargas', 'Carrera 58 #295-590', 'carmen.martinez@ejemplo.com', '3690123456', 'Villavicencio'),
('1590123456', 'Oscar', 'Sánchez', 'Moreno', 'Avenida 59 #300-600', 'oscar.sanchez@ejemplo.com', '3701234567', 'Cali'),
('1601234567', 'José', 'Muñoz', 'Torres', 'Calle 60 #305-610', 'jose.munoz@ejemplo.com', '3712345678', 'Cartagena'),
('1612345678', 'Pedro', 'Vásquez', 'González', 'Carrera 61 #310-620', 'pedro.vasquez@ejemplo.com', '3723456789', 'Pereira'),
('1623456789', 'Lucía', 'Gómez', 'Suárez', 'Avenida 62 #315-630', 'lucia.gomez@ejemplo.com', '3734567890', 'Neiva'),
('1634567890', 'José', 'Reyes', 'López', 'Calle 63 #320-640', 'jose.reyes@ejemplo.com', '3745678901', 'Manizales'),
('1645678901', 'Ana', 'Vásquez', 'Jiménez', 'Carrera 64 #325-650', 'ana.vasquez@ejemplo.com', '3756789012', 'Medellín'),
('1656789012', 'Sofía', 'Martínez', 'Ramírez', 'Avenida 65 #330-660', 'sofia.martinez@ejemplo.com', '3767890123', 'Bucaramanga'),
('1667890123', 'Carlos', 'López', 'Gutiérrez', 'Calle 66 #335-670', 'carlos.lopez@ejemplo.com', '3778901234', 'Barranquilla'),
('1678901234', 'Felipe', 'Torres', 'Pérez', 'Carrera 67 #340-680', 'felipe.torres@ejemplo.com', '3789012345', 'Popayán'),
('1689012345', 'María', 'Sánchez', 'González', 'Avenida 68 #345-690', 'maria.sanchez@ejemplo.com', '3790123456', 'Ibagué'),
('1690123456', 'Ricardo', 'Vargas', 'Rodríguez', 'Calle 69 #350-700', 'ricardo.vargas@ejemplo.com', '3801234567', 'Cúcuta'),
('1701234567', 'Gabriela', 'Reyes', 'Fernández', 'Carrera 70 #355-710', 'gabriela.reyes@ejemplo.com', '3812345678', 'Valledupar'),
('1712345678', 'Luis', 'Ramírez', 'Torres', 'Avenida 71 #360-720', 'luis.ramirez@ejemplo.com', '3823456789', 'Cali'),
('1723456789', 'Carolina', 'González', 'Suárez', 'Calle 72 #365-730', 'carolina.gonzalez@ejemplo.com', '3834567890', 'Medellín'),
('1734567890', 'José', 'López', 'Muñoz', 'Carrera 73 #370-740', 'jose.lopez@ejemplo.com', '3845678901', 'Popayán'),
('1745678901', 'Mónica', 'Díaz', 'Pérez', 'Avenida 74 #375-750', 'monica.diaz@ejemplo.com', '3856789012', 'Villavicencio'),
('1756789012', 'Elena', 'Vargas', 'Torres', 'Calle 75 #380-760', 'elena.vargas@ejemplo.com', '3867890123', 'Chía'),
('1767890123', 'Ricardo', 'Reyes', 'Vásquez', 'Carrera 76 #385-770', 'ricardo.reyes@ejemplo.com', '3878901234', 'Barranquilla'),
('1778901234', 'José', 'Moreno', 'López', 'Avenida 77 #390-780', 'jose.moreno@ejemplo.com', '3889012345', 'Cúcuta'),
('1789012345', 'Sara', 'Torres', 'Rodríguez', 'Calle 78 #395-790', 'sara.torres@ejemplo.com', '3890123456', 'Popayán'),
('1790123456', 'David', 'González', 'Mora', 'Carrera 79 #400-800', 'david.gonzalez@ejemplo.com', '3901234567', 'Santa Marta'),
('1801234567', 'Lucía', 'Sánchez', 'Torres', 'Avenida 80 #405-810', 'lucia.sanchez@ejemplo.com', '3912345678', 'Neiva'),
('1812345678', 'Javier', 'López', 'Ramírez', 'Calle 81 #410-820', 'javier.lopez@ejemplo.com', '3923456789', 'Manizales'),
('1823456789', 'Carlos', 'Ramírez', 'Vargas', 'Carrera 82 #415-830', 'carlos.ramirez@ejemplo.com', '3934567890', 'Medellín'),
('1834567890', 'Ana', 'Vargas', 'López', 'Avenida 83 #420-840', 'ana.vargas@ejemplo.com', '3945678901', 'Barranquilla'),
('1845678901', 'Pedro', 'Martínez', 'Suárez', 'Calle 84 #425-850', 'pedro.martinez@ejemplo.com', '3956789012', 'Pereira'),
('1856789012', 'Verónica', 'González', 'Vásquez', 'Carrera 85 #430-860', 'veronica.gonzalez@ejemplo.com', '3967890123', 'Cali'),
('1867890123', 'Felipe', 'Díaz', 'Torres', 'Avenida 86 #435-870', 'felipe.diaz@ejemplo.com', '3978901234', 'Popayán'),
('1878901234', 'Sandra', 'Rodríguez', 'González', 'Calle 87 #440-880', 'sandra.rodriguez@ejemplo.com', '3989012345', 'Cartagena'),
('1889012345', 'José', 'Gómez', 'Martínez', 'Carrera 88 #445-890', 'jose.gomez@ejemplo.com', '3990123456', 'Medellín'),
('1890123456', 'Carlos', 'Ramírez', 'Sánchez', 'Avenida 89 #450-900', 'carlos.ramirez@ejemplo.com', '4001234567', 'Neiva'),
('1901234567', 'Antonio', 'Martínez', 'Mendoza', 'Calle 90 #455-910', 'antonio.martinez@ejemplo.com', '4012345678', 'Ibagué'),
('1912345678', 'Gabriela', 'López', 'González', 'Carrera 91 #460-920', 'gabriela.lopez@ejemplo.com', '4023456789', 'Popayán'),
('1923456789', 'Pedro', 'Sánchez', 'Reyes', 'Avenida 92 #465-930', 'pedro.sanchez@ejemplo.com', '4034567890', 'Cúcuta'),
('1934567890', 'María', 'Torres', 'Moreno', 'Calle 93 #470-940', 'maria.torres@ejemplo.com', '4045678901', 'Pereira'),
('1945678901', 'Ricardo', 'Rodríguez', 'Fernández', 'Carrera 94 #475-950', 'ricardo.rodriguez@ejemplo.com', '4056789012', 'Santa Marta'),
('1956789012', 'Luis', 'Martínez', 'Gómez', 'Avenida 95 #480-960', 'luis.martinez@ejemplo.com', '4067890123', 'Villavicencio'),
('1967890123', 'Carlos', 'González', 'Jiménez', 'Calle 96 #485-970', 'carlos.gonzalez@ejemplo.com', '4078901234', 'Chía'),
('1978901234', 'José', 'Vásquez', 'Hernández', 'Carrera 97 #490-980', 'jose.vasquez@ejemplo.com', '4089012345', 'Valledupar'),
('1989012345', 'David', 'Moreno', 'Vargas', 'Avenida 98 #495-990', 'david.moreno@ejemplo.com', '4090123456', 'Medellín');

INSERT INTO vehiculos (sunroof, capacidad, tipo, placa, referencia, modelo, puertas, color, motor) VALUES
('Sí', '5', 'Sedán', 'ABC123', 'Toyota Corolla', '2020', 4, 'Negro', '1.8L'),
('No', '7', 'SUV', 'DEF456', 'Honda CR-V', '2019', 5, 'Blanco', '2.4L'),
('Sí', '4', 'Coupé', 'GHI789', 'BMW 320i', '2021', 2, 'Rojo', '2.0L'),
('No', '5', 'Sedán', 'JKL012', 'Mazda 6', '2020', 4, 'Azul', '2.5L'),
('Sí', '7', 'SUV', 'MNO345', 'Nissan X-Trail', '2022', 5, 'Gris', '2.5L'),
('No', '4', 'Coupé', 'PQR678', 'Audi A5', '2021', 2, 'Blanco', '2.0L'),
('Sí', '5', 'Sedán', 'STU901', 'Kia Optima', '2019', 4, 'Negro', '2.4L'),
('No', '5', 'Sedán', 'VWX234', 'Chevrolet Malibu', '2020', 4, 'Rojo', '1.5L'),
('Sí', '7', 'SUV', 'YZA567', 'Ford Escape', '2022', 5, 'Azul', '2.5L'),
('No', '4', 'Deportivo', 'BCD890', 'Ford Mustang', '2021', 2, 'Amarillo', '5.0L'),
('Sí', '5', 'Hatchback', 'EFG123', 'Volkswagen Golf', '2020', 4, 'Verde', '1.8L'),
('No', '5', 'SUV', 'HIJ456', 'Hyundai Tucson', '2022', 5, 'Plata', '2.0L'),
('Sí', '7', 'SUV', 'KLM789', 'Toyota Highlander', '2021', 5, 'Blanco', '3.5L'),
('No', '5', 'Sedán', 'NOP012', 'Mercedes-Benz C-Class', '2020', 4, 'Negro', '2.0L'),
('Sí', '5', 'Coupé', 'QRS345', 'Nissan 370Z', '2021', 2, 'Rojo', '3.7L'),
('No', '7', 'SUV', 'TUV678', 'Honda Pilot', '2022', 5, 'Gris', '3.5L'),
('Sí', '5', 'Sedán', 'WXY901', 'Honda Accord', '2019', 4, 'Azul', '2.4L'),
('No', '7', 'SUV', 'ZAB234', 'Chevrolet Traverse', '2020', 5, 'Verde', '3.6L'),
('Sí', '4', 'Sedán', 'CDE567', 'BMW 530i', '2021', 4, 'Negro', '2.0L'),
('No', '5', 'SUV', 'FGH890', 'Jeep Grand Cherokee', '2022', 5, 'Rojo', '3.6L'),
('Sí', '4', 'Deportivo', 'IJK123', 'Porsche 911', '2021', 2, 'Azul', '3.0L'),
('No', '7', 'SUV', 'LMN456', 'Toyota RAV4', '2020', 5, 'Gris', '2.5L'),
('Sí', '5', 'Sedán', 'OPQ789', 'Hyundai Sonata', '2021', 4, 'Blanco', '2.4L'),
('No', '5', 'SUV', 'RST012', 'Mazda CX-5', '2020', 5, 'Negro', '2.5L'),
('Sí', '7', 'SUV', 'UVW345', 'Kia Sorento', '2021', 5, 'Rojo', '3.5L'),
('No', '4', 'Coupé', 'XYZ678', 'Chevrolet Camaro', '2021', 2, 'Amarillo', '6.2L'),
('Sí', '5', 'Hatchback', 'ABC012', 'Ford Focus', '2020', 4, 'Azul', '2.0L'),
('No', '7', 'SUV', 'DEF345', 'Subaru Outback', '2021', 5, 'Plata', '2.5L'),
('Sí', '5', 'Sedán', 'GHI678', 'Toyota Camry', '2022', 4, 'Verde', '2.5L'),
('No', '5', 'SUV', 'JKL901', 'Chevrolet Equinox', '2020', 5, 'Blanco', '1.5L'),
('Sí', '7', 'SUV', 'MNO234', 'Mazda CX-9', '2021', 5, 'Rojo', '2.5L'),
('No', '5', 'Deportivo', 'PQR567', 'Jaguar F-Type', '2020', 2, 'Negro', '3.0L'),
('Sí', '5', 'Sedán', 'STU890', 'Nissan Altima', '2021', 4, 'Azul', '2.5L'),
('No', '7', 'SUV', 'VWX123', 'Ford Bronco', '2022', 5, 'Gris', '2.7L'),
('Sí', '4', 'Deportivo', 'YZA456', 'Chevrolet Corvette', '2021', 2, 'Rojo', '6.2L'),
('No', '5', 'Coupé', 'BCD789', 'BMW M4', '2020', 2, 'Amarillo', '3.0L'),
('Sí', '7', 'SUV', 'EFG012', 'Audi Q5', '2021', 5, 'Plata', '2.0L'),
('No', '5', 'SUV', 'HIJ345', 'Nissan Pathfinder', '2020', 5, 'Negro', '3.5L'),
('Sí', '5', 'Sedán', 'KLM678', 'Honda Civic', '2022', 4, 'Blanco', '2.0L'),
('No', '4', 'Coupé', 'NOP901', 'Mercedes-Benz CLA', '2021', 2, 'Azul', '2.0L'),
('Sí', '5', 'Sedán', 'QRS234', 'Ford Fusion', '2020', 4, 'Rojo', '2.5L'),
('No', '7', 'SUV', 'TUV567', 'Hyundai Santa Fe', '2021', 5, 'Gris', '2.4L'),
('Sí', '4', 'Coupé', 'XYZ012', 'Lexus RC', '2021', 2, 'Verde', '3.5L'),
('No', '5', 'SUV', 'ABC345', 'Chevrolet Tahoe', '2020', 5, 'Negro', '5.3L'),
('Sí', '5', 'Hatchback', 'DEF678', 'Volkswagen Polo', '2021', 4, 'Rojo', '1.6L'),
('No', '5', 'SUV', 'GHI901', 'Toyota 4Runner', '2022', 5, 'Plata', '4.0L'),
('Sí', '7', 'SUV', 'JKL234', 'Honda CR-V', '2020', 5, 'Azul', '2.4L'),
('No', '4', 'Sedán', 'MNO567', 'BMW 7 Series', '2021', 4, 'Blanco', '3.0L'),
('Sí', '5', 'Sedán', 'PQR890', 'Audi A4', '2020', 4, 'Negro', '2.0L'),
('No', '7', 'SUV', 'STU123', 'Kia Telluride', '2021', 5, 'Rojo', '3.8L'),
('Sí', '5', 'Deportivo', 'VWX456', 'Porsche 718 Cayman', '2020', 2, 'Amarillo', '2.5L'),
('No', '7', 'SUV', 'YZA789', 'Mazda CX-30', '2022', 5, 'Verde', '2.0L'),
('Sí', '5', 'Coupé', 'BCD012', 'Chevrolet Camaro', '2021', 2, 'Rojo', '6.2L'),
('No', '4', 'Deportivo', 'EFG345', 'Ferrari 488', '2021', 2, 'Azul', '3.9L'),
('Sí', '7', 'SUV', 'HIJ678', 'Subaru Forester', '2022', 5, 'Gris', '2.5L'),
('No', '5', 'Coupé', 'KLM901', 'Audi S5', '2020', 2, 'Negro', '3.0L'),
('Sí', '4', 'Sedán', 'NOP234', 'Mercedes-Benz E-Class', '2021', 4, 'Blanco', '2.5L'),
('No', '5', 'SUV', 'QRS567', 'Jeep Cherokee', '2022', 5, 'Plata', '3.2L'),
('Sí', '5', 'Deportivo', 'TUV890', 'Nissan GT-R', '2020', 2, 'Rojo', '3.8L'),
('No', '7', 'SUV', 'WXY123', 'Toyota Tacoma', '2021', 5, 'Verde', '3.5L'),
('Sí', '4', 'Sedán', 'ZAB456', 'Honda Insight', '2022', 4, 'Azul', '1.5L'),
('No', '5', 'SUV', 'CDE789', 'Ford Explorer', '2020', 5, 'Negro', '2.3L'),
('Sí', '5', 'Sedán', 'FGH012', 'Chevrolet Malibu', '2021', 4, 'Rojo', '2.0L'),
('No', '4', 'Deportivo', 'IJK345', 'Lamborghini Huracán', '2022', 2, 'Amarillo', '5.2L'),
('Sí', '7', 'SUV', 'LMN678', 'Hyundai Kona', '2021', 5, 'Gris', '2.0L'),
('No', '5', 'SUV', 'OPQ901', 'Mazda CX-3', '2020', 5, 'Blanco', '2.0L'),
('Sí', '5', 'Coupé', 'RST234', 'Audi TT', '2021', 2, 'Rojo', '2.0L'),
('No', '4', 'Deportivo', 'UVW567', 'Chevrolet Corvette', '2021', 2, 'Verde', '6.2L'),
('Sí', '7', 'SUV', 'XYZ890', 'Toyota Land Cruiser', '2022', 5, 'Negro', '5.7L'),
('No', '5', 'SUV', 'ABC123', 'X1000', '2022', 4, 'Rojo', 'V8'),
('No', '4', 'Sedan', 'XYZ234', 'X2000', '2021', 4, 'Azul', 'V6'),
('Si', '7', 'Pickup', 'LMN345', 'P4000', '2023', 2, 'Verde', 'V8'),
('No', '5', 'Hatchback', 'QRS456', 'H5000', '2020', 4, 'Negro', 'V6'),
('Si', '6', 'Convertible', 'TUV567', 'C6000', '2022', 2, 'Blanco', 'V6'),
('No', '4', 'Sedan', 'JKL678', 'S7000', '2021', 4, 'Gris', 'V8'),
('Si', '5', 'SUV', 'WXY789', 'X8000', '2023', 4, 'Amarillo', 'V8'),
('No', '6', 'Pickup', 'RST890', 'P9000', '2020', 2, 'Rojo', 'V6'),
('Si', '7', 'Hatchback', 'UVW901', 'H1000', '2022', 4, 'Azul', 'V6'),
('No', '5', 'Convertible', 'ZAB012', 'C2000', '2021', 2, 'Negro', 'V8'),
('Si', '6', 'Sedan', 'CDE123', 'S3000', '2020', 4, 'Verde', 'V8'),
('No', '4', 'SUV', 'FGH234', 'X4000', '2023', 4, 'Blanco', 'V6'),
('Si', '7', 'Pickup', 'IJK345', 'P5000', '2021', 2, 'Gris', 'V8'),
('No', '5', 'Hatchback', 'LMN456', 'H6000', '2022', 4, 'Rojo', 'V8'),
('Si', '6', 'Convertible', 'OPQ567', 'C7000', '2020', 2, 'Azul', 'V6'),
('No', '4', 'Sedan', 'RST678', 'S8000', '2023', 4, 'Negro', 'V6'),
('Si', '5', 'SUV', 'UVW789', 'X9000', '2021', 4, 'Gris', 'V6'),
('No', '6', 'Pickup', 'XYZ890', 'P1000', '2022', 2, 'Amarillo', 'V6'),
('Si', '7', 'Hatchback', 'ABC901', 'H2000', '2020', 4, 'Blanco', 'V8'),
('No', '4', 'Convertible', 'DEF012', 'C3000', '2023', 2, 'Rojo', 'V6'),
('Si', '5', 'Sedan', 'GHI123', 'S4000', '2021', 4, 'Verde', 'V8'),
('No', '6', 'SUV', 'JKL234', 'X5000', '2022', 4, 'Azul', 'V6'),
('Si', '7', 'Pickup', 'MNO345', 'P6000', '2023', 2, 'Gris', 'V8'),
('No', '5', 'Hatchback', 'PQR456', 'H7000', '2020', 4, 'Negro', 'V6'),
('Si', '6', 'Convertible', 'STU567', 'C8000', '2021', 2, 'Blanco', 'V8'),
('No', '4', 'Sedan', 'VWX678', 'S9000', '2023', 4, 'Rojo', 'V8'),
('Si', '5', 'SUV', 'YZA789', 'X1000', '2020', 4, 'Verde', 'V6'),
('No', '6', 'Pickup', 'BCD890', 'P2000', '2022', 2, 'Amarillo', 'V8'),
('Si', '7', 'Hatchback', 'EFG901', 'H3000', '2021', 4, 'Blanco', 'V6'),
('No', '5', 'Convertible', 'HIJ012', 'C4000', '2023', 2, 'Negro', 'V6'),
('Si', '6', 'Sedan', 'KLM123', 'S5000', '2022', 4, 'Azul', 'V8');


INSERT INTO descuento (id_vehiculo, porcentaje_descuento, inicio_descuento, fin_descuento) VALUES
(1, 10.00, '2024-01-01', '2024-01-31'),
(2, 15.00, '2024-02-01', '2024-02-28'),
(3, 5.00, '2024-03-01', '2024-03-31'),
(4, 12.50, '2024-04-01', '2024-04-30'),
(5, 8.00, '2024-05-01', '2024-05-15'),
(6, 20.00, '2024-06-01', '2024-06-30'),
(7, 18.00, '2024-07-01', '2024-07-15'),
(8, 9.50, '2024-08-01', '2024-08-31'),
(9, 14.00, '2024-09-01', '2024-09-30'),
(10, 7.50, '2024-10-01', '2024-10-15'),
(11, 16.00, '2024-11-01', '2024-11-30'),
(12, 22.00, '2024-12-01', '2024-12-31'),
(13, 11.00, '2024-01-15', '2024-01-31'),
(14, 25.00, '2024-02-01', '2024-02-15'),
(15, 13.00, '2024-03-01', '2024-03-15'),
(16, 6.50, '2024-04-01', '2024-04-15'),
(17, 17.00, '2024-05-01', '2024-05-31'),
(18, 10.50, '2024-06-01', '2024-06-15'),
(19, 5.50, '2024-07-01', '2024-07-31'),
(20, 8.50, '2024-08-01', '2024-08-15'),
(21, 19.00, '2024-09-01', '2024-09-15'),
(22, 14.50, '2024-10-01', '2024-10-31'),
(23, 12.00, '2024-11-01', '2024-11-15'),
(24, 18.50, '2024-12-01', '2024-12-15'),
(25, 13.50, '2024-01-01', '2024-01-31'),
(26, 9.00, '2024-02-01', '2024-02-28'),
(27, 7.00, '2024-03-01', '2024-03-31'),
(28, 16.50, '2024-04-01', '2024-04-15'),
(29, 12.00, '2024-05-01', '2024-05-31'),
(30, 17.50, '2024-06-01', '2024-06-15'),
(31, 5.00, '2024-07-01', '2024-07-31'),
(32, 11.50, '2024-08-01', '2024-08-15'),
(33, 14.00, '2024-09-01', '2024-09-30'),
(34, 15.50, '2024-10-01', '2024-10-15'),
(35, 9.50, '2024-11-01', '2024-11-30'),
(36, 10.00, '2024-12-01', '2024-12-15'),
(37, 21.00, '2024-01-01', '2024-01-31'),
(38, 13.00, '2024-02-01', '2024-02-15'),
(39, 22.50, '2024-03-01', '2024-03-15'),
(40, 6.50, '2024-04-01', '2024-04-30'),
(41, 8.00, '2024-05-01', '2024-05-31'),
(42, 19.00, '2024-06-01', '2024-06-15'),
(43, 14.50, '2024-07-01', '2024-07-15'),
(44, 17.00, '2024-08-01', '2024-08-31'),
(45, 5.00, '2024-09-01', '2024-09-30'),
(46, 18.00, '2024-10-01', '2024-10-15'),
(47, 10.50, '2024-11-01', '2024-11-15'),
(48, 6.00, '2024-12-01', '2024-12-15'),
(49, 15.00, '2024-01-01', '2024-01-31'),
(50, 13.50, '2024-02-01', '2024-02-28'),
(51, 17.50, '2024-03-01', '2024-03-15'),
(52, 6.00, '2024-04-01', '2024-04-30'),
(53, 10.00, '2024-05-01', '2024-05-31'),
(54, 9.50, '2024-06-01', '2024-06-15'),
(55, 14.00, '2024-07-01', '2024-07-15'),
(56, 8.50, '2024-08-01', '2024-08-31'),
(57, 11.00, '2024-09-01', '2024-09-30'),
(58, 5.00, '2024-10-01', '2024-10-15'),
(59, 12.50, '2024-11-01', '2024-11-30'),
(60, 14.00, '2024-12-01', '2024-12-15'),
(61, 20.00, '2024-01-01', '2024-01-31'),
(62, 8.00, '2024-02-01', '2024-02-15'),
(63, 10.00, '2024-03-01', '2024-03-15'),
(64, 7.50, '2024-04-01', '2024-04-30'),
(65, 13.00, '2024-05-01', '2024-05-31'),
(66, 11.50, '2024-06-01', '2024-06-15'),
(67, 14.50, '2024-07-01', '2024-07-15'),
(68, 9.00, '2024-08-01', '2024-08-31'),
(69, 15.00, '2024-09-01', '2024-09-30'),
(70, 10.50, '2024-10-01', '2024-10-31'),
(71, 12.00, '2024-11-01', '2024-11-30'),
(72, 5.00, '2024-12-01', '2024-12-15'),
(73, 9.00, '2024-01-01', '2024-01-31'),
(74, 16.00, '2024-02-01', '2024-02-28'),
(75, 12.50, '2024-03-01', '2024-03-31'),
(76, 7.00, '2024-04-01', '2024-04-30'),
(77, 13.50, '2024-05-01', '2024-05-15'),
(78, 11.00, '2024-06-01', '2024-06-30'),
(79, 17.00, '2024-07-01', '2024-07-31'),
(80, 8.50, '2024-08-01', '2024-08-31'),
(81, 10.00, '2024-09-01', '2024-09-30'),
(82, 18.50, '2024-10-01', '2024-10-15'),
(83, 5.50, '2024-11-01', '2024-11-30'),
(84, 6.50, '2024-12-01', '2024-12-15'),
(85, 7.50, '2024-01-01', '2024-01-31'),
(86, 8.00, '2024-02-01', '2024-02-28'),
(87, 10.50, '2024-03-01', '2024-03-31'),
(88, 9.00, '2024-04-01', '2024-04-30'),
(89, 16.00, '2024-05-01', '2024-05-15'),
(90, 14.00, '2024-06-01', '2024-06-30'),
(91, 12.50, '2024-07-01', '2024-07-31'),
(92, 18.00, '2024-08-01', '2024-08-15'),
(93, 6.50, '2024-09-01', '2024-09-30'),
(94, 10.00, '2024-10-01', '2024-10-31'),
(95, 15.50, '2024-11-01', '2024-11-15'),
(96, 9.00, '2024-12-01', '2024-12-15'),
(97, 20.00, '2024-01-01', '2024-01-31'),
(98, 7.50, '2024-02-01', '2024-02-28'),
(99, 13.50, '2024-03-01', '2024-03-15'),
(100, 18.00, '2024-04-01', '2024-04-30');

INSERT INTO alquileres (fecha_salida, id_cliente, id_empleado, id_vehiculo, id_sucursal, fecha_llegada, 
fecha_esperada_llegada, valor_alquiler_dia, valor_alquiler_semana, valor_cotizado, valor_pagado, id_descuento) VALUES
('2024-01-01', 1, 1, 5, 2, '2024-01-07', '2024-01-01', 50.00, 300.00, 350.00, 340.00, 1),
('2024-01-03', 2, 2, 6, 3, '2024-01-10', '2024-01-03', 60.00, 350.00, 400.00, 390.00, 2),
('2024-01-05', 3, 3, 7, 4, '2024-01-12', '2024-01-05', 45.00, 280.00, 320.00, 310.00, 3),
('2024-01-10', 4, 4, 8, 5, '2024-01-17', '2024-01-10', 75.00, 450.00, 500.00, 490.00, 4),
('2024-01-12', 5, 5, 9, 6, '2024-01-19', '2024-01-12', 55.00, 330.00, 375.00, 365.00, 5),
('2024-01-15', 6, 6, 10, 7, '2024-01-22', '2024-01-15', 65.00, 390.00, 440.00, 430.00, 6),
('2024-01-18', 7, 7, 11, 8, '2024-01-25', '2024-01-18', 85.00, 510.00, 560.00, 550.00, 7),
('2024-01-20', 8, 8, 12, 9, '2024-01-27', '2024-01-20', 90.00, 540.00, 600.00, 590.00, 8),
('2024-01-22', 9, 9, 13, 10, '2024-01-29', '2024-01-22', 70.00, 420.00, 470.00, 460.00, 9),
('2024-01-25', 10, 10, 14, 11, '2024-02-01', '2024-01-25', 40.00, 240.00, 280.00, 270.00, 10),
('2024-01-27', 11, 11, 15, 12, '2024-02-03', '2024-01-27', 60.00, 360.00, 400.00, 390.00, 11),
('2024-01-30', 12, 12, 16, 13, '2024-02-06', '2024-01-30', 50.00, 300.00, 350.00, 340.00, 12),
('2024-02-02', 13, 13, 17, 14, '2024-02-09', '2024-02-02', 45.00, 270.00, 310.00, 300.00, 13),
('2024-02-04', 14, 14, 18, 15, '2024-02-11', '2024-02-04', 65.00, 390.00, 440.00, 430.00, 14),
('2024-02-06', 15, 15, 19, 16, '2024-02-13', '2024-02-06', 70.00, 420.00, 470.00, 460.00, 15),
('2024-02-08', 16, 16, 20, 17, '2024-02-15', '2024-02-08', 80.00, 480.00, 530.00, 520.00, 16),
('2024-02-10', 17, 17, 21, 18, '2024-02-17', '2024-02-10', 75.00, 450.00, 500.00, 490.00, 17),
('2024-02-12', 18, 18, 22, 19, '2024-02-19', '2024-02-12', 50.00, 300.00, 350.00, 340.00, 18),
('2024-02-14', 19, 19, 23, 20, '2024-02-21', '2024-02-14', 55.00, 330.00, 375.00, 365.00, 19),
('2024-02-16', 20, 20, 24, 21, '2024-02-23', '2024-02-16', 40.00, 240.00, 280.00, 270.00, 20),
('2024-02-18', 21, 21, 25, 22, '2024-02-25', '2024-02-18', 60.00, 360.00, 400.00, 390.00, 21),
('2024-02-20', 22, 22, 26, 23, '2024-02-27', '2024-02-20', 65.00, 390.00, 440.00, 430.00, 22),
('2024-02-22', 23, 23, 27, 24, '2024-03-01', '2024-02-22', 85.00, 510.00, 560.00, 550.00, 23),
('2024-02-24', 24, 24, 28, 25, '2024-03-03', '2024-02-24', 90.00, 540.00, 600.00, 590.00, 24),
('2024-02-26', 25, 25, 29, 26, '2024-03-05', '2024-02-26', 50.00, 300.00, 350.00, 340.00, 25),
('2024-02-28', 26, 26, 30, 27, '2024-03-07', '2024-02-28', 55.00, 330.00, 375.00, 365.00, 26),
('2024-03-02', 27, 27, 31, 28, '2024-03-09', '2024-03-02', 75.00, 450.00, 500.00, 490.00, 27),
('2024-03-04', 28, 28, 32, 29, '2024-03-11', '2024-03-04', 65.00, 390.00, 440.00, 430.00, 28),
('2024-03-06', 29, 29, 33, 30, '2024-03-13', '2024-03-06', 70.00, 420.00, 470.00, 460.00, 29),
('2024-03-08', 30, 30, 34, 31, '2024-03-15', '2024-03-08', 80.00, 480.00, 530.00, 520.00, 30),
('2024-03-10', 31, 31, 35, 32, '2024-03-17', '2024-03-10', 90.00, 540.00, 600.00, 590.00, 31),
('2024-03-12', 32, 32, 36, 33, '2024-03-19', '2024-03-12', 55.00, 330.00, 375.00, 365.00, 32),
('2024-03-14', 33, 33, 37, 34, '2024-03-21', '2024-03-14', 45.00, 270.00, 310.00, 300.00, 33),
('2024-03-16', 34, 34, 38, 35, '2024-03-23', '2024-03-16', 50.00, 300.00, 350.00, 340.00, 34),
('2024-03-18', 35, 35, 39, 36, '2024-03-25', '2024-03-18', 65.00, 390.00, 440.00, 430.00, 35),
('2024-03-20', 36, 36, 40, 37, '2024-03-27', '2024-03-20', 55.00, 330.00, 375.00, 365.00, 36),
('2024-03-22', 37, 37, 41, 38, '2024-03-29', '2024-03-22', 70.00, 420.00, 470.00, 460.00, 37),
('2024-02-12', 18, 18, 22, 19, '2024-02-19', '2024-02-12', 50.00, 300.00, 350.00, 340.00, 38),
('2024-02-14', 19, 19, 23, 20, '2024-02-21', '2024-02-14', 55.00, 330.00, 375.00, 365.00, 39),
('2024-02-16', 20, 20, 24, 21, '2024-02-23', '2024-02-16', 40.00, 240.00, 280.00, 270.00, 40),
('2024-02-18', 21, 21, 25, 22, '2024-02-25', '2024-02-18', 60.00, 360.00, 400.00, 390.00, 41),
('2024-02-20', 22, 22, 26, 23, '2024-02-27', '2024-02-20', 65.00, 390.00, 440.00, 430.00, 42),
('2024-02-22', 23, 23, 27, 24, '2024-03-01', '2024-02-22', 85.00, 510.00, 560.00, 550.00, 43),
('2024-02-24', 24, 24, 28, 25, '2024-03-03', '2024-02-24', 90.00, 540.00, 600.00, 590.00, 44),
('2024-02-26', 25, 25, 29, 26, '2024-03-05', '2024-02-26', 50.00, 300.00, 350.00, 340.00, 45),
('2024-02-28', 26, 26, 30, 27, '2024-03-07', '2024-02-28', 55.00, 330.00, 375.00, 365.00, 46),
('2024-03-02', 27, 27, 31, 28, '2024-03-09', '2024-03-02', 75.00, 450.00, 500.00, 490.00, 47),
('2024-03-04', 28, 28, 32, 29, '2024-03-11', '2024-03-04', 65.00, 390.00, 440.00, 430.00, 48),
('2024-03-06', 29, 29, 33, 30, '2024-03-13', '2024-03-06', 70.00, 420.00, 470.00, 460.00, 49),
('2024-03-08', 30, 30, 34, 31, '2024-03-15', '2024-03-08', 80.00, 480.00, 530.00, 520.00, 50),
('2024-03-10', 31, 31, 35, 32, '2024-03-17', '2024-03-10', 90.00, 540.00, 600.00, 590.00, 51),
('2024-03-12', 32, 32, 36, 33, '2024-03-19', '2024-03-12', 55.00, 330.00, 375.00, 365.00, 52),
('2024-03-14', 33, 33, 37, 34, '2024-03-21', '2024-03-14', 45.00, 270.00, 310.00, 300.00, 53),
('2024-03-16', 34, 34, 38, 35, '2024-03-23', '2024-03-16', 50.00, 300.00, 350.00, 340.00, 54),
('2024-03-18', 35, 35, 39, 36, '2024-03-25', '2024-03-18', 65.00, 390.00, 440.00, 430.00, 55),
('2024-03-20', 36, 36, 40, 37, '2024-03-27', '2024-03-20', 55.00, 330.00, 375.00, 365.00, 56),
('2024-03-22', 37, 37, 41, 38, '2024-03-29', '2024-03-22', 70.00, 420.00, 470.00, 460.00, 57),
('2024-02-12', 18, 18, 22, 19, '2024-02-19', '2024-02-12', 50.00, 300.00, 350.00, 340.00, 58),
('2024-02-14', 19, 19, 23, 20, '2024-02-21', '2024-02-14', 55.00, 330.00, 375.00, 365.00, 59),
('2024-02-16', 20, 20, 24, 21, '2024-02-23', '2024-02-16', 40.00, 240.00, 280.00, 270.00, 60),
('2024-02-18', 21, 21, 25, 22, '2024-02-25', '2024-02-18', 60.00, 360.00, 400.00, 390.00, 61),
('2024-02-20', 22, 22, 26, 23, '2024-02-27', '2024-02-20', 65.00, 390.00, 440.00, 430.00, 62),
('2024-02-22', 23, 23, 27, 24, '2024-03-01', '2024-02-22', 85.00, 510.00, 560.00, 550.00, 63),
('2024-02-24', 24, 24, 28, 25, '2024-03-03', '2024-02-24', 90.00, 540.00, 600.00, 590.00, 64),
('2024-02-26', 25, 25, 29, 26, '2024-03-05', '2024-02-26', 50.00, 300.00, 350.00, 340.00, 65),
('2024-02-28', 26, 26, 30, 27, '2024-03-07', '2024-02-28', 55.00, 330.00, 375.00, 365.00, 66),
('2024-03-02', 27, 27, 31, 28, '2024-03-09', '2024-03-02', 75.00, 450.00, 500.00, 490.00, 67),
('2024-03-04', 28, 28, 32, 29, '2024-03-11', '2024-03-04', 65.00, 390.00, 440.00, 430.00, 68),
('2024-03-06', 29, 29, 33, 30, '2024-03-13', '2024-03-06', 70.00, 420.00, 470.00, 460.00, 69),
('2024-03-08', 30, 30, 34, 31, '2024-03-15', '2024-03-08', 80.00, 480.00, 530.00, 520.00, 70),
('2024-03-10', 31, 31, 35, 32, '2024-03-17', '2024-03-10', 90.00, 540.00, 600.00, 590.00, 71),
('2024-03-12', 32, 32, 36, 33, '2024-03-19', '2024-03-12', 55.00, 330.00, 375.00, 365.00, 72),
('2024-03-14', 33, 33, 37, 34, '2024-03-21', '2024-03-14', 45.00, 270.00, 310.00, 300.00, 73),
('2024-03-16', 34, 34, 38, 35, '2024-03-23', '2024-03-16', 50.00, 300.00, 350.00, 340.00, 74),
('2024-03-18', 35, 35, 39, 36, '2024-03-25', '2024-03-18', 65.00, 390.00, 440.00, 430.00, 75),
('2024-03-20', 36, 36, 40, 37, '2024-03-27', '2024-03-20', 55.00, 330.00, 375.00, 365.00, 76),
('2024-03-22', 37, 37, 41, 38, '2024-03-29', '2024-03-22', 70.00, 420.00, 470.00, 460.00, 77),
('2024-02-12', 18, 18, 22, 19, '2024-02-19', '2024-02-12', 50.00, 300.00, 350.00, 340.00, 78),
('2024-02-14', 19, 19, 23, 20, '2024-02-21', '2024-02-14', 55.00, 330.00, 375.00, 365.00, 79),
('2024-02-16', 20, 20, 24, 21, '2024-02-23', '2024-02-16', 40.00, 240.00, 280.00, 270.00, 80),
('2024-02-18', 21, 21, 25, 22, '2024-02-25', '2024-02-18', 60.00, 360.00, 400.00, 390.00, 81),
('2024-02-20', 22, 22, 26, 23, '2024-02-27', '2024-02-20', 65.00, 390.00, 440.00, 430.00, 82),
('2024-02-22', 23, 23, 27, 24, '2024-03-01', '2024-02-22', 85.00, 510.00, 560.00, 550.00, 83),
('2024-02-24', 24, 24, 28, 25, '2024-03-03', '2024-02-24', 90.00, 540.00, 600.00, 590.00, 84),
('2024-02-26', 25, 25, 29, 26, '2024-03-05', '2024-02-26', 50.00, 300.00, 350.00, 340.00, 85),
('2024-02-28', 26, 26, 30, 27, '2024-03-07', '2024-02-28', 55.00, 330.00, 375.00, 365.00, 86),
('2024-04-02', 27, 27, 31, 28, '2024-03-09', '2024-03-02', 75.00, 450.00, 500.00, 490.00, 87),
('2024-04-04', 28, 28, 32, 29, '2024-03-11', '2024-03-04', 65.00, 390.00, 440.00, 430.00, 88),
('2024-04-06', 29, 29, 33, 30, '2024-03-13', '2024-03-06', 70.00, 420.00, 470.00, 460.00, 89),
('2024-04-08', 30, 30, 34, 31, '2024-03-15', '2024-03-08', 80.00, 480.00, 530.00, 520.00, 90),
('2024-04-10', 31, 31, 35, 32, '2024-03-17', '2024-03-10', 90.00, 540.00, 600.00, 590.00, 91),
('2024-04-12', 32, 32, 36, 33, '2024-03-19', '2024-03-12', 55.00, 330.00, 375.00, 365.00, 92),
('2024-04-14', 33, 33, 37, 34, '2024-03-21', '2024-03-14', 45.00, 270.00, 310.00, 300.00, 93),
('2024-04-16', 34, 34, 38, 35, '2024-03-23', '2024-03-16', 50.00, 300.00, 350.00, 340.00, 94),
('2024-04-18', 35, 35, 39, 36, '2024-03-25', '2024-03-18', 65.00, 390.00, 440.00, 430.00, 95),
('2024-04-20', 36, 36, 40, 37, '2024-03-27', '2024-03-20', 55.00, 330.00, 375.00, 365.00, 96),
('2024-04-22', 37, 37, 41, 38, '2024-03-29', '2024-03-22', 70.00, 420.00, 470.00, 460.00, 97),
('2024-04-04', 28, 28, 32, 29, '2024-03-11', '2024-03-04', 65.00, 390.00, 440.00, 430.00, 98),
('2024-04-06', 29, 29, 33, 30, '2024-03-13', '2024-03-06', 70.00, 420.00, 470.00, 460.00, 99),
('2024-04-08', 30, 30, 34, 31, '2024-03-15', '2024-03-08', 80.00, 480.00, 530.00, 520.00, 100);

-- select * from sucursales;
-- select * from clientes;
-- select * from empleados;
-- select * from descuento;
-- select * from vehiculos;
-- select * from sucursales;


-- 1. muestre los clientes con sus respectivos alquileres.
select a.id_alquiler, c.nombre from alquileres a inner join clientes c on a.id_cliente= c.id_cliente order by 1; 

-- 2. muestre los clientes con sus respectivos alquileres y el empleado que lo atendio.

select a.id_alquiler, c.nombre as nombre_cliente, e.nombre as nombre_empleado from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente  order by 1; 

-- 4.  muestre los clientes con sus respectivos alquileres y el empleado que lo atendio ademas del vehiculo que alquilo.
select a.id_alquiler, c.nombre as nombre_cliente, e.nombre as nombre_empleado, v.tipo as tipo_Vehiculo from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente 
inner join vehiculos v on v.id_vehiculo=a.id_cliente order by 1; 

-- 5. -- 4.  muestre los clientes con sus respectivos alquileres y el empleado que lo atendio ademas del vehiculo que alquilo teniendo en cuenta que el vehiculo sea de color negro y tenga cuatro puertas.
select a.id_alquiler, c.nombre as nombre_cliente, e.nombre as nombre_empleado, v.tipo as tipo_Vehiculo from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente 
inner join vehiculos v on v.id_vehiculo=a.id_cliente where v.color='negro' and v.puertas=4 order by 1; 

-- 6. muestre todas las sucursales de las ciudades Bogota, cucuta con sus clientes y el empleado que atendio a ese cliente ademas de que tipo de vehiculo alquilaron los clientes
select s.id_sucursal, s.ciudad, a.id_alquiler, c.nombre as nombre_cliente,c.apellido1, e.nombre as nombre_empleado, v.tipo as tipo_Vehiculo from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente 
inner join vehiculos v on v.id_vehiculo=a.id_cliente 
inner join sucursales s on s.id_sucursal = a.id_sucursal
where s.ciudad= 'Bogota' or s.ciudad='cucuta'; 

-- 7. muestre los vehiculos que tengan un descuento mayor a 20% y que ese descuento dure mas de dos meses activo
select * from vehiculos v inner join descuento d on v.id_vehiculo=d.id_vehiculo where d.porcentaje_descuento>20 and month(d.fin_descuento)>2;

-- 8. muestre los clientes con sus respectivos alquileres y el empleado que lo atendio ademas del vehiculo que alquilo y el descuento con el que dispone.
select a.id_alquiler,d.porcentaje_descuento, c.nombre as nombre_cliente, e.nombre as nombre_empleado, v.tipo as tipo_Vehiculo from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente 
inner join vehiculos v on v.id_vehiculo=a.id_cliente 
inner join descuento d on d.id_descuento= v.id_vehiculo
 order by 1; 
 
 
 -- 9. muestreme el nombre del cliente que tiene un descuento ademas de mostrar el valor_cotizado con el descuento ya aplicado

 delimiter //
create function Descuento_aplicado(porcentaje_descuento decimal(10,2), valor_cotizado decimal(10,2))
returns decimal(10,2)
deterministic
begin
	return valor_cotizado*(porcentaje_descuento/ 100);
end // 
delimiter ;

select distinct c.nombre,Descuento_aplicado(d.porcentaje_descuento, a.valor_cotizado ) as Descuento_aplicado from descuento d inner join alquileres a on a.id_vehiculo=d.id_vehiculo inner join clientes c on c.id_cliente=a.id_cliente ;
select * from alquileres;
select * from descuento;

-- 10. calcular y mostrar la direfencia del valor cotizado y el valor pagado mostrar el valor cotizado y el valor pagado 
 delimiter //
create function diferencia_valor_cotizado_pagado(valor_cotizado decimal(10,2), valor_pagado decimal(10,2))
returns decimal(10,2)
deterministic
begin
	return valor_cotizado-valor_pagado;
end // 
delimiter ;
select valor_pagado, valor_cotizado, diferencia_valor_cotizado_pagado(valor_cotizado,valor_pagado) from alquileres;


-- 11.mostrar el nombre del cliente junto con la direfencia del valor cotizado y el valor pagado ademas mostrar el valor cotizado y el valor pagado 

select distinct c.nombre,a.valor_pagado, a.valor_cotizado, diferencia_valor_cotizado_pagado(a.valor_cotizado,a.valor_pagado) from descuento d inner join alquileres a on a.id_vehiculo=d.id_vehiculo inner join clientes c on c.id_cliente=a.id_cliente ;

-- 12. mostrar la cantidad de dias que pasaron desde el dia que alquilaron un vehiculo hasta el dia que lo entregaron 

select * from alquileres;
 delimiter //
create function Dias_alquiler_vehiculo(fecha_salida date, fecha_llegada date)
returns int
deterministic
begin
	declare total int;
    set total= timestampdiff(day,fecha_salida,fecha_llegada);
	return total;
end // 
delimiter ;
-- drop function Dias_alquiler_vehiculo;
select a.id_alquiler,c.nombre, Dias_alquiler_vehiculo(a.fecha_salida ,a.fecha_llegada) as dias_en_alquiler from alquileres a inner join clientes c on c.id_cliente= a.id_cliente;

-- 13.muestre los vehiculos que tengan un descuento mayor a 20% y que ese descuento dure mas de 10 dias activo
select * from vehiculos v inner join descuento d on v.id_vehiculo=d.id_vehiculo where d.porcentaje_descuento>20 and day(d.fin_descuento)>10;

-- 14. muestreme los vehiculos que tenga un sunroof

select * from vehiculos where sunroof = 'no';

-- 15. muestrame los datos de los tres vehiculos que tengan el descuento mas alto

select * from vehiculos v inner join descuento d on d.id_vehiculo=v.id_vehiculo order by d.porcentaje_descuento desc limit 3;

-- 15. muestrame los datos de los tres vehiculos que tengan el descuento mas bajo

select * from vehiculos v inner join descuento d on d.id_vehiculo=v.id_vehiculo order by d.porcentaje_descuento asc limit 3;

-- 16 muestre los clientes con sus respectivos alquileres y el empleado que lo atendio ademas del vehiculo que alquilo y el descuento con el que dispone ordenados alfaveticamente por el nombre del cliente.
select a.id_alquiler,d.porcentaje_descuento, c.nombre as nombre_cliente, e.nombre as nombre_empleado, v.tipo as tipo_Vehiculo from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente 
inner join vehiculos v on v.id_vehiculo=a.id_cliente 
inner join descuento d on d.id_descuento= v.id_vehiculo
 order by 3 asc; 
 
 -- 17.  muestre todas las sucursales de las ciudades Bogota, cucuta con la cantidad de clientes y el empleado que atendio a ese cliente ademas de que tipo de vehiculo alquilaron los clientes
select s.id_sucursal, s.ciudad, a.id_alquiler, count(c.nombre) as cantidad_cliente, e.nombre as nombre_empleado, v.tipo as tipo_Vehiculo from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente 
inner join vehiculos v on v.id_vehiculo=a.id_cliente 
inner join sucursales s on s.id_sucursal = a.id_sucursal
where s.ciudad= 'Bogota' or s.ciudad='cucuta' group by 3; 

-- 18.  muestre todas las sucursales con la cantidad de clientes y el empleado que atendio a ese cliente ademas de que tipo de vehiculo alquilaron los clientes ordenados de mayor a menor por el alquiler
select s.id_sucursal, s.ciudad, a.id_alquiler, count(c.nombre) as cantidad_cliente, e.nombre as nombre_empleado, v.tipo as tipo_Vehiculo from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente 
inner join vehiculos v on v.id_vehiculo=a.id_cliente 
inner join sucursales s on s.id_sucursal = a.id_sucursal
group by 3 order by 3 desc; 

-- 19. muestre los clientes con sus respectivos alquileres y el empleado que lo atendio ademas del vehiculo que alquilo y el descuento con el que dispone ordenados de mayor a menor por el alquiler.
select a.id_alquiler,d.porcentaje_descuento, c.nombre as nombre_cliente, e.nombre as nombre_empleado, v.tipo as tipo_Vehiculo from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente 
inner join vehiculos v on v.id_vehiculo=a.id_cliente 
inner join descuento d on d.id_descuento= v.id_vehiculo
 order by 1 desc; 
 
 -- 20. muestre los clientes con sus respectivos alquileres y el empleado que lo atendio ademas del vehiculo que alquilo teniendo en cuenta que el vehiculo sea de color rojo y tenga cuatro o cinco puertas.
select a.id_alquiler, c.nombre as nombre_cliente, e.nombre as nombre_empleado, v.tipo as tipo_Vehiculo, v.puertas from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente 
inner join vehiculos v on v.id_vehiculo=a.id_cliente where v.color='rojo' and v.puertas=4 or v.puertas=5 order by 1; 
 
-- 21. muestre los clientes con sus respectivos alquileres y el empleado que lo atendio ademas del vehiculo que alquilo y el descuento con el que dispone con la cantidad de dias que paso el vehiculo en alquiler.
select a.id_alquiler,d.porcentaje_descuento, c.nombre as nombre_cliente, e.nombre as nombre_empleado, v.tipo as tipo_Vehiculo, Dias_alquiler_vehiculo(a.fecha_salida ,a.fecha_llegada) as cantidad_de_dias from alquileres a 
inner join clientes c on a.id_cliente= c.id_cliente 
inner join empleados e on e.id_empleado=a.id_cliente 
inner join vehiculos v on v.id_vehiculo=a.id_cliente 
inner join descuento d on d.id_descuento= v.id_vehiculo
 order by 1; 