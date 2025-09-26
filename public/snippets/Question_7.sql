-- Highest Order Value: What is the highest order value during the period?
SELECT order_id, MAX(quantity * price_per_unit) AS "Max Order Value"
FROM orders
GROUP BY order_id
LIMIT 1;