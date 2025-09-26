-- Signup to First Order Lag: Avg lag from signup to first order
SELECT AVG(DATE(first_order) - DATE(signup_date)) AS avg_days
FROM (
  SELECT c.customer_id, MIN(o.order_date) AS first_order, c.signup_date
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  GROUP BY c.customer_id, c.signup_date
);