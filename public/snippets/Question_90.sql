-- Cohort LTV : Which customer cohorts deliver the highest lifetime value (LTV)?
SELECT 
    DATE_FORMAT(signup_date, '%Y-%m') AS cohort_month,
    SUM(quantity * price_per_unit) AS cohort_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY cohort_month
ORDER BY cohort_month;