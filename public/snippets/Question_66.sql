-- Signup Cohort: Group customers by signup month
SELECT EXTRACT('month'FROM DATE(signup_date)) AS cohort_month, COUNT(*) AS customers
FROM customers
GROUP BY cohort_month;