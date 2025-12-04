CREATE DATABASE organic_shop;
USE organic_shop;

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(150),
    password VARCHAR(100)
);

-- Products Table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    price DECIMAL(10,2),
    image VARCHAR(200)
);

-- Cart Table
CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Default User (for testing)
INSERT INTO users (username, email, password) 
VALUES ('Test User', 'test@example.com', '123456');

-- Sample Products
INSERT INTO products (name, price, image) VALUES
('Turmeric Powder', 2.00, 'manjal.jpg'),
('Red Chilli Powder', 2.00, 'milaga.jpg'),
('Coriander Powder', 2.00, 'kothamalli.jpg');
