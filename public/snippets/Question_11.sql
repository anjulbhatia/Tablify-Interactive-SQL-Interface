-- Customers grouped by segment: How many customers are in each segment?
SELECT customer_segment, COUNT(*) AS total_customers
FROM customers
GROUP BY customer_segment;