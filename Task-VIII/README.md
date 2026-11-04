# Task VIII – Database Relationship Analysis Using Joins

## Objective
Combine related records from customer, product, order, and payment tables to create complete order and purchase-history reports.

## Topics Covered
- `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`
- Joining multiple tables through primary-key and foreign-key relationships
- Complete order-detail reports
- Customer purchase history
- Multi-table business reports

## Expected Relationships
The integrated schema should connect:
- `Customer.customer_id` to `Orders.customer_id`
- `Orders.order_id` to `Order_Details.order_id`
- `Product.product_id` to `Order_Details.product_id`
- `Orders.order_id` to the relevant order/payment record

Check the actual foreign-key names in your database before running queries. The earlier standalone Payment exercise may use a customer name instead of an order foreign key; use the integrated payment structure for multi-table joins.

## Example Queries
```sql
-- Orders with matching customer details
SELECT o.order_id, c.customer_id, c.customer_name, o.order_date
FROM Orders AS o
INNER JOIN Customer AS c
    ON o.customer_id = c.customer_id;

-- Show every customer, including customers with no orders
SELECT c.customer_id, c.customer_name, o.order_id
FROM Customer AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id;

-- Order lines with product information
SELECT od.order_id, p.product_name, od.quantity, od.unit_price
FROM Order_Details AS od
INNER JOIN Product AS p
    ON od.product_id = p.product_id;
```

## Execution
1. Select the integrated e-commerce database.
2. Verify that primary keys and foreign keys are defined correctly.
3. Run each join separately.
4. Compare the row counts to understand which unmatched records each join retains.

## Expected Outcome
The result sets combine related information and show customer purchase histories, order line items, and records that may not have matching rows in another table.

## Conclusion
Joins connect normalized tables and provide a consolidated view of e-commerce transactions.
