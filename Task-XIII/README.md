# Task XIII – Database Security and Performance Optimization

## Objective
Control database access and improve query performance using privileges and indexes.

## Topics Covered
- Database users and roles
- `GRANT` and `REVOKE`
- Least-privilege access control
- Index creation
- Query-plan analysis and optimization

## Example Access-Control Commands
Run account-management statements using an administrator account. Replace the example account and host according to your MySQL setup.

```sql
CREATE ROLE IF NOT EXISTS 'report_reader';

GRANT SELECT ON ecommerce_db.* TO 'report_reader';

-- Example: remove write access if it was previously granted
REVOKE INSERT, UPDATE, DELETE
ON ecommerce_db.*
FROM 'report_reader';
```

## Example Index
```sql
CREATE INDEX idx_product_category
ON Product(category_id);

CREATE INDEX idx_orders_customer_date
ON Orders(customer_id, order_date);
```

## Performance Analysis
Use `EXPLAIN` before and after adding an index:

```sql
EXPLAIN
SELECT *
FROM Product
WHERE category_id = 1;
```

Compare the access method, selected key, estimated rows, and query cost where available.

## Security Guidelines
- Grant only the permissions required for each role.
- Do not use administrator accounts for routine application access.
- Do not store database passwords in public SQL files or GitHub.
- Test privilege changes with a separate low-privilege account.

## Expected Outcome
Users receive only authorized access, and indexes can reduce the work required for common searches and joins.

## Conclusion
Appropriate privileges protect data, while measured indexing improves database performance.
