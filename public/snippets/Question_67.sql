-- Cohort Retention: Retention by signup cohort
SELECT cohort_month, order_month, COUNT(DISTINCT customer_id) AS retained_customers
FROM (
  SELECT c.customer_id,
         MONTHNAME(DATE(c.signup_date)) AS cohort_month,
         MONTHNAME(DATE(o.order_date)) AS order_month
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
)
GROUP BY cohort_month, order_month;