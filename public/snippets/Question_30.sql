-- Sales by product/category: Shows product and total sales by category in decreasing order of total sales amount
SELECT p.category, p.product_name, SUM(o.quantity * o.price_per_unit) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category, p.product_name
ORDER BY total_sales DESC, p.category;