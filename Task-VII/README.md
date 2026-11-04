# Task VII – SQL Query Implementation for E-Commerce Database

## Objective
Practice basic SQL queries to retrieve, filter, sort, and report e-commerce data.

## Topics Covered
- `SELECT`, `WHERE`, `ORDER BY`, and `DISTINCT`
- Product searches by price, category, and stock availability
- Customer and product information retrieval
- Multiple filtering conditions using `AND`, `OR`, `IN`, and `BETWEEN`
- Basic business reports

## Database Tables
This task is designed for the integrated e-commerce schema, including:
- `Customer` – customer details
- `Category` – product categories
- `Product` – product name, category, price, and stock
- `Orders` – order details
- `Order_Details` – products and quantities in each order
- `Payment` – payment details

Use the exact table and column names created in the earlier tasks. MySQL is the target DBMS.

## Example Queries
```sql
-- Display all products
SELECT * FROM Product;

-- Find products within a price range
SELECT *
FROM Product
WHERE price BETWEEN 500 AND 5000;

-- Sort products from highest to lowest price
SELECT product_name, price
FROM Product
ORDER BY price DESC;

-- List distinct category IDs
SELECT DISTINCT category_id
FROM Product;

-- Find products that are in stock
SELECT product_name, stock
FROM Product
WHERE stock > 0;
```

## Execution
1. Open MySQL Workbench or the MySQL command line.
2. Select the e-commerce database using `USE database_name;`.
3. Confirm that the required tables contain sample records.
4. Run each query and inspect the result grid.

## Expected Outcome
The queries return relevant customer and product records, support product searches, and produce simple inventory and pricing reports.

## Conclusion
Basic SQL retrieval and filtering make it easier to explore e-commerce data and answer routine business questions.
