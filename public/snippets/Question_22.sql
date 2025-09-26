-- Customer Lifetime Value (CLV) : CLV = (Average Purchase Value) x (Average Purchase Frequency) x (Average Customer Lifespan) 
SELECT c.customer_id,
       SUM(o.quantity * o.price_per_unit) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY lifetime_value DESC;