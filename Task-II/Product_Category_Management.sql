-- Task II: Product and Category Management System
-- MySQL 8.0+

CREATE DATABASE IF NOT EXISTS ecommerce_task2;
USE ecommerce_task2;

-- 1. Create Category table (parent table)
CREATE TABLE IF NOT EXISTS Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
) ENGINE=InnoDB;

-- 2. Create Product table (child table)
CREATE TABLE IF NOT EXISTS Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    CONSTRAINT chk_product_price CHECK (price >= 0),
    CONSTRAINT chk_product_stock CHECK (stock >= 0),
    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES Category(category_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 3. Insert category records
INSERT INTO Category (category_name, description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Clothing', 'Men and women clothing'),
('Books', 'Educational and general books'),
('Shoes', 'Footwear and sports shoes');

-- 4. Insert product records
INSERT INTO Product (product_name, category_id, price, stock) VALUES
('Laptop', 1, 55000.00, 10),
('Mobile Phone', 1, 25000.00, 20),
('T-Shirt', 2, 799.00, 50),
('Jeans', 2, 1499.00, 30),
('Python Book', 3, 599.00, 15),
('Running Shoes', 4, 2999.00, 25);

-- 5. Display all category and product records
SELECT * FROM Category;
SELECT * FROM Product;

-- 6. Display products with their category names
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock
FROM Product AS p
INNER JOIN Category AS c
    ON p.category_id = c.category_id
ORDER BY c.category_name, p.product_name;

-- 7. Update product price and stock
UPDATE Product
SET price = 52999.00, stock = 12
WHERE product_id = 1;

-- Check the updated record
SELECT * FROM Product WHERE product_id = 1;

-- 8. Delete a product
-- Uncomment this statement when you want to delete product_id 6.
-- DELETE FROM Product WHERE product_id = 6;

-- 9. Category-wise report: number of products and total stock
SELECT
    c.category_id,
    c.category_name,
    COUNT(p.product_id) AS total_products,
    COALESCE(SUM(p.stock), 0) AS total_stock
FROM Category AS c
LEFT JOIN Product AS p
    ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY c.category_name;

-- 10. Category-wise product details and stock value
SELECT
    c.category_name,
    p.product_name,
    p.price,
    p.stock,
    (p.price * p.stock) AS stock_value
FROM Category AS c
INNER JOIN Product AS p
    ON c.category_id = p.category_id
ORDER BY c.category_name, p.product_name;

-- 11. Find products that are out of stock
SELECT product_id, product_name, category_id, price, stock
FROM Product
WHERE stock = 0;
