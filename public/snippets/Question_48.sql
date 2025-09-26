-- Underperforming SKUs: Products with lowest sales
SELECT p.product_name, SUM(o.quantity) AS total_units
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_units ASC
LIMIT 10;