-- Inventory Optimization : Should we optimize inventory levels based on product demand?
SELECT 
    product_id,
    SUM(quantity) AS total_sold,
    AVG(quantity) AS avg_order_quantity
FROM orders
GROUP BY product_id
ORDER BY total_sold DESC;