-- Churned vs Active: Active vs churned
SELECT customer_id,
       CASE WHEN MAX(DATE(order_date)) < CURRENT_DATE - INTERVAL '180 days' THEN 'Churned' ELSE 'Active' END AS status
FROM orders
GROUP BY customer_id;