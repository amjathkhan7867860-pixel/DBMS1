# Task IX – Sales and Customer Analytics System

## Objective
Use SQL aggregate functions to summarize sales, compare customers, identify popular products, and analyze category performance.

## Topics Covered
- `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
- Total sales and order summaries
- Top customers by purchase amount
- Best-selling products
- Category-wise sales analysis

## Example Queries
```sql
-- Number of orders
SELECT COUNT(*) AS total_orders
FROM Orders;

-- Basic product price statistics
SELECT
    COUNT(*) AS product_count,
    AVG(price) AS average_price,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM Product;

-- Quantity sold by product
SELECT p.product_id, p.product_name,
       SUM(od.quantity) AS units_sold
FROM Order_Details AS od
JOIN Product AS p ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;

-- Category-wise quantity sold
SELECT c.category_id, c.category_name,
       SUM(od.quantity) AS units_sold
FROM Order_Details AS od
JOIN Product AS p ON p.product_id = od.product_id
JOIN Category AS c ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;
```

## Important Notes
- Calculate sales using the actual order-detail amount or `quantity * unit_price`, according to the schema.
- Exclude cancelled orders and failed payments when the report is intended to represent completed sales.
- Use `GROUP BY` for category, customer, or product summaries.

## Execution
Select the e-commerce database, verify sample order data, and run each aggregate query. Compare totals with the underlying order records.

## Expected Outcome
The reports summarize sales activity and reveal high-value customers, popular products, and stronger-performing categories.

## Conclusion
Aggregate queries turn transaction-level records into useful business performance measures.
