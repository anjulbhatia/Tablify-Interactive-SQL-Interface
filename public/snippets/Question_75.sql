-- Discontinue Products : Should we discontinue products with low sales and ratings?
SELECT 
    p.product_name,
    SUM(o.quantity) AS total_sold,
    p.rating
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name, p.rating
HAVING total_sold < 10 AND rating < 3.5;