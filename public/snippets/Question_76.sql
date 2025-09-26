-- Customer Re-Engagement : Which customers should we target for re-engagement campaigns?
SELECT 
    c.customer_id,
    c.name,
    MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING DATE(last_order_date) < CURRENT_DATE- INTERVAL 6 MONTH;