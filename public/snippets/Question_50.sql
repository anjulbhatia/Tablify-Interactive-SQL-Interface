-- Signup Lag: Days from signup to first order
SELECT c.customer_id, MIN(DATE(o.order_date) - DATE(c.signup_date)) AS days_to_first_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.signup_date;