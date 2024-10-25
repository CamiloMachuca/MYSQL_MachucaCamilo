CREATE DATABASE camilo_Examen;
USE camilo_Examen;

-- Tabla Solicitud
CREATE TABLE Solicitud(
Id_solicitud INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_Autor INT NOT NULL,
ISBN INT NOT NULL,
FOREIGN KEY (Id_Autor) REFERENCES Autores(Id_Autor),
FOREIGN KEY (ISBN) REFERENCES Libros(ISBN)
);
-- Tabla Autores
CREATE TABLE Autores(Id_Autor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(25) NOT NULL,
FechaNacimiento DATE NOT NULL,
Nacionalidad VARCHAR(25) NOT NULL
);
-- Tabla Libros
CREATE TABLE Libros(ISBN INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Titulo VARCHAR(25) NOT NULL,
Cantidad_stock INT NOT NULL,
Precio INT NOT NULL,
FechaPublicación DATE NOT NULL,
Categoria VARCHAR(30) NOT NULL,
Editorial VARCHAR(30) NOT NULL

);



-- Tabla Pedidos
CREATE TABLE Pedido(Id_pedidos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Estado VARCHAR(25) NOT NULL,
Fecha_de_compra DATE NOT NULL,
Cantidad INT NOT NULL,
Id_Cliente INT NOT NULL,
ISBN INT NOT NULL,
FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
FOREIGN KEY (ISBN) REFERENCES Libros(ISBN)
);


-- Tabla Clientes
CREATE TABLE Cliente(
Id_Cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(30) NOT NULL, 
Teléfono VARCHAR(15),
CorreoElectrónico VARCHAR(35),
Id_direccion INT NOT NULL,
FOREIGN KEY (Id_direccion) REFERENCES Direccion(Id_direccion)

);


-- Tabla Dirección
CREATE TABLE Direccion(
Id_direccion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Pais VARCHAR(25) NOT NULL,
Ciudad VARCHAR(25) NOT NULL,
Municipio VARCHAR(25) NOT NULL
);

-- Tabla Transacciones
CREATE TABLE Transación(Id_Transacciones INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Método_de_pago VARCHAR(25) NOT NULL,
Total INT,
Fecha_transacción DATE NOT NULL,
Id_pedidos INT NOT NULL,
FOREIGN KEY (Id_pedidos) REFERENCES Pedido(Id_pedidos)
);
DROP TABLE Dirección;
