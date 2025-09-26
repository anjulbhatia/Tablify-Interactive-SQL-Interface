-- Customer acquisition rate: Signup Over Time
SELECT EXTRACT('month' FROM DATE(signup_date)) AS month, COUNT(*) AS new_customers
FROM customers
GROUP BY month
ORDER BY month;