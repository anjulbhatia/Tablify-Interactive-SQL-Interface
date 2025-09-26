-- Total Spend: Total spend per customer
SELECT c.customer_id, c.name, SUM(o.quantity * o.price_per_unit) AS total_spend
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;