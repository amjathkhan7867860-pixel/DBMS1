# Task II - Product and Category Management System

## Objective
To design Product and Category tables, create primary-key and foreign-key relationships, manage product records, and generate category-wise product reports using MySQL.

## Database Design

### Category table
| Column | Data type | Constraint |
|---|---|---|
| category_id | INT | Primary key, auto increment |
| category_name | VARCHAR(100) | NOT NULL, UNIQUE |
| description | VARCHAR(255) | Optional |

### Product table
| Column | Data type | Constraint |
|---|---|---|
| product_id | INT | Primary key, auto increment |
| product_name | VARCHAR(150) | NOT NULL |
| category_id | INT | Foreign key referencing Category |
| price | DECIMAL(10,2) | NOT NULL, non-negative |
| stock | INT | NOT NULL, default 0, non-negative |

**Relationship:** One category can contain many products. Each product belongs to one category. The Product.category_id foreign key references Category.category_id.

## Operations Performed
1. Created the Category and Product tables.
2. Defined primary keys and a foreign key relationship.
3. Inserted sample categories and products.
4. Displayed product details with category names using INNER JOIN.
5. Updated a product's price and stock.
6. Included a sample DELETE statement (commented out so the sample data remains intact).
7. Generated category-wise reports showing product count and total stock.
8. Calculated stock value using price multiplied by stock.
9. Retrieved products that are out of stock.

## How to Run
1. Open MySQL Workbench or another MySQL 8.0+ client.
2. Open `Product_Category_Management.sql`.
3. Execute the script from top to bottom.
4. To test deletion, remove the comment marks from the DELETE statement and execute it separately.

## Important Notes
- Run the script in a fresh database named `ecommerce_task2`.
- The Category rows are inserted before Product rows because Product depends on Category.
- The foreign key uses `ON DELETE RESTRICT), so a category cannot be deleted while products still reference it.
- The sample update changes the Laptop record with product_id 1.
- The DELETE example is commented out to prevent accidental removal of sample data.

## Conclusion
The Product and Category Management System demonstrates table creation, primary and foreign keys, insertion, updating, deletion, joins, and category-wise reporting in MySQL.
