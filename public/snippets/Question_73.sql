-- Stock by Category : Should we stock more of certain product categories?
SELECT 
    p.category,
    SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_quantity_sold DESC;
