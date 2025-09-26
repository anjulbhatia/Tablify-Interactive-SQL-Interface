-- Repeat vs New: Classify customers
SELECT customer_id,
       CASE WHEN COUNT(order_id) > 1 THEN 'Repeat' ELSE 'New' END AS customer_type
FROM orders
GROUP BY customer_id;