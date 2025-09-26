-- Sales velocity: Sales velocity = (units sold/day since launch)
SELECT p.product_name,
       SUM(o.quantity) / GREATEST(DATE_DIFF('day', DATE(p.launch_date), CURRENT_DATE), 1) AS units_per_day
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name, p.launch_date;