-- MOM Customers: Month-over-month customer growth
SELECT DATE_TRUNC('month', signup_date) AS month,
       COUNT(*) AS new_customers,
       LAG(COUNT(*)) OVER (ORDER BY DATE_TRUNC('month', signup_date)) AS prev_month,
       (COUNT(*) - LAG(COUNT(*)) OVER (...)) / NULLIF(LAG(COUNT(*)) OVER (...),0) * 100 AS mom_growth
FROM customers
GROUP BY month;