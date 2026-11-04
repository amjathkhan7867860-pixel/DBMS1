# Task XII – Transaction Management System

## Objective
Demonstrate reliable order placement by grouping payment and inventory changes into database transactions.

## Topics Covered
- `START TRANSACTION`, `COMMIT`, and `ROLLBACK`
- ACID properties
- Payment and stock update workflow
- Consistency checks and error handling

## Example Transaction Pattern
Adapt the table and column names to the integrated schema before execution.

```sql
START TRANSACTION;

-- Example stock deduction for one product
UPDATE Product
SET stock = stock - 1
WHERE product_id = 1
  AND stock >= 1;

-- Check that exactly one product row was updated.
-- If no row was updated, issue ROLLBACK instead of continuing.

-- Insert the order and payment records here, using valid foreign keys.

COMMIT;
```

For a failed validation or payment step, execute `ROLLBACK` so partial changes are not retained. In application code, check affected-row counts and catch SQL errors before deciding to commit.

## ACID Properties
- **Atomicity:** all steps succeed together or are rolled back.
- **Consistency:** constraints and business rules remain satisfied.
- **Isolation:** concurrent transactions should not interfere incorrectly.
- **Durability:** committed changes persist.

## Testing
1. Test a valid order and confirm stock and order records are updated.
2. Test insufficient stock and confirm no partial order is saved.
3. Force a test failure before commit and verify rollback.
4. Confirm that a committed transaction remains stored.

## Important Notes
Use InnoDB tables for transaction support. Run tests with sample data and avoid testing rollback on important production records.

## Expected Outcome
Order, stock, and payment operations remain consistent even when an operation fails.

## Conclusion
Transactions protect the e-commerce database from incomplete or inconsistent updates.
