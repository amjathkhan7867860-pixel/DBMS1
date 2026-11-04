# Task XIV – Business Intelligence and AI Data Preparation

## Objective
Prepare analytical SQL reports and structured features that can be used for business intelligence and later machine-learning workflows.

## Topics Covered
- Analytical SQL reports
- Window functions: `RANK()` and `ROW_NUMBER()`
- Customer segmentation
- AI-ready dataset preparation
- Feature extraction

## Example Window Function
```sql
SELECT
    customer_id,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS spending_rank,
    ROW_NUMBER() OVER (ORDER BY total_spent DESC, customer_id) AS row_num
FROM (
    SELECT o.customer_id,
           SUM(od.quantity * od.unit_price) AS total_spent
    FROM Orders AS o
    JOIN Order_Details AS od ON od.order_id = o.order_id
    GROUP BY o.customer_id
) AS customer_sales;
```

## Example Customer Segmentation
A simple rule-based segmentation can classify customers by total purchase amount. Set thresholds based on the dataset and explain them in the report.

```sql
SELECT customer_id, total_spent,
       CASE
           WHEN total_spent >= 10000 THEN 'High Value'
           WHEN total_spent >= 3000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS customer_segment
FROM (
    SELECT o.customer_id,
           SUM(od.quantity * od.unit_price) AS total_spent
    FROM Orders AS o
    JOIN Order_Details AS od ON od.order_id = o.order_id
    GROUP BY o.customer_id
) AS sales_by_customer;
```

## AI Data Preparation
Potential features include order count, total spend, average order value, units purchased, and days since the latest order. Define each feature precisely and handle missing values and duplicate rows before exporting a dataset.

Do not include passwords, payment-card details, or unnecessary personal information in exported data.

## Expected Outcome
The task produces ranked sales reports, customer segments, and a structured dataset suitable for further analysis.

## Conclusion
Window functions and feature extraction help transform operational data into business insights and model-ready information.
