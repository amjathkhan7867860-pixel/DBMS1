# Task XI – Database Automation Using Views and Procedures

## Objective
Create reusable database objects to simplify reporting and automate repeated database operations.

## Topics Covered
- Views for frequently used reports
- Stored procedures for order-processing workflows
- Stored functions for sales calculations
- Reusable and repeatable database operations
- Testing database objects

## Example View
```sql
CREATE OR REPLACE VIEW product_catalogue AS
SELECT p.product_id, p.product_name, p.price, p.stock,
       c.category_name
FROM Product AS p
LEFT JOIN Category AS c
    ON c.category_id = p.category_id;

SELECT * FROM product_catalogue;
```

## Example Stored Procedure
```sql
DELIMITER //
CREATE PROCEDURE GetCustomerOrders(IN p_customer_id INT)
BEGIN
    SELECT order_id, order_date
    FROM Orders
    WHERE customer_id = p_customer_id
    ORDER BY order_date DESC;
END //
DELIMITER ;

CALL GetCustomerOrders(1);
```

## Example Function
The final function should calculate a clearly defined sales value using the columns in the integrated schema. MySQL functions must declare a return type and should be tested with known input values.

## Testing
- Query the view and compare it with its underlying SELECT statement.
- Call procedures with valid and invalid customer/order identifiers.
- Test functions with zero, normal, and boundary values.
- Review errors and confirm that database data remains consistent.

## Important Notes
Use MySQL syntax and check that your account has the required CREATE VIEW, CREATE ROUTINE, and execution privileges. Avoid putting transaction control statements inside stored functions.

## Expected Outcome
Frequently used reports and operations can be executed consistently through database objects.

## Conclusion
Views, procedures, and functions improve reusability, maintainability, and automation in database applications.
