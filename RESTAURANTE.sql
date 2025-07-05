create database delivery_db;

use delivery_db;

CREATE TABLE user (
	
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255) NOT NULL
    
);

/* Crear la Tabla Productos con Clave Foránea

Crea la tabla Productos y asegúrate de que restaurante_id sea una clave foránea que haga referencia al id de la tabla Restaurantes.

id: INT, clave primaria, autoincremental.

restaurante_id: INT, no puede ser nulo.

nombre: VARCHAR(100), no puede ser nulo.

descripcion: TEXT.

precio: DECIMAL(10, 2), no puede ser nulo.*/

CREATE TABLE restaurant(

 id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL,
 adress VARCHAR(255) NOT NULL UNIQUE,
 phone VARCHAR(20) NOT NULL

);

CREATE TABLE products(

    id INT PRIMARY KEY AUTO_INCREMENT,
	restaurant_id INT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)

);

CREATE TABLE orders(

	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)

);

CREATE TABLE orders_details(

	id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    cuantity INT NOT NULL,
    unitary_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)

);




