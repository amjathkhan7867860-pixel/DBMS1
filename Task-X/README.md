# Task X – Advanced SQL Query System

## Objective
Use subqueries and nested queries to answer business questions that require comparisons against calculated results.

## Topics Covered
- Single-row and multi-row subqueries
- Nested queries
- Products priced above the average
- Customers with the highest purchase totals
- Complex business filters and reports

## Example Queries
```sql
-- Products priced above the average product price
SELECT product_id, product_name, price
FROM Product
WHERE price > (SELECT AVG(price) FROM Product);

-- Customers whose IDs appear in the orders table
SELECT customer_id, customer_name
FROM Customer
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
);

-- Customers with the maximum number of orders
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS order_count
FROM Customer AS c
JOIN Orders AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) = (
    SELECT MAX(order_total)
    FROM (
        SELECT COUNT(*) AS order_total
        FROM Orders
        GROUP BY customer_id
    ) AS customer_order_counts
);
```

## Execution
1. Select the integrated e-commerce database.
2. Run the inner query independently to understand its result.
3. Run the complete outer query.
4. Test edge cases, including empty tables and customers with tied totals.

## Expected Outcome
Nested queries identify records based on calculated averages, maximum values, and membership in related datasets.

## Conclusion
Subqueries help express complex business rules without manually calculating intermediate values.
