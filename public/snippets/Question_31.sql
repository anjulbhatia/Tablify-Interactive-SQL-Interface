-- Revenue by product launch cohorts: Revenue of each product in the launch month
SELECT EXTRACT('month' FROM DATE(p.launch_date)) AS launch_month,
       SUM(o.quantity * o.price_per_unit) AS total_revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY launch_month
ORDER BY launch_month;