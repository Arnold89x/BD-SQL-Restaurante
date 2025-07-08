CREATE DATABASE delivery_db;

USE delivery_db;

CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255) NOT NULL
);

CREATE TABLE restaurant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    adress VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

CREATE TABLE orders_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    cuantity INT NOT NULL,
    unitary_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO user (name, email, phone, address) VALUES
('Mariana Paez', 'mariana.p@email.com', '315-1112233', 'Calle 80 # 70-30'),
('Ricardo Solis', 'ricardo.s@email.com', '316-4445566', 'Diagonal 45 # 12-34'),
('Valeria Luna', 'valeria.l@email.com', '317-7778899', 'Carrera 19 # 120-50, Apto 502');

INSERT INTO products (restaurant_id, name, description, price) VALUES
(1, 'Pizza Hawaiana', 'Pizza con piña, jamón y queso mozzarella.', 25.50),
(1, 'Pizza Pepperoni', 'Clásica pizza de pepperoni con extra queso.', 22.00),
(1, 'Lasaña de Carne', 'Capas de pasta con salsa boloñesa y bechamel.', 28.00),

(2, 'Rollo California', 'Rollo de cangrejo, aguacate y pepino.', 18.00),
(2, 'Nigiri de Salmón', 'Finas lonjas de salmón sobre arroz de sushi.', 15.50),
(2, 'Yakimeshi Mixto', 'Arroz frito con verduras, pollo y camarón.', 21.00),

(3, 'Tacos al Pastor', 'Tres tacos de cerdo marinado con piña.', 16.00),
(3, 'Quesadilla de Champiñones', 'Tortilla de harina con queso y champiñones.', 14.00),
(3, 'Burrito de Carne Asada', 'Gran burrito con carne, frijoles y arroz.', 20.50);

INSERT INTO orders (user_id, restaurant_id, status) VALUES
(2, 3, 'EN PREPARACION');

SET @id_orders = LAST_INSERT_ID();

INSERT INTO orders_details (order_id, product_id, cuantity, unitary_price) VALUES
(@id_orders, 7, 2, 16.00),
(@id_orders, 8, 1, 14.00);

UPDATE user SET phone = '315-6434187' WHERE id = 3;

UPDATE products SET price = 50.00 WHERE name = 'Pizza Hawaiana';

SELECT name, description, price FROM products WHERE restaurant_id = 2;

SELECT * FROM orders WHERE user_id = 2;

SELECT name, email FROM user WHERE address LIKE '%Avenida%';



INSERT INTO user (name, email, phone, address) VALUES
('Sofia Castro', 'SOFIA.C@email.com', '317-7899', 'Carrera 9 # 12-5, Apto 202');

INSERT INTO orders (user_id, restaurant_id, status) VALUES
(4, 1, 'EN PREPARACION');

UPDATE orders SET status = 'CANCELADO' WHERE user_id = 4;

SELECT * FROM user;
SELECT * FROM orders;