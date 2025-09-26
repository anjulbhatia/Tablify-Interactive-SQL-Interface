-- Launch Performance : Are recent product launches generating expected sales?
SELECT 
    p.product_name,
    SUM(o.quantity * o.price_per_unit) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE DATE(p.launch_date) >= CURRENT_DATE - INTERVAL '12 month'
GROUP BY p.product_name
ORDER BY revenue DESC;