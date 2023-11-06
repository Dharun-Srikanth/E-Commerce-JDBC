-- Creating DB
CREATE DATABASE IF NOT EXISTS e_commerce_db;

USE e_commerce_db;
-- Create Role Table
CREATE TABLE IF NOT EXISTS role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    role VARCHAR(255)
);

-- Insert data to role table
INSERT INTO role(role) values("ADMIN")
,("USER");

-- Select role table
SELECT 
    *
FROM
    role;

-- Create User table
CREATE TABLE IF NOT EXISTS user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255),
    roleId INT DEFAULT 2,
    password VARCHAR(255),
    deleteFlag BOOLEAN DEFAULT FALSE
);

-- Foreign key Constrains User
ALTER TABLE user ADD CONSTRAINT FK_rollId FOREIGN KEY (roleId) REFERENCES role(id);

-- Insert data to user
INSERT INTO user(email,roleId,password) VALUES("admin@admin.com",1,"admin");
INSERT INTO user(email,password)VALUES("roobinee@user.com","Roobinee"),
("barath@user.com","Barath"),
("dharun@user.com","Dharun"),
("sowmiya@user.com","Sowmiya"),
("sravani@user.com","Sravani");

-- Select for user
SELECT * FROM user;

-- Create Product Table
CREATE TABLE IF NOT EXISTS product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    categoryId INT NOT NULL,
    deleteFlag BOOLEAN DEFAULT FALSE
);
ALTER TABLE product ADD CONSTRAINT FK_categoryId FOREIGN KEY (categoryId) REFERENCES category(id); 
ALTER TABLE product
ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD created_by INT DEFAULT 1,
ADD updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
ADD updated_by INT DEFAULT 1;
         

-- Insert data to product
INSERT INTO product(productName,price,categoryId) VALUES("Top",650,1),
("Cotton Shirt",700,3),
("Crop Top",550,2),
("Saree",1500,6),
("Slipper",850,8),
("Salvar",1200,1);

-- Select for product
SELECT * FROM product;

-- Create Category Table
CREATE TABLE IF NOT EXISTS category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(255) NOT NULL,
    deleteFlag BOOLEAN DEFAULT FALSE
);
ALTER TABLE category
ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD created_by INT DEFAULT 1,
ADD updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
ADD updated_by INT DEFAULT 1;
         
             

-- Insert data to category
INSERT INTO category(categoryName) VALUES("Chudi"),
("Western Wear"),
("Mens Wear"),
("Electronics"),
("Women Wear"),
("Tradational"),
("Accessories"),
("Foot Wear");

-- Select for category
SELECT * FROM category;
             
             
-- Create Cart
CREATE TABLE IF NOT EXISTS cart (
    id INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    productId INT,
    count INT,
    isOrdered BOOLEAN DEFAULT FALSE,
    deleteFlag BOOLEAN DEFAULT FALSE
);
ALTER TABLE cart ADD CONSTRAINT FK_productId FOREIGN KEY (productId) REFERENCES product(id); 
ALTER TABLE cart ADD CONSTRAINT FK_userId_Cart FOREIGN KEY (userId) REFERENCES user(id);

-- Select for cart
SELECT * FROM cart;


-- Create Order
CREATE TABLE IF NOT EXISTS orders(
id int PRIMARY KEY AUTO_INCREMENT,
userId int,
statusId int DEFAULT 1, 
date DATE DEFAULT (CURRENT_DATE),
deleteFlag BOOLEAN DEFAULT false
);
ALTER TABLE orders ADD CONSTRAINT FK_userId_Orders FOREIGN KEY (userId) REFERENCES user(id); 
ALTER TABLE orders ADD CONSTRAINT FK_statusId FOREIGN KEY (statusId) REFERENCES status(id);

-- Select for orders
SELECT * FROM orders;

-- Create Status Table
CREATE TABLE IF NOT EXISTS status (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(255) NOT NULL,
    deleteFlag BOOLEAN DEFAULT FALSE
);

             
-- Insert data to status
INSERT INTO status(status) VALUES("Pending"),
("Delivared");

-- Select for status
SELECT * FROM status;

-- Create Order Detail
CREATE TABLE IF NOT EXISTS orderDetail (
    id INT PRIMARY KEY AUTO_INCREMENT,
    orderId INT,
    productId INT,
    count INT NOT NULL,
    deleteFlag BOOLEAN DEFAULT FALSE
);
ALTER TABLE orderDetail ADD CONSTRAINT FK_productId_orderDetail FOREIGN KEY (productId) REFERENCES product(id); 
ALTER TABLE orderDetail ADD CONSTRAINT FK_orderId FOREIGN KEY (orderId) REFERENCES orders(id);



-- Select for orderDetail
SELECT * FROM orderDetail;
SELECT * FROM role;
SELECT * FROM user;
SELECT * FROM product;
SELECT * FROM category;
SELECT * FROM cart;
SELECT * FROM orders;
SELECT * FROM status;
SELECT * FROM orderDetail;


